local o, wo, bo = vim.o, vim.wo, vim.bo

o.termguicolors = false

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

-- Wrap & Text Layout
o.colorcolumn = "80"
o.linebreak = true
o.textwidth = 80
o.wrap = true

-- Search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.showmatch = true

-- Wildmenu
o.wildignore = "*.docx,*.jpg,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.odt,*.mp4"
o.wildmenu = true
o.wildmode = "list:longest,full"

-- Misc
o.hidden = true
o.mouse = "a"
o.errorbells = false
o.scrolloff = 8

