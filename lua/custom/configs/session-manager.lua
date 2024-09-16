
local M = {
  plugins = {
    user = {
    ["Shatur/neovim-session-manager"] = {
      config = function()
        local Path = require('plenary.path')
        local config = require('session_manager.config')
        require('session_manager').setup({
          sessions_dir = Path:new(vim.fn.stdpath('data'), 'sanchir'), -- Указываем папку для сессий
          path_replacer = '__', -- Символ для замены разделителя пути
          colon_replacer = '++', -- Символ для замены двоеточия
          autoload_mode = { config.AutoloadMode.CurrentDir, config.AutoloadMode.LastSession },
          autosave_last_session = true, -- Автоматическое сохранение последней сессии при выходе и при переключении проектов
          autosave_ignore_not_normal = true, -- Не сохраняет сессию, если нет открытых буферов или все они не записываемые или не перечисленные.
          autosave_ignore_dirs = {}, -- Список директорий, в которых сессия не будет автоматически сохранена
          autosave_ignore_filetypes = { -- Все буферы этих типов файлов будут закрыты перед сохранением сессии.
            'gitcommit',
                        },
          autosave_only_in_session = false, -- Всегда автоматически сохраняет сессию. Если true, то только после активации сессии.
          max_path_length = 80, -- Максимальная длина абсолютного пути в имени файла сессии
        })

        -- Добавление автокоманды для загрузки последней сессии при запуске Vim
        vim.api.nvim_create_autocmd({"VimEnter"}, {
          callback = function()
            local session_manager = require('session_manager')
            session_manager.load_last_session()
          end,
        })
      end
    }
  }
    },
}



return M
