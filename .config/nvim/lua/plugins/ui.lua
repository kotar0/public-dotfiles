return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- Animation
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
      opts.cursor = {
        enable = false,
      }
    end,
  },

  -- Disable IndentScope Animation
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
        delay = 0,
      },
    },
  },
  --Status line(Bottom bar)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      return {
        options = {
          theme = "night-owl",
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_c = {
            {
              "filename",
              path = 1,
            },
          },
        },
      }
    end,
  },
  -- Filename top right corner
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-web-devicons",
    },
    priority = 1200,
    config = function()
      require("incline").setup({
        hide = { cursorline = true },
        highlight = {
          groups = {
            inclinenormal = { guifg = "#011627", guibg = "#C792EA" },
            inclinenormalnc = { guifg = "#D6DEEB", guibg = "#010d18" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 0 } },

        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"

          local buffer = {
            { ft_icon, guifg = ft_color },
            { " " },
            { filename, gui = modified },
          }
          return buffer
        end,
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
          
__/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\\\\__/\\\\____________/\\\\_______/\\\\\_______/\\\\\\\\\\\\\\\_______/\\\\\_______/\\\\\\\\\\\\\\\_        
 _\///////\\\/////__\/\\\///////////__\/\\\\\\________/\\\\\\_____/\\\///\\\____\///////\\\/////______/\\\///\\\____\/\\\///////////__       
  _______\/\\\_______\/\\\_____________\/\\\//\\\____/\\\//\\\___/\\\/__\///\\\________\/\\\_________/\\\/__\///\\\__\/\\\_____________      
   _______\/\\\_______\/\\\\\\\\\\\_____\/\\\\///\\\/\\\/_\/\\\__/\\\______\//\\\_______\/\\\________/\\\______\//\\\_\/\\\\\\\\\\\_____     
    _______\/\\\_______\/\\\///////______\/\\\__\///\\\/___\/\\\_\/\\\_______\/\\\_______\/\\\_______\/\\\_______\/\\\_\/\\\///////______    
     _______\/\\\_______\/\\\_____________\/\\\____\///_____\/\\\_\//\\\______/\\\________\/\\\_______\//\\\______/\\\__\/\\\_____________   
      _______\/\\\_______\/\\\_____________\/\\\_____________\/\\\__\///\\\__/\\\__________\/\\\________\///\\\__/\\\____\/\\\_____________  
       _______\/\\\_______\/\\\\\\\\\\\\\\\_\/\\\_____________\/\\\____\///\\\\\/___________\/\\\__________\///\\\\\/_____\/\\\\\\\\\\\\\\\_ 
        _______\///________\///////////////__\///______________\///_______\/////_____________\///_____________\/////_______\///////////////__

      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
