" =cc================== beg vundle ========== set nocompatible              " be iMproved, required
filetype off                  " required
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
 
Plugin 'Valloric/YouCompleteMe'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'oblitum/YouCompleteMe'
 
call vundle#end()            " required
filetype plugin indent on    " required


"======================= end vundle ====

inoremap jk <esc>

" <Leader> is \ by default
" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>r :source $MYVIMRC <cr>
" opens $MYVIMRC for editing
nmap <Leader>e :tabedit $MYVIMRC <cr>

" When set case is ignored when completing 
" file names and directories.
set wildignorecase

syntax on
"filetype on
set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" !!!!!!!
set nocindent " vs smartintent

set incsearch  " show match as search proceeds
set hlsearch

set autowrite  " make, next, tags..

set ignorecase

set mouse=a		"enable for all modes 

set splitbelow
set splitright

" doplnovanie tagov,   terminatl get c-@ instead c-space
inoremap <C-@> <C-x><C-]>


"unmap help
map <F1> <nop>
nmap <C-A> ggVG <CR>
nmap <c-x> ddO <esc><CR>
vmap <c-c> "+y
imap <c-v> <esc> "+p
"funguje aj ctrl-shift-v   v insert-mode

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>



set guifont=Monospace\ 11
colorscheme desert


set guioptions-=T  "remove toolbar

set foldmethod=manual "syntax

" open all folds automatically 
autocmd BufWinEnter * silent! :%foldopen!

"set relativenumber

" zameni klavesy
nnoremap ; :
"nnoremap : ;


"vertical line separator
set fillchars+=vert:│
hi VertSplit  ctermfg=darkgrey ctermbg=red


" do not show status line at bottom when more panes
" botom bar status
set laststatus=1


set matchpairs+=<:>


"====================== HIGHTLIGHTS ====================
hi Search cterm=bold ctermfg=black ctermbg=magenta
hi IncSearch cterm=bold ctermfg=black ctermbg=yellow

" parents, brackets
hi MatchParen  ctermfg=red ctermbg=none


hi TabLineSel  ctermbg=none ctermfg=green
hi TabLine  cterm=italic ctermfg=darkgrey ctermbg=yellow
hi TabLineFill ctermfg=darkgrey 

hi folded term=standout cterm=bold ctermfg=4 ctermbg=none

hi statusLine term=bold,reverse cterm=bold,reverse guifg=black guibg=#c2bfa5 ctermbg=darkgrey ctermfg=green
hi statusLineNC term=reverse cterm=reverse  ctermfg=darkgrey ctermbg=yellow

hi PmenuSel term=italic cterm=italic ctermfg=2
hi PmenuSbar ctermfg=red ctermbg=yellow

"========================  copen =======================================
"toggle LoationList windows
" location or quick window ??? 
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:moj") && a:forced == 0
    cclose		"lclose or cclose
    unlet g:moj
  else
    copen 13
    let g:moj= "moja_znacka"
  endif
endfunction

nmap <F2>  :pclose<CR>:QFix<CR><c-w>k
"preview windows close if openned, toggle LocationList

"====================== lopen ====================
"toggle LoationList windows
" location or quick window ??? 
command -bang -nargs=? LocationList call LocationListToggle(<bang>0)
function! LocationListToggle(forced)
  if exists("g:location_list") && a:forced == 0
    lclose		"lclose or cclose
    unlet g:location_list
  else
    lopen 13
    let g:location_list = "moja_znacka"
  endif
endfunction

nmap <F12>  :pclose<CR>:LocationList<CR><c-w>k  
"preview windows close if openned, toggle LocationList



" make!    !mark prevents Vim from jumping to location of first error found
"!!!!!! change ppty
"set makeprg=make\ >/dev/pts/2\ 2>&1

"set makeprg=make\ >/dev/pts/2\ 2>&1
"nmap <F5> :!printf "\033c" >/dev/pts/2<cr>:silent make! &<cr>:redraw!<cr>


