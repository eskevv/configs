require("plugins")
require("keybinds")
require("theme")

vim.o.updatetime = 50
vim.o.wrap = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.showcmd = false
vim.o.guicursor = "n-v-c-i:block"
vim.o.guicursor = "n:blinkon100"
vim.o.incsearch = true
vim.o.signcolumn = "no"
vim.o.showmode = false
vim.o.scrolloff = 8
vim.o.showtabline = 2
vim.o.numberwidth = 4

require('luatab').setup{
   devicon = function() return '' end,
}

vim.cmd [[
  set clipboard+=unnamedplus
  set indentkeys-=:
  set cinkeys-=:
]]

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = 20 or function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = true,   -- when neovim changes it current directory the terminal will change it's own when next it's opened
  highlights = {
 --   -- highlights which map to a highlight group name and a table of it's values
 --   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
    },
    NormalFloat = {
    },
    FloatBorder = {
    },
  },
  -- shade_terminals = false,      -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  -- shading_factor = 3, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = true,      -- whether or not the open mapping applies in insert mode
  terminal_mappings = true,    -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true,         -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float',
  close_on_exit = true,        -- close the terminal window when the process exits
  -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
   float_opts = {
     -- The border key is *almost* the same as 'nvim_open_win'
     -- see :h nvim_open_win for details on borders however
     -- the 'curved' border is a custom border type
     -- not natively supported but implemented in this plugin.
     border = 'double',
     -- like `size`, width and height can be a number or function which is passed the current terminal
     -- width = <value>,
     -- height = <value>,
     -- winblend = 20,
     -- highlights = {
     --   background = "Normal"
     -- }
     -- zindex = <value>,
   },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}


require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("nvim-autopairs").setup {}
local cfg = {}
require "lsp_signature".setup(cfg)

require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --  disable = function(lang, buf)
    --    local max_filesize = 100 * 1024 -- 100 KB
    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --    if ok and stats and stats.size > max_filesize then
    --      return true
    --    end
    --  end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.diagnostic.config({
  signs = false,
  virtual_text = false,
  underline = true,
  update_in_insert = true
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = { 'menu', 'kind', 'abbr' },

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'Ω',
        luasnip = '⋗',
        buffer = 'λ',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.kind = string.format("[%s]", item.kind)
      item.menu = menu_icon[entry.source.name]
      local max_abbr = 60
      item.abbr = string.sub(item.abbr, 1, max_abbr)
      if #item.abbr >= max_abbr then
        item.abbr = item.abbr .. "..."
      end

      return item
    end,
  },
})
