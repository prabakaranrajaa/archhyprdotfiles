if true then
  return {}
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = {
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
      }

      opts.sections = {
        lualine_a = { "branch" },
        lualine_b = {
          {
            "mode",
            fmt = function(str)
              return str
            end,
          },
        },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = true,
            update_in_insert = false,
            always_visible = true,
            cond = function()
              return vim.bo.filetype ~= "markdown"
            end,
          },
        },
        lualine_x = {
          {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
          },
          "fileformat",
          "filetype",
        },
        lualine_y = { "location" },
        lualine_z = {
          function()
            local current = vim.fn.line(".")
            local total = vim.fn.line("$")
            local chars = { "", "", "" }
            local ratio = current / total
            local index = math.ceil(ratio * #chars)
            return chars[index] .. " " .. math.floor(ratio * 100) .. "%%"
          end,
        },
      }

      return opts
    end,
  },
}
