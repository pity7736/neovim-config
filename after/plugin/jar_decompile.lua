local function find_sources_jar(classes_jar_path, class_path)
  local kt_file = class_path:gsub("Kt%.class$", ".kt"):gsub("%.class$", ".kt")
  local lib_hint = classes_jar_path:match("transformed/([^/]+)/jars/classes%.jar")
  if not lib_hint then return nil, nil end
  local lib_name = lib_hint:match("^(.-)%-%d")

  local sources = vim.fn.glob(
    vim.fn.expand("~") .. "/.gradle/caches/modules-2/files-2.1/**/" .. lib_hint .. "-sources.jar",
    false, true
  )
  if #sources == 0 then
    sources = vim.fn.glob(
      vim.fn.expand("~") .. "/.gradle/caches/modules-2/files-2.1/**/" .. (lib_name or "") .. "*-sources.jar",
      false, true
    )
  end
  if #sources == 0 then return nil, nil end
  return sources[1], kt_file
end

local function find_definition_line(lines, word)
  -- prefer: fun word( at start of line
  for i, line in ipairs(lines) do
    if line:match("^%s*fun%s+" .. word .. "%s*[(<]") then
      return i, lines[i]:find(word, 1, true)
    end
  end
  -- then: any fun word(
  for i, line in ipairs(lines) do
    if line:match("fun%s+" .. word .. "%s*[(<]") then
      return i, lines[i]:find(word, 1, true)
    end
  end
  -- fallback: first occurrence
  for i, line in ipairs(lines) do
    if line:find(word, 1, true) then
      return i, lines[i]:find(word, 1, true)
    end
  end
  return nil, nil
end

local function fill_buf(buf, content, ft)
  vim.bo[buf].modifiable = true
  vim.bo[buf].swapfile = false
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].filetype = ft
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
  vim.bo[buf].modifiable = false
end

local function jump_to_word(buf, word)
  if not word or word == "" then return end
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local lnum, col = find_definition_line(lines, word)
  if lnum then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == buf then
        vim.api.nvim_win_set_cursor(win, { lnum, col - 1 })
      end
    end
  end
end

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "jar://*",
  callback = function(args)
    local uri = args.file
    local jar_path, class_path = uri:match("jar://(/[^!]+)!/(.+)")
    if not jar_path or not class_path then return end

    local buf = args.buf
    local sources_jar, kt_path = find_sources_jar(jar_path, class_path)

    if sources_jar and kt_path then
      local tmpdir = vim.fn.tempname()
      vim.fn.mkdir(tmpdir, "p")
      vim.fn.system({ "unzip", "-q", "-o", sources_jar, kt_path, "-d", tmpdir })
      local src_file = tmpdir .. "/" .. kt_path
      if vim.fn.filereadable(src_file) == 1 then
        local content = table.concat(vim.fn.readfile(src_file), "\n")
        fill_buf(buf, content, "kotlin")
        return
      end
    end

    -- fallback: decompile the .class file
    local tmpdir = vim.fn.tempname()
    vim.fn.mkdir(tmpdir, "p")
    vim.fn.system({ "unzip", "-q", "-o", jar_path, class_path, "-d", tmpdir })
    local class_file = tmpdir .. "/" .. class_path
    if vim.fn.filereadable(class_file) == 0 then
      vim.notify("Could not extract class from jar", vim.log.levels.ERROR)
      return
    end
    local result = vim.fn.system({ "cfr-decompiler", class_file })
    fill_buf(buf, result, "kotlin")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "jar://*",
  callback = function(args)
    local word = vim.g.lsp_last_gd_word
    if not word or word == "" then return end
    vim.g.lsp_last_gd_word = nil
    local buf = args.buf
    vim.defer_fn(function()
      jump_to_word(buf, word)
    end, 150)
  end,
})
