call plug#begin('~/.vim/plugged')
  Plug 'bronson/vim-visual-star-search'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'cskeeters/vim-smooth-scroll'
  Plug 'elzr/vim-json'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'honza/vim-snippets'
  Plug 'itchyny/lightline.vim'
  Plug 'jparise/vim-graphql'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'mhartington/oceanic-next'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'othree/html5-syntax.vim'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'posva/vim-vue'
  Plug 'preservim/nerdtree'
  Plug 'rhysd/git-messenger.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'unblevable/quick-scope'
  Plug 'vim-test/vim-test'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'Yggdroot/indentLine'
call plug#end()

let mapleader="\<Space>"

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bc :bp <BAR> bd #<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bf :bf<CR>
nnoremap <leader>bl :bl<CR>
nnoremap <leader>cu :set cursorcolumn!<CR>
nnoremap <silent> <leader>cl :noh<CR>
nnoremap <leader>re :%s///g<left><left>
noremap Q <nop>

"Prefix yank with leader yanks to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Ctrl-c to exit modes.
map <C-c> <Esc>
map! <C-c> <Esc>

" Exit terminal insert mode w/escape.
tnoremap <ESC> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  vsplit term://bash
  set nonumber norelativenumber
endfunction

nnoremap <C-n> :call OpenTerminal()<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme OceanicNext
highlight CursorLineNr guifg=#cdd3de guibg=none
highlight EndOfBuffer guifg=#1b2b34
highlight Search cterm=reverse gui=reverse
highlight Comment cterm=italic
highlight HighlightedyankRegion cterm=reverse gui=reverse

set confirm
set expandtab
set hidden
set ignorecase
set lazyredraw
set list listchars=tab:→\ ,trail:·
set nobackup
set nofoldenable
set noruler
set noshowcmd
set noshowmode
set noswapfile
set nottimeout
set nowrap
set nowritebackup
set number relativenumber
set shiftround
set shiftwidth=2
set shortmess=aWcFstToOI
set showtabline=2
set signcolumn=yes
set smartcase
set softtabstop=2
set splitbelow
set splitright
set synmaxcol=512
set tabstop=2
set undofile
set updatetime=300
set wig+=node_modules,.tags,log,.git,tmp,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg,*.pdf,*.DS_Store?

" Disable automatic comment insertion on carriage return.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"  Remove whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Relative numbers in Normal mode, absolute numbers in Insert mode.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ======================= fzf ======================================

nnoremap <leader>bu :Buffers<CR>
nnoremap <leader>fi :Files<CR>
nnoremap <leader>ma :Marks<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>ta :Tags<CR>

let g:fzf_colors = { 'border':  ['fg', 'Label'] }
let g:fzf_tags_command = 'ctags --recurse=yes --quiet=yes --languages=+javascript,-html,-css,-json'
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }

" ======================= Git-Messenger =========================

let g:git_messenger_always_into_popup = v:true

" ======================= Vim-Json ================================

let g:vim_json_syntax_conceal = 0

" ======================= Quick Scope ===============================================

highlight QuickScopePrimary guifg=none gui=underline cterm=underline
highlight QuickScopeSecondary guifg='#fbc2a2' gui=underline cterm=underline

" ======================= LightLine ===============================

let g:lightline = {
  \   'colorscheme': 'oceanicnext',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified', 'method' ]
  \     ]
  \   },
  \   'component': { 'lineinfo': '~ %3l:%-2v' },
  \   'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
  \   'component_type': { 'buffers': 'tabsel' }
  \ }

let g:lightline.tabline = { 'left': [ ['buffers'] ], 'right': [ ['close'] ] }

" ======================= LightLine-Bufferline ===============================

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed = '[No Name]'
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" ======================= Smooth Scroll ========================

let g:ms_per_line=10

" ======================= NERDTree ========================

let g:NERDTreeMapQuit="<C-c>"
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" ======================= Vim-Test ========================

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#strategy = "neovim"
let g:test#javascript#runner = 'jest'

" ======================= IndentLines ========================

let g:indentLine_char = '┊'
nmap <Leader>il :IndentLinesToggle<CR>


" ======================= HighlightedYank ========================

let g:highlightedyank_highlight_duration = 3000

" =================== RainbowParentheses =====================

let g:rainbow#max_level = 12
let g:rainbow#pairs = [['(',')'], ['[',']'], ['{','}']]

" All Oceanic Next besides white and colors
let g:rainbow#blacklist = ['#1b2b34', '#343d46', '#4f5b66', '#65737e', '#a7adba', '#c0c5ce', '#cdd3de']

augroup rainbow_filetypes
  autocmd!
  autocmd FileType vim,css,html,javascript,ruby,vue,json RainbowParentheses
augroup END

" ======================= Vim-Vue ========================

" Limit syntax highlighting to following preprocessors.
let g:vue_pre_processors = ['sass', 'scss']

" ======================= CoC ========================

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show all diagnostics
nnoremap <silent> <Leader>cd  :<C-u>CocList diagnostics<cr>

" Manage extensions
nnoremap <silent> <Leader>cx  :<C-u>CocList extensions<cr>

" Show commands
nnoremap <silent> <Leader>cc  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <Leader>co  :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent> <Leader>cs  :<C-u>CocList -I symbols<cr>

" =============== Coc-Snippets ==================

" Tab to trigger completion and jump to next location.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" =============== Coc-Pairs ==================

" Bracket open on <CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
