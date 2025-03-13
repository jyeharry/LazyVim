-- Array of file names indicating root directory. Modify to your liking.
local root_names = { ".git", "Makefile" }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local Functions = {
  prompt_command = function(command, prompt, fallback)
    local user_input = vim.fn.input(prompt)

    if user_input ~= "" then
      vim.cmd(command .. " " .. user_input)
    elseif fallback ~= "" and fallback ~= nil then
      vim.cmd(command .. " " .. fallback)
    else
      vim.cmd(string.format(command))
    end
  end,

  getVisualSelection = function()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
      return text
    else
      return ""
    end
  end,

  set_root = function()
    -- Get directory path to start search from
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
      return
    end
    path = vim.fs.dirname(path)

    -- Try cache and resort to searching upward for root directory
    local root = root_cache[path]
    if root == nil then
      local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
      if root_file == nil then
        return
      end
      root = vim.fs.dirname(root_file)
      root_cache[path] = root
    end

    -- Set current directory
    vim.fn.chdir(root)
  end,
}

return Functions
