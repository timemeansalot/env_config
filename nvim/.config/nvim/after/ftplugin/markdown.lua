-- surround plug config for latex writing
require("nvim-surround").buffer_setup({
  surrounds = {
    ["e"] = {
      add = function()
        local env = require("nvim-surround.config").get_input ("Environment: ")
        return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
      end,
    },
    ["f"] = {
      add = { "**", "**" },
      find = "**.-**",
      delete = "^(**)().-(**)()$",
    },
    ["i"] = {
      add = { "*", "*" },
      find = "*.-*",
      delete = "^(*)().-(*)()$",
    },
    ["u"] = {
      add = { "<u>", "</u>" },
      find = "<u>.-</u>",
      delete = "^(<u>)().-(</u>)()$",
    },
    ["d"] = {
      add = { "`", "`" },
      find = "`.-`",
      delete = "^(`)().-(`)()$",
    },
    ["c"] = {
      add = { "$", "$" },
      find = "$.-$",
      delete = "^($)().-($)()$",
    },
  },
})
