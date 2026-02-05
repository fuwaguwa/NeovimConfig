return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.providers = opts.sources.providers or {}

      -- Set Copilot lower than path/buffer but higher than snippets
      opts.sources.providers.copilot = opts.sources.providers.copilot or {}
      opts.sources.providers.copilot.score_offset = 0

      opts.keymap = opts.keymap or {}
      return opts
    end,
  },
}
