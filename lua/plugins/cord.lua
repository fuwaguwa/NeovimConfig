return {
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    opts = {
      usercmds = {
        enable = true,
      },
      editor = {
        client = "neovim",
        tooltip = "The Superior Text Editor",
        icon = nil,
      },
      display = {
        theme = "catppuccin",
        flavor = "accent",
        view = "asset",
      },
      idle = {
        enabled = true,
        show_status = true,
        timeout = 300000,
        unidle_on_focus = true,
      },
    },
  },
}
