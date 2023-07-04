local plugins = {

  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function() require('custom.telescope') end,
    -- the run command compiles the extension
    requires = {{'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }},
    -- this makes the plugin loading lazy with the specified commands, files, and events
    cmd = 'Telescope',
    module = 'telescope',
    event = 'BufWinEnter',
  },

  { "rcarriga/nvim-notify" },

  { "folke/neodev.nvim", opts = {} },

  {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
          theme = 'hyper', -- theme is doom and hyper default is hyper
          disable_move = false,   -- default is false disable move keymap for hyper
          shortcut_type = "number",  -- shortcut type 'letter' or 'number'
          change_to_vcs_root = true,  -- default is false,for open file in hyper mru. it will change to the root of vcs
          config = {
            header = {}, -- type is table def
            week_header = {
              enable = true,  --boolean use a week header
            },
            shortcut = {
              { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
              {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
              },
              {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a',
              },
              {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd',
              },
            },
            hide = {
              statusline = true,   -- hide statusline default is true
              tabline = true,      -- hide the tabline
              winbar = true,       -- hide winbar
            },
            preview = {
              command = "",       -- preview command
              file_path = "",     -- preview file path
              file_height = 10,   -- preview file height
              file_width = 10,    -- preview file width
            },
          }
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },



  {
    "nvim-neorg/neorg",
    lazy = false,
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              default_workspace = "docs",
              index = "index.norg", -- The name of the main (root) .norg file
              workspaces = {
                docs = "~/Documents",
                workspace = "~/workspace",
              },
            },
          },
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

}
return plugins
