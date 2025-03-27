if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=#b4b3f2 guibg=NONE
colorscheme catppuccin_mocha
