set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add Plugins
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/tpope/vim-rails.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-surround'
Plugin 'Shougo/neocomplete.vim'
Plugin 'bling/vim-airline'
Plugin 'https://github.com/tpope/vim-unimpaired'
"Plugin 'ngmy/vim-rubocop'
"Plugin 'vim-ruby/vim-ruby'

call vundle#end()            " required
filetype plugin indent on    " required

set softtabstop=4
set backspace=indent,eol,start
set expandtab "Hit tab to produce number of spaces"
set incsearch "show next matching result"
set hlsearch "highlight search terms"
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set scrolloff=10 "distance to screen edge"
set nowrap "no line wrap"
set shiftwidth=2 "width of auto indenting"
set shiftround "use shiftwidth when indenting with < >"
" set nu 'show line numbers'
set noswapfile " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
autocmd BufWritePre * %s/\s\+$//e
"set clipboard=unnamedplus "make pasting possible to other terminal"
set encoding=utf-8
set ruler
set showcmd
set autoread
set autoindent

" set mouse=a

" Highlight text when it's longer than 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set guifont=Fira\ Mono:h12

set list listchars=tab:»·,trail:·,nbsp:·

" ctrlp config
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'

"" ctags
set tags+=.git/tags
map <Leader>rt :!ctags --tag-relative --extra=+f -Rf.git/tags --exclude=.git,pkg --languages=-javascript,sql<CR><CR>

" rubocop
"let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop --auto-correct '
"let g:vimrubocop_config = '/Users/mlammers/projects/scompler/.rubocop.yml'
"autocmd BufWritePre *.rb :RuboCop

"tenderlove
"http://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html
" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

" Always use autocompletion
 let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :Ag --vimgrep "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  nnoremap \ :Ag<SPACE>
endif

" syntastic setup
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_loc_list_height = 5
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_javascript_eslint_exec = 'node_modules/eslint/bin/eslint.js'

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_warning_symbol = '💩'

  highlight link SyntasticErrorSign SignColumn
  highlight link SyntasticWarningSign SignColumn
  highlight link SyntasticStyleErrorSign SignColumn
  highlight link SyntasticStyleWarningSign SignColumn

" end syntastic setup

let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256 " 256 color mode

set background=dark
syntax on
