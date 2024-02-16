-- Mason (Install, update and delete Language Servers, DAP servers, linters and formatters)
require("mason").setup()
local mason_lspconfig = require('mason-lspconfig')

local language_servers_to_install = {
  html = {},      -- HTML
  cssls = {},     -- CSS
  tsserver = {},   -- JavaScript, TypeScript
}

-- Preinstall Language Servers
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(language_servers_to_install)
})

-- Actions that will execute on every buffer that attaches to Language Server
local function lsp_attach_actions(_, bufnr)
  -- Helper function to set keymaps
  local function nmap(what_to_press, what_to_execute)
    vim.keymap.set('n', what_to_press, what_to_execute, { buffer = bufnr })
  end

  nmap('K', vim.lsp.buf.hover)            -- Press K twice to jump into the floating window. C-o to exit

  nmap('gd', vim.lsp.buf.definition)      -- To go back C-t may be useful! (go back in Tag Stack)
  nmap('ge', vim.diagnostic.open_float)  
  nmap('gi', vim.lsp.buf.implementation)  
  nmap('gr', vim.lsp.buf.references)  

  nmap('<leader>r', vim.lsp.buf.rename)   -- After this we need to do :wa (write all) because it could change multiple buffers across the project

  nmap('[d', vim.diagnostic.goto_prev)  
  nmap(']d', vim.diagnostic.goto_next)  
end

-- From kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua)
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = lsp_attach_actions
    }
  end
})


