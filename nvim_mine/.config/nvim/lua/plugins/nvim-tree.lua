return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
	  {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "open nvim tree panel"},
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
	    view = {
		    width = 25,
	    },

    })
  end,
}
