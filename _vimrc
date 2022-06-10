syntax on
scriptencoding utf-8
set encoding=utf-8

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
"set expandtab  "use spaces instead of <tab>
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
nnoremap ,<Space> :noh<CR>
nnoremap <ESC> :noh<CR>
set backspace=indent,eol,start "allow to remove with backspace in edit mode
set clipboard=unnamed
set mouse=a
set scrolloff=7
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:· "pretty highlight invisible symbols
let @m="Версия SBC сдвинута\n\n"

let g:TerminusFocusReporting=0 "supress E349 https://stackoverflow.com/questions/43533302/e349-no-identifier-under-cursor

set colorcolumn=80
highlight ColorColulmn ctermbg=0 guibg=lightgrey

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:kien/ctrlp.vim.git'
"Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'

call plug#end()


colorscheme gruvbox
set background=dark

if executable('rg')
       let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
let mapleader = " "

" Explore settings
" let g:netrw_browse_split=4 "3
" nelet g:netrw_banner=1 "disable netrw banner
" let g:netrw_winsize=25

"Disable cache since CtrlP is fast (?) enough
let g:ctrlp_use_caching=1

"nnoremap j gj
"nnoremap k gk
nnoremap H gT
nnoremap L gt

nnoremap K gd
nnoremap <leader>i K

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :q<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>re :bro ol<CR>
nnoremap <leader>oe :Vexplore<bar>let netrw_browse_split=4<CR>

"ripgrep required
nnoremap <leader>fi :Rg<SPACE>

" Window resizing
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Quick .vimrc editing
nnoremap <leader>se :tabe ~/.vimrc<CR>
augroup AutoCommandGroup
	autocmd!
	autocmd bufwritepost .vimrc source $MYVIMRC "Auto reload saved vimrc
augroup END

" Integrated terminal
nnoremap <leader>t :wincmd v<bar> :wincmd l<bar> :term <CR>
" Exit on Esc
tnoremap <Esc> <C-\><C-n>

"nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Russian keymap support
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set keymap=russian-jcukenwin
set iminsert=0 " Чтобы при старте ввод был на английском, а не русском (start > i)
set imsearch=0 " Чтобы при старте поиск был на английском, а не русском (start > /)
" Дополнительно можно добавить:
" Чтобы вместо Ctrl-^ нажимать Ctrl-L
inoremap <C-l> <C-^>
" Вставка как в обычных редакторах в режиме ввода
inoremap <C-v> <C-r>*
" Смена цвета курсора
highlight lCursor guifg=NONE guibg=Cyan

" Поддержка комментариев vim-commentary через <Alt+/>
imap <M-/> <C-o><Plug>CommentaryLine
nmap <M-/> <Plug>CommentaryLine
xmap <M-/> <Plug>CommentaryLine


" Запрет нажатий Ctrl+z на Windows
if has("win32") && has("nvim")
  nnoremap <C-z> <nop>
  inoremap <C-z> <nop>
  vnoremap <C-z> <nop>
  snoremap <C-z> <nop>
  xnoremap <C-z> <nop>
  cnoremap <C-z> <nop>
  onoremap <C-z> <nop>
endif

" Navigating in insert and command mode
imap <C-z> <S-left>
imap <C-x> <S-right>
cmap <C-z> <S-left>
cmap <C-x> <S-right>


" Cribs
"
" setf <language> 			" Set filetype
" :bro ol					" List of recent files
" :lcd %:p:h				" Change current directory only for the current window
" za 						" Toggle folding
" =							" Operator to indent lines
" set guifont=* 			" For selecting from available fonts
" sb <buffer_name>			" To open buffer in split
" Ctrl-w t Ctrl-w H			" To change split from horizontally to vertically
" vim "!\!.!" -new_console	" Editor config for far manager in conemu
