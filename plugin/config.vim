let $NVIM_TUI_ENABLE_TRUE_COLOR=1
lua << EOF

require("bufferline").setup{
  options = {
    numbers = "buffer_id",
    number_style = "superscript",
    show_buffer_icons = false
  }
}

require('lualine').setup{
  sections = {
    lualine_x = {
      {
        'filetype',
        colored = false,
      }
    }
  }
}

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    -- 'standardrb',
    -- 'solargraph',
    'tsserver',
    'quick_lint_js',
    'html',
  }
})

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['tsserver'].setup { capabilities = capabilities }
require('lspconfig')['quick_lint_js'].setup { capabilities = capabilities }
require('lspconfig')['html'].setup { capabilities = capabilities }

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "ruby",
--   group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }), -- also this is not /needed/ but it's good practice 
--   callback = function()
--     vim.lsp.start {
--       name = "standard",
--       cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/standardrb", "--lsp" },
--     }
--   end,
-- })

-- require('lspconfig')['solargraph'].setup{}

EOF




set mouse=a
set complete-=i
set sidescroll=1
set ttimeoutlen=50
set encoding=utf-8
set clipboard=unnamedplus
set wildmode=list:longest
set fileformats=unix,dos,mac
set listchars=tab:▒░,trail:∞
set backspace=indent,eol,start
set completeopt=menuone,longest,preview
set tabstop=2 softtabstop=0 expandtab shiftwidth=2
set list showmatch showmode shiftround ttimeout hidden showcmd hlsearch smartcase nobackup nowritebackup noswapfile termguicolors cursorline lazyredraw nowrap autoindent smarttab incsearch relativenumber number expandtab

tnoremap <Esc> <C-\><C-n>

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

:tnoremap <C-j> :bprevious<CR>
:tnoremap <C-k> :bnext<CR>

:inoremap <C-j> :bprevious<CR>
:inoremap <C-k> :bnext<CR>

:nnoremap <C-j> :bprevious<CR>
:nnoremap <C-k> :bnext<CR>

set tags+=.tags
nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=log -f .tags<cr>
