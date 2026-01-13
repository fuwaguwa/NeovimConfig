-- In lua/plugins/copilot.lua
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        keymap = {
          accept = "<C-g>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
      },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
}
