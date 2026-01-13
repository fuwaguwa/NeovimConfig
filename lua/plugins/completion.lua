return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = function(_, opts)
      -- Add copilot to sources
      opts.sources = opts.sources or {}
      opts.sources.default = { "lsp", "copilot", "path", "snippets", "buffer" }

      -- Configure copilot provider with kind icon
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
        transform_items = function(_, items)
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
          local kind_idx = #CompletionItemKind + 1
          CompletionItemKind[kind_idx] = "Copilot"
          for _, item in ipairs(items) do
            item.kind = kind_idx
          end
          return items
        end,
      }

      -- Add Copilot icon to kind_icons
      opts.appearance = opts.appearance or {}
      opts.appearance.kind_icons = opts.appearance.kind_icons or {}
      opts.appearance.kind_icons.Copilot = ""

      -- Keep your existing keymaps
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = { "snippet_forward", "fallback" }
      opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }
      opts.keymap["<C-n>"] = { "select_next", "fallback" }
      opts.keymap["<C-p>"] = { "select_prev", "fallback" }
      opts.keymap["<CR>"] = { "accept", "fallback" }

      return opts
    end,
  },
}
