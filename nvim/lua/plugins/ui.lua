return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = false,
        integration = {
          nvimtree = true,
          lualine = true,
          bufferline = true,
        }
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- NvimTree
  { "nvim-tree/nvim-web-devicons" },
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          }
        }
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
  },


  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = true,
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' },
          disabled_filetypes = {},
          always_divide_middle = true,
        }
      })
    end
  },

  -- Bufferline (tab bar)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          separator_style = "slant",
        }
      })
    end
  },

  -- Some Plugins
}
