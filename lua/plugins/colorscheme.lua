return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        mini = {
          enabled = true,
        },
      },
      custom_highlights = function(colors)
        return {
          -- Indent lines
          IblIndent = { fg = "#a6adc8" },
          IblScope = { fg = "#a6adc8" },
          MiniIndentscopeSymbol = { fg = "#a6adc8" },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
      vim.schedule(function()
        -- Main transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

        -- Keep floats/popups opaque
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- REMOVED
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" }) -- REMOVED
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" }) -- REMOVED

        -- -- Explorer transparency
        -- vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "SnacksNormalNC", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "SnacksWinBar", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "SnacksBackdrop", { bg = "none" })

        -- Status/Win bars
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
        vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })

        -- Cursor & sign
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

        -- Brighter elements
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#a6adc8", bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f5c2e7", bold = true, bg = "none" })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#9399b2", italic = true })

        -- LSP inlay hints
        vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#7f849c", bg = "none", italic = true })

        -- Indent lines
        vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#6c7086", bg = "none" })
        vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#a6adc8", bg = "none" })
      end)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
