local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    severity_sort = true,
  }
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })

  local which_key = require "which-key"
  which_key.register({
    l = {
      name = "lsp",
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition"},
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
      I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementations to quickfix list" },
      U = { "<cmd>lua vim.lsp.buf.references()<cr>", "references to quickfix list" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
      -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "run a code action" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature information" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format current buffer" },
    },
    d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "show diagnostics" },
    D = {
      name = "diagnostics",
      d = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "buffer diagnostics to location list" },
      n = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "previous diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "next diagnostic" },
    }
  }, {
    buffer = bufnr,
    prefix = "<leader>",
    nowait = true,
  })

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
  vim.notify "'cmp_nvim_lsp_ok' plugin not installed"
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
