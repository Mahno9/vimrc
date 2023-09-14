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
" useless comment
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
set wrap
set splitbelow
set splitright
let @m="Версия SBC сдвинута\n\n"


" coc vimrc example
set hidden
" Space for messages
set cmdheight=2
set updatetime=300
set shortmess+=c " (Подозрительно) Don't pass messages to |ins-completion-menu|.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>kf  <Plug>(coc-format-selected)
nmap <leader>kf  <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')



let g:TerminusFocusReporting=0 "supress E349 https://stackoverflow.com/questions/43533302/e349-no-identifier-under-cursor

set foldmethod=syntax
set foldlevelstart=99

" Relative (hybrid) line number
set number relativenumber

set colorcolumn=80
highlight ColorColulmn ctermbg=0 guibg=lightgrey

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Extension for fugitive - github
Plug 'vim-utils/vim-man'
" Plug 'git@github.com:kien/ctrlp.vim.git'
"Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'bfrg/vim-cpp-modern'
Plug 'jiangmiao/auto-pairs'

"Telescope
Plug 'nvim-lua/plenary.nvim' " Lua funcitons, required for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Go-lang
" Info has been taken from https://nikgalushko.com/post/vim_as_goуang_ide/
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call plug#end()


colorscheme gruvbox
set background=dark

if executable('rg')
   let g:rg_derive_root='true'
   let g:rg_highlight='true'
endif

let mapleader = " "

" Explore settings
" let g:netrw_browse_split=4 "3
" let g:netrw_banner=0 "disable netrw banner
let g:netrw_winsize=50 " %
let g:netrw_liststyle=3 " Tree instead of plain view


" CtrlP configuring
" let g:ctrlp_use_caching=1 "Disable cache since CtrlP is fast (?) enough
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_working_path_mode = 'ra'

" Swap Path slashes
nnoremap <leader>sp :s/\\/\//g<CR>
" Filter lines
nnoremap <leader>ef :v//d<left><left>
nnoremap <leader>e0 :v/0_0/d<CR>
" Remove lines
nnoremap <leader>ed :g//d<left><left>

" Replace substrings
nnoremap <leader>er :%s///g<left><left><left>
vnoremap <leader>er "sy:%s/<C-r>s//g<left><left>

" Quick search selected
vnoremap / "sy/<C-r>s

" Swap .h and .cpp
nnoremap <expr> <M-k><M-o> ":e %<.".(expand('%:e') == 'h' ? 'cpp' : 'h')."<CR>"

nnoremap j gj
nnoremap k gk
nnoremap H gT
nnoremap L gt
nnoremap о gj
nnoremap л gk

nnoremap K gd
nnoremap <leader>i K

" Open file from QuickFix window in new tab
autocmd FileType qf nnoremap <buffer> T <C-W><Enter><C-W>T

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" nnoremap <leader><leader> :wincmd w<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>re :bro ol<CR>
nnoremap <leader>ow :25Lexplore<CR>
nnoremap <leader>oe :25Vexplore<CR>
nnoremap <leader>fo :wincmd gF<CR>
nnoremap <leader>fn :let @*=expand("%:t:r")<CR>
nnoremap <leader>fp :let @*=expand("%:p")<CR>
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <leader>ss :set syntax=

" Window resizing
nnoremap <silent> <Leader>= :resize +10<CR>
nnoremap <silent> <Leader>- :resize -10<CR>
nnoremap <silent> <Leader>< :vertical resize +10<CR>
nnoremap <silent> <Leader>> :vertical resize -10<CR>

" Telescope bindings
nnoremap <leader><leader>f <CMD>Telescope find_files<CR>
nnoremap <leader><leader>g <CMD>Telescope live_grep<CR>
nnoremap <leader><leader>b <CMD>Telescope buffers<CR>
nnoremap <leader><leader>p <CMD>Telescope pickers<CR>
nnoremap <leader><leader>h <CMD>Telescope oldfiles<CR>
nnoremap <leader><leader>r <CMD>Telescope resume<CR>

"ripgrep required
nnoremap <leader>fi :Rg -i -tcpp -txml<SPACE>
vnoremap <leader>fi "sy:Rg <C-r>s

" Navigating in command mode
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>
cnoremap <C-h> <C-Left>
cnoremap <C-l> <C-Right>

" " Quick .vimrc editing
nnoremap <leader>se :tabe ~/.vimrc<CR>
augroup AutoCommandGroup
	autocmd!
	autocmd bufwritepost .vimrc source $MYVIMRC "Auto reload saved vimrc
augroup END

" Quick open two side diff
:command V :vnew<bar>difft<bar>:wincmd w<bar>:difft<bar>
:command H :new<bar>difft<bar>:wincmd w<bar>:difft<bar>

" Sum yanked numbers
:command SumCopied :echo eval(substitute(@", '\n', '+', 'g'))

" Integrated terminal
nnoremap <leader>ot :wincmd v<bar> :wincmd l<bar> :term <CR>
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
vnoremap <C-c> y
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


" Diff config section

set diffopt=vertical,filler,context:3,indent-heuristic,algorithm:patience,internal
" Detect if vim is started as a diff tool (vim -d, vimdiff)
" NOTE: Does not work when you start Vim as usual and enter diff mode using :diffthis
if &diff
  let s:is_started_as_vim_diff = 1
  "syntax off
  setlocal nospell
endif

nnoremap <silent> <leader>w :x<CR>
nnoremap <silent> <leader>Q :q!<CR>
nnoremap <silent> <leader>q :call <SID>QuitWindow()<CR>
function s:QuitWindow()
  if get(s:, 'is_started_as_vim_diff', 0)
    qall
    return
  endif

  quit
endfunction

" Status Line {  
	function! GitStatus()
		let [a,m,r] = GitGutterGetHunkSummary()
		if a != "0" || m != "0" || r != "0"
			return printf('|+%d ~%d -%d|', a, m, r)
		else
			return printf('')
		endif
	endfunction

	set laststatus=2                             " always show statusbar  
	set statusline=  
	set statusline+=%-10.3n\                     " buffer number  
	set statusline+=%{GitStatus()}\             " GitGutter status   
	set statusline+=%f\                          " filename   
	set statusline+=%h%m%r%w                     " status flags  
	set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
	set statusline+=%=                           " right align remainder  
	set statusline+=0x%-8B                       " character value  
	set statusline+=%-14(%l,%c%V%)               " line, character  
	set statusline+=%<%P                         " file position  
"}

"Git Gutter
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled=1 " enable on startup
let g:gitgutter_map_keys=0
nnoremap <leader>gl :GitGutterLineNrHighlightsToggle<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gh :Gclog -- %<CR>

nnoremap <leader>, :v/0_0/d<CR>:%s/\[.*\]\s0_0\s//g<CR>

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
