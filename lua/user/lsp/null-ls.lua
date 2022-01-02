local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.stylua,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_exec(
				[[
          augroup lsp_document_formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
        ]],
				false
			)
		end
	end,
})
