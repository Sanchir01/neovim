local M = {
  filetype = {
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
    ["go"] = {
            require("formatter.filetypes.go").goimports,
      
       require("formatter.filetypes.go").gofmt,
    },
    },
 
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

return M
