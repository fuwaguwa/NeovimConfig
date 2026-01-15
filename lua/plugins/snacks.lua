return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        shell = "/usr/bin/fish",
      },
      indent = {
        hl = {
          "SnacksIndent1", -- Regular indent lines
        },
      },
      dashboard = {
        preset = {
          header = "",
        },
      },
      scroll = {
        enabled = true,
      },
      -- Enable explorer
      explorer = {
        replace_netrw = true,
      },
      picker = {
        toggles = {
          hidden = { icon = "h", value = true },
          ignored = { icon = "i", value = true },
        },
        actions = {
          delete_projects = function(picker, _)
            Snacks.picker.actions.close(picker)
            local items = picker:selected({ fallback = true })
            vim.defer_fn(function()
              vim.cmd("edit " .. vim.fn.stdpath("state") .. "/shada/main.shada")
              for _, item in ipairs(items) do
                local regex = "^\\S\\(\\n\\s\\|[^\\n]\\)\\{-}"
                  .. vim.fn.escape(item.file, "/\\")
                  .. "\\_.\\{-}\\n*\\ze\\(^\\S\\|\\%$\\)"
                vim.cmd("%s/" .. regex .. "//g")
              end
              vim.cmd("write!")
              vim.cmd("rshada!")
              vim.cmd("bwipeout!")
              vim.notify("Deleted " .. #items .. " project(s)", vim.log.levels.INFO)
              Snacks.picker.projects()
            end, 100)
          end,
        },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            follow_file = true,
            auto_close = true,
            jump = { close = true },
            layout = {
              preset = "vertical",
              backdrop = true,
            },
          },
          files = {
            hidden = true,
            ignored = true,
            exclude = { "**/target/**", "**/.git/**", "**/node_modules/**" },
          },
          grep = {
            exclude = { "**/target/**", "**/.git/**", "**/node_modules/**" },
          },
          projects = {
            win = {
              input = {
                keys = {
                  ["<C-x>"] = { "delete_projects", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
