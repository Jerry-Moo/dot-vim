let s:menus = {}

let s:menus.dein = { 'description': '⚔️  Plugin management' }
let s:menus.dein.command_candidates = [
  \   ['🐬 Dein: Plugins update       🔸', 'call dein#update()'],
  \   ['🐬 Dein: Plugins List         🔸', 'Denite dein'],
  \   ['🐬 Dein: RecacheRuntimePath   🔸', 'call dein#recache_runtimepath()'],
  \   ['🐬 Dein: Update log           🔸', 'echo dein#get_updates_log()'],
  \   ['🐬 Dein: Log                  🔸', 'echo dein#get_log()'],
  \ ]

let s:menus.project = { 'description': '🛠  Project & Structure' }
let s:menus.project.command_candidates = [
  \   ['🐳 File Explorer        🔸<Leader>e',        'Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>'],
  \   ['🐳 Outline              🔸<LocalLeader>t',   'TagbarToggle'],
  \   ['🐳 Mundo Tree           🔸<Leader>m',  'MundoToggle'],
  \ ]

let s:menus.files = { 'description': '📁 File tools' }
let s:menus.files.command_candidates = [
  \   ['📂 Denite: Find in files…    🔹 ',  'Denite grep:.'],
  \   ['📂 Denite: Find files        🔹 ',  'Denite file/rec'],
  \   ['📂 Denite: Buffers           🔹 ',  'Denite buffer'],
  \   ['📂 Denite: MRU               🔹 ',  'Denite file/old'],
  \   ['📂 Denite: Line              🔹 ',  'Denite line'],
  \ ]

let s:menus.tools = { 'description': '⚙️  Dev Tools' }
let s:menus.tools.command_candidates = [
  \   ['🐠 Git commands       🔹', 'Git'],
  \   ['🐠 Git log            🔹', 'Denite gitlog:all'],
  \   ['🐠 Tagbar             🔹', 'TagbarToggle'],
  \   ['🐠 File explorer      🔹', 'Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>'],
  \ ]

let s:menus.config = { 'description': '🔧 Zsh Tmux Configuration' }
let s:menus.config.file_candidates = [
  \   ['🐠 Zsh Configurationfile            🔸', '~/.zshrc'],
  \   ['🐠 Tmux Configurationfile           🔸', '~/.tmux.conf'],
  \ ]

let s:menus.dot_nvim = {'description': '💎 dot-nvim Configuration files'}
let s:menus.dot_nvim.file_candidates = [
  \   ['🐠 MainVimrc          settings: vimrc               🔹', $VIM_PATH.'/config/vimrc'],
  \   ['🐠 General            settings: general.vim         🔹', $VIM_PATH.'/config/general.vim'],
  \   ['🐠 DeinConfig         settings: deinrc.vim          🔹', $VIM_PATH.'/config/deinrc.vim'],
  \   ['🐠 FileTypes          settings: filetype.vim        🔹', $VIM_PATH.'/config/filetype.vim'],
  \   ['🐠 Installed       LoadPlugins: plugins.yaml        🔹', $VIM_PATH.'/config/dein/plugins.yaml'],
  \   ['🐠 Global   Key    Vimmappings: mappings.vim        🔹', $VIM_PATH.'/config/mappings.vim'],
  \   ['🐠 Global   Key Pluginmappings: Pluginmappings      🔹', $VIM_PATH.'/config/layers/dot-nvim/config.vim'],
  \ ]

call denite#custom#var('menu', 'menus', s:menus)
