return {
  "monaqa/dial.nvim",
  opts = function(_, opts)
    local augend = require("dial.augend")

    local months = augend.constant.new({
      elements = {
        "january",
        "february",
        "march",
        "april",
        "may",
        "june",
        "july",
        "august",
        "september",
        "october",
        "november",
        "december",
      },
      word = true,
      cyclic = true,
      preserve_case = true,
    })

    local directions = augend.constant.new({
      elements = {
        "up",
        "right",
        "down",
        "left",
      },
      word = false,
      cyclic = true,
      preserve_case = true,
    })

    opts.dials_by_ft = opts.dials_by_ft or {}
    opts.groups = opts.groups or {}
    opts.groups.default = opts.groups.default or {}
    table.insert(opts.groups.default, months)
    table.insert(opts.groups.default, directions)

    return opts
  end,
}