" LaTex
function Writeandcompile()
 wa 
 silent make! &
 redraw!
endfunction

set makeprg=make\ >/dev/null\ 2>&1
nmap <F5> :call Writeandcompile() <cr>

"autocmd InsertLeave *.tex call Writeandcompile()
" end latex



nmap <F6> :w <cr>:!printf "\033C\e[01;32m[RUN `date +\"\%H:\%M:\%S\"` ]\n\e[0m" >/dev/pts/2<cr>:silent !./a.out in.mls - >/dev/pts/2<cr>

"nmap <F6> :wa <cr> :!ctags -R <cr> <cr>
nmap <F10> :lprevious <cr>
nmap <F11> :lnext <cr>
nmap <F3> :cprevious <cr>
nmap <F4> :cnext <cr>

"map <f1> :pclose <cr>
"map <f1> :YcmCompleter GetType <cr>
map <F1> :silent !sudo pkill a.out <cr>

"nmap <c-d> :shell <cr>



"========================= formati file
function FormatFile()
  let l:lines="all"
  pyf ~/.vim/clang-format.py
endfunction
"map <c-f> :call FormatFile()<cr>
"imap <C-P> <c-o>:pyf ~/.vim/clang-format.py<cr>



"================== YCM =====================
map <c-k> :YcmCompleter GoTo <cr>
map <f8> :YcmForceCompileAndDiagnostics <cr><cr>
let g:ycm_key_detailed_diagnostics = '<f9>'




let g:ycm_confirm_extra_conf = 0 "no annoying tips on vim starting

let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_error_symbol = 'E'
"let g:ycm_warning_symbol = 'W'

let g:ycm_collect_identifiers_from_comments_and_strings = 1

"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion= 1

let g:ycm_always_populate_location_list = 1
hi YcmErrorSection ctermbg=red cterm=italic ctermfg=black
hi YcmWarningSection ctermbg=blue cterm=italic ctermfg=black

let g:ycm_goto_buffer_command = 'same-buffer'
"[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab' ]

let g:ycm_complete_in_comments = 1

let g:ycm_seed_identifiers_with_syntax = 0


"================== underline after jump ==================

function s:Cursor_Moved()
	let cur_pos = winline()
	if g:last_pos == 0
		set cul
		let g:last_pos = cur_pos
		return
	endif
	let diff = g:last_pos - cur_pos
	if diff > 2 || diff < -2
		set cul
	else
		set nocul
	endif
	let g:last_pos = cur_pos
endfunction
"autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0

"================= end underline after jump ==============

"autocmd FileType ruby set tabstop=8|set shiftwidth=2|set expandtab



set completeopt=preview,menuone
highlight Pmenu ctermbg=4 ctermfg=0


"===============================================

"command -bang -nargs=? Fc  call youcompleteme#GetErrorCount()


" cursor shape insert, normal mode
"let &t_SI .= "\<Esc>[5 q"
"let &t_EI .= "\<Esc>[1 q"
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
else
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[1 q"
endif

"======================================================

if has("gui_running")
	  " GUI is running or is about to start.
	  " Maximize gvim window (for an alternative on Windows, see simalt below).
		    
	"set lines=999 columns=999
	set lines=28 
	set columns=99
endif

"======================================================

" disable entering to exec mode
:map Q <Nop>


"=========================== ycm config load  ===========
	:filetype detect

if (&filetype=='c') 
	let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf_c.py"
	set cindent
endif

if (&filetype=='cpp') 
	let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf_cpp.py"
	set cindent
endif

if (&filetype=='lex') 
	let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf_cpp.py"
	set cindent
endif

"======================================================




":inoremap ( ()<Esc>i
":inoremap [ []<Esc>i
":inoremap " ""<Esc>i
":inoremap { {}<Esc>i<return><return><up>


" to load .bashrc, make shell interactive
set shellcmdflag=-ic



