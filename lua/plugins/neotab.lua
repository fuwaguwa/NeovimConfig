return {
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
      tabkey = "<Tab>",
      act_as_tab = true,
      behavior = "nested",
      pairs = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
      },
      exclude = {},
      smart_punctuators = {
        enabled = true,
        semicolon = {
          enabled = true,
          ft = { "cs", "c", "cpp", "java", "javascript", "typescript", "rust" },
        },
        escape = {
          enabled = true,
          triggers = {},
        },
      },
    },
  },
}
