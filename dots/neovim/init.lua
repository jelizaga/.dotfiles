-- ========== UI & Editing ==========
local o, wo, bo = vim.o, vim.wo, vim.bo
o.termguicolors = true

-- Numbers
wo.number = true
wo.relativenumber = true
wo.cursorline = true

-- Tabs
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

-- Files
o.backup = false

-- Wrap / text layout
o.colorcolumn = "80"
o.linebreak = true
o.textwidth = 80
o.wrap = true

-- Search (pick one: highlight + quick clear on <Esc>)
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.showmatch = true

-- Mode, history, cmd feedback
o.showmode = true
o.history = 888
o.showcmd = true

-- Wildmenu
o.wildignore =
  "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.odt,*.mp4"
o.wildmenu = true
o.wildmode = "list:longest,full"

-- Misc
o.hidden = true
o.mouse = "a"
o.errorbells = false
o.scrolloff = 8

vim.opt.termguicolors = true

-- ========== Transparency (so Kitty shows through) ==========
local function transparent()
  local groups = {
    "Normal","NormalNC","NormalFloat","FloatBorder",
    "SignColumn","EndOfBuffer","LineNr","CursorLineNr",
    "StatusLine","StatusLineNC","TabLine","TabLineFill","TabLineSel"
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent })
transparent()
vim.o.winblend = 10
vim.o.pumblend = 10
