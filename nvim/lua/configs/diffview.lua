local M = require('diffview').setup {
        keymaps = {
          file_panel = {
            {"n", "<leader>cF", function()
              local file_path = require'diffview.lib'.get_current_view().panel.cur_file.path
              local left_commit = require'diffview.lib'.get_current_view().left.commit
              local right_commit = require'diffview.lib'.get_current_view().right.commit
              local cmd = "GIT_EXTERNAL_DIFF='difft --display side-by-side-show-both' git diff " .. left_commit .. ":" .. file_path .. " " ..
                right_commit .. ":" ..  file_path

              local popup_buf = vim.api.nvim_create_buf(false, true)
              local width = vim.o.columns-6
              local height = vim.o.lines-6
              local win_opts = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                relative = "editor",
                width = width,
                height = height,
                anchor = "NW",
                row = 3,
                col = 3,
                noautocmd = true,
              }
              local popup_win = vim.api.nvim_open_win(popup_buf, true, win_opts)

              vim.fn.termopen(cmd)
            end, {desc= "Diff with difftastic"}}
          },
        },
      }

return M
