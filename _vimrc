set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set number

" For correct erase symbol when backspace
set nocompatible
set backspace=2

highlight lCursor guifg=NONE guibg=Cyan
highlight SpellBad ctermfg=Black ctermbg=Red

" :AirlineTheme base16_3024
let g:airline_theme='base16_3024'


set termencoding=utf-8
set fileencodings=utf-8,cp1251
set encoding=utf-8
set sessionoptions=curdir
set clipboard=unnamed
set title
set mouse=a
set autoread

"Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Esc> :noh<CR><Esc>
nnoremap <Esc>^[ <Esc>^[

"Folding
set foldmethod=syntax
"set foldmethod=indent
set foldlevel=1
set nofoldenable

"Shift
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent

" Prepare DEBUG register
let @d="--DEBUG--"

" Quickly edit vimrc = )
map  :tabnew $MYVIMRC<CR>

"Saving and running
map <F2>  :w ++enc=utf-8<CR>
vmap <F2> <C-[><F2>
imap <F2> <C-[><F2>
" NERD tree
map <F3> :NERDTreeToggle<CR>
vmap <F3> <C-[><F3>
imap <F3> <C-[><F3>
 " Prolog scripting
" map <F3> :w!<CR>:!echo "::Script started" && swipl -g listing. -l % && echo "::Sript finished"<CR>
" vmap <F3> <C-[><F3>
" imap <F3> <C-[><F3>
 " Python scripting
map <F4> :w!<CR>:!echo "::Script started" && python % && echo "::Sript finished"<CR>
vmap <F4> <C-[><F4>
imap <F4> <C-[><F4>

" Solve problem with ←[?2004l←[?2004l symbols on Windows
"set paste

 " Bash scripting
"map <F3> :w! script.sh<CR>:!bash script.sh <CR>
"vmap <F3> <C-[><F3>
"imap <F3> <C-[><F3>
 " C++ compiling and running
"map <F3> :w<CR>:!g++ -g % -lglut -lGLU -lGL -lX11 && echo "--> Compilation complete" && ./a.out && echo "<-- Programm closed" && rm ./a.out<CR>
"map <F3> :w<CR>:!gcc -g % && echo "--> Compilation complete" && ./a.out && echo "<-- Programm closed" && rm ./a.out<CR>
 " Other compiling
"map <F3> :w<CR>:!bash compile.sh main.cpp<CR>
"map <F4> :!dosbox -exit compile.bat <CR>
"map <F4> :w!<CR>:!echo "::Script started" && python fake.py && echo "::Script finished"<CR>


"Reload config file
map <F5> :so $MYVIMRC<CR>:echo ".vimrc reloaded"<CR>
vmap <F5> <C-[><F5>
imap <F5> <C-[><F5>

" Fold toggle
" inoremap <F9> <C-O>za
" nnoremap <F9> za
" onoremap <F9> <C-C>za
" vnoremap <F9> zf
" map <F9> za
" vmap <F9> <C-[><F9>
" imap <F9> <C-[><F9>


" Quit on F12
map <F12> :q!<CR>
imap <F12> <C-[>:q!<CR>
vmap <F12> <C-[>:q!<CR> 

"Tabs and Splits
map <F10> <C-w>v<C-w>l:Explore<CR>
map <C-t> :tabnew<CR>
imap <C-t> <C-[><C-t>
vmap <C-t> <C-[><C-t>
map H gT
map L gt
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l

" Jumps in current line
map k gk
map j gj


" OWN FUNCTIONS

if has("win32") || has("win64")
	" Jumps throw file
	map <C-U> <C-U><C-L>
	map <C-D> <C-D><C-L>
endif

" TODO
" command! RemoveMM execute ":%s/\^M//g<CR>"

" Меню выбора
set wildmenu
set wcm=<Tab>

" Навигация
map gm :call cursor(0, virtcol('$')/2)<CR> " Go to middle


" Refresh ctags for current file
function! RefreshCTags_func()
	:lcd %:p:h
	:!ctags -R
endfunction()
command! RefreshCTags execute "call RefreshCTags_func()"
" Now you can jump to definition with Ctrl-]

" Show files from the past = )
command! FilesHistory execute "browse old"


" Settings for GUI modes
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Courier_New:h12:cANSI:qDRAFT
		colorscheme wombat
		" Use ~x on an English Windows version or ~n for French.
		au GUIEnter * simalt ~x
	else
		colorscheme elflord
		hi Search cterm=NONE ctermfg=grey ctermbg=darkcyan
	endif
endif

" Spell check
" menu SetSpell.ru  :set spl=ru spell<CR>
" menu SetSpell.en  :set spl=en spell<CR>
" menu SetSpell.de  :set spl=de spell<CR>
" menu SetSpell.off :set nospell<CR>
" map <F7> :emenu SetSpell.<Tab>
" " Pick alternative word
" imap <F8> <Esc> z=<CR>i
" map <F8> z=<CR>

" GotoDefinition for C
" function! GotoDefinition()
"   let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
" endfunction
"map <F4> :call GotoDefinition()<CR>

"Autoaddition
" function! InsertTabWrapper(direction)
" let col = col('.') - 1
" if !col || getline('.')[col - 1] !~ '\k'
" 	return "\<tab>"
" elseif "backward" == a:direction
" 	return "\<c-p>"
" else
" 	return "\<c-n>"
" endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
" inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"Plugins for HTML and XML
"filetype plugin on

" Automated tabulation when paste
"let &t_SI .= "\<Esc>[?2004h"
"let &t_EI .= "\<Esc>[?2004l"
"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"function! XTermPasteBegin()
"	set pastetoggle=<Esc>[201~
"	set paste
"	return ""
"endfunction


set updatetime=10
let highlight_on_cursor=0
function! ToggleHighlightOnCursort_func()
	if g:highlight_on_cursor
		let g:highlight_on_cursor=0
	else
		let g:highlight_on_cursor=1
	endif
endfunction
function! HighlightWordUnderCursor()
	if g:highlight_on_cursor == 0
		match none
		return
	endif
	if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
		exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/' 
	else 
		match none 
	endif
endfunction
autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
command! ToggleHighlightOnCursort execute "call ToggleHighlightOnCursort_func()"

command! VimrcEdit execute "tabedit $MYVIMRC"


" OWN FUNCTIONS

" Plugins start
"
call plug#begin('~/.vim/plugged')
"Plug 'Shougo/neocomplete.vim' 										" Autocomplete file names (vim need to be compiled with +lua)
" let g:neocomplete#enable_at_startup=1
" " let g:neocomplete#enable_smart_case=1
" let g:neocomplete#force_overwrite_completefunc=1

"Plug 'junegunn/seoul256.vim'										" Beaty coloschemes for vim
"Plug 'junegunn/vim-easy-align' " Too complex for me
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 			" Tree explorer for vim
let NERDTreeMapOpenInTab='\r'
Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' } 	" Autocompeter for code
Plug 'Keithbsmiley/investigate.vim' 								" Documentation for words under cursor
nnoremap <F1> :call investigate#Investigate()<CR>
Plug 'octol/vim-cpp-enhanced-highlight' 							" Highlight for C++ 
Plug 'tpope/vim-commentary' 										" Comment
Plug 'vim-airline/vim-airline' 										" Airline on the bottom. >__<
Plug 'vim-airline/vim-airline-themes' 								" And themes for it
Plug 'sheerun/vim-wombat-scheme' 									" Wombat colorscheme
Plug 'mkomitee/vim-gf-python' 										" 'gf' command for python classes. Goes to file with source (vim need to be compiled with +python)
Plug 'majutsushi/tagbar' 											" Browse tags from file
nmap <F8> :TagbarToggle<CR>
Plug 'davidhalter/jedi-vim'											" Autocomplete for Python (vim need to be compiled with +python)
Plug 'WolfgangMehner/c-support'										" IDE plugin for C/C++
Plug 'terryma/vim-multiple-cursors'									" Multiple cursors for vim. <C-n> mapped
call plug#end()


" Cribs
"
" Windows version with all necessery packages and libraries downloaded from:
" https://tuxproject.de/projects/vim/x64/
"
" setf <language> 			" Set filetype
" :browse ol				" List of recent files
" :lcd %:p:h				" Change current directory only for the current window
" za 						" Toggle folding
" =							" Operator to indent lines
" set guifont=* 				" For selecting from available fonts
" sb <buffer_name>			" To open buffer in split
" Ctrl-w t Ctrl-w H			" To change split from horizontally to vertically
" gvim --remote-tab-silent 	" To open file in new tab instead of window
" vim "!\!.!" -new_console	" Editor config for far manager in conemu
