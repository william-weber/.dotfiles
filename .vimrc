"version 6.0
scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8
set nocompatible
syntax on
filetype plugin indent on
set laststatus=2
set statusline=%<%f%h%m%r%=%l,%c%V\ %P
let s:cpo_save=&cpo
set cpo&vim
set fileformats=unix,dos
set fileformat=unix
set scrolloff=2  " minumum 2 lines above/below cursor
set hidden
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set incsearch     " show search matches as you type
set nobackup
set noswapfile
set pastetoggle=<F2>
nnoremap ; :

" Highlight trailing whitespace
set list
set listchars=tab:»·,trail:·
"ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
"if &listchars ==# 'eol:$'
"  set listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:+
"  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
"    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
"  endif
"endif
set nofoldenable                  " disable code folding
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>                         
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap
" replace all multiple spaces with one space
vmap ,gq :s/\s\+/ /g  gvgq
nmap ,gq :%s/\s\+/ /g  gq1G
" Dont ask to re-read files changed outside vim
set autoread
" New buffer at direction
nmap <leader>sh  :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk  :leftabove  new<CR>
nmap <leader>sj  :rightbelow new<CR>
" arrows resize splits
nnoremap <UP>    <C-w>+
nnoremap <DOWN>  <C-w>-
nnoremap <LEFT>  <C-w>>
nnoremap <RIGHT> <C-w><
" Checktime reloads files editted outside vim (git)
nnoremap <leader>q :checktime

" Random Leader Commands
nnoremap <leader>a :tabe\|:Ack 
nnoremap <leader>g :Git
nnoremap <leader>4 :tabclose<CR>

nnoremap j gj
nnoremap k gk

" change the mapleader from \ to ,
let mapleader=","

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Clear highlighting
map <C-h> :nohl<cr>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" shortcut for rake cucumber:wip
nmap WW :Rake cucumber:wip <Return>
" shortcut for pry
nmap _P orequire 'pry'; binding.pry<ESC>
" shortcut for show me the page
nmap _S oThen show me the page<ESC>
" shortcut for @wip
nmap _W O@wip<ESC>
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=2
set expandtab
set softtabstop=4
set tabstop=4
set formatoptions=croq
set winminheight=0
set history=50
set hlsearch
set ignorecase
set incsearch
set mouse=a
set ruler
set smartcase
if &syntax != 'help'
set syntax=help
endif
set textwidth=78
set smartindent
set shiftwidth=4
set viminfo='1000,f1,\"50,:100,@100,/100
set visualbell

" only use relative numbering in the focused window.
if exists('&relativenumber')
  set relativenumber
  augroup WindowRNU
    auto!
    auto BufWinEnter,WinEnter,FocusGained * setlocal relativenumber
    auto WinLeave,FocusLost               * setlocal number
  augroup END
endif
" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu
au InsertLeave * :set rnu

" skip the default mapping of the apple key in
" /Applications/MacVim.app/Contents/Resources/vim/gvimrc
let macvim_skip_cmd_opt_movement = 1

" Make tab switching use normal mac keys
map  <D-Left>   :tabp<CR>
imap <D-Left>   <Esc>:tabp<CR>i
map  <D-Right>  :tabn<CR>
imap <D-Right>  <Esc>:tabn<CR>i 


" use tab in visual mode to indent
:vnoremap <Tab> >>
:vnoremap <S-Tab> <<

" Now just type ctrl-Up arrow to go to next buffer
" Now just type ctrl-Down arrow to go to previous buffer
map <c-Up>     :bn<cr>
map <c-Down>   :bp<cr>

" use cntl-j,k,h,l to move around window
map <c-J> <C-W>j<C-W>_
map <c-K> <C-W>k<C-W>_
map <c-L> <C-W>l<C-W>_
map <c-H> <C-W>h<C-W>_

"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Sort_Type = "name"
let Tlist_Auto_Open = 1
let Tlist_WinWidth = 20
let Tlist_Exit_OnlyWindow = 1
let tlist_vhdl_settings = 'vhdl;e:entity;a:architecture;c:constant;p:package;b:package_body;t:type;s:signal;r:process;u:subroutines;y:subtypes'

function! VisualSelection()
" Save register content and type.
if version >= 602
    let old_reg     = getreg('"')
    let old_regmode = getregtype('"')
else
    let old_reg     = @"
endif

" Calling this function has ended visual mode, so it must be started again
" before the selection can be yanked into the unnamed register.
normal gvy
let selection = @"

" Restore register content and type.
if version >= 602
    call setreg('"', old_reg, old_regmode)
else
    let @" = old_reg
endif

return selection
endfunction

function! Escaped(text)
return substitute(escape(a:text, '\\/.*$^~[]'), "\n$", "", "")
endfunction

" Search on visual selected text
vnoremap <silent> * :<C-U><cr>/<C-R><C-R>=Escaped(VisualSelection())<cr><cr>
vnoremap <silent> # :<C-U><cr>?<C-R><C-R>=Escaped(VisualSelection())<cr><cr>

" Window resizing mappings (functions.vim plugin)/*{{{*/
nnoremap <S-Up>     :normal <c-r>=Resize('+')<cr><cr>
nnoremap <S-Down>   :normal <c-r>=Resize('-')<cr><cr>
nnoremap <S-Left>   :normal <c-r>=Resize('<')<cr><cr>
nnoremap <S-Right>  :normal <c-r>=Resize('>')<cr><cr>


function! Resize(dir)
    let this = winnr()

    if '+' == a:dir || '-' == a:dir
        execute "normal \<c-w>k"
        let up = winnr()
        if up != this
            execute "normal \<c-w>j"
            let x = 'bottom'
        else
            let x = 'top'
        endif
    elseif '>' == a:dir || '<' == a:dir
        execute "normal \<c-w>h"
        let left = winnr()
        if left != this
            execute "normal \<c-w>l"
            let x = 'right'
        else
            let x = 'left'
        endif
    endif

    if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
        return "5\<c-v>\<c-w>+"
    elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
        return "5\<c-v>\<c-w>-"
    elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
        return "5\<c-v>\<c-w><"
    elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
        return "5\<c-v>\<c-w>>"
    else
        echo "oops. check your ~/.vimrc"
        return ""
    endif
endfunction

" not quite working yet...
function! RmNonPrint() range
    execute a:firstline . "," . a:lastline . 's/[^[:print:]]/ /'
endfunction

"treat .tpl files as c code
:autocmd BufNewFile,BufRead *.tpl set filetype=smarty 
":autocmd BufNewFile,BufRead *.tpl source ~/.vim/syntax/Aspex_tpl.vim

:autocmd BufNewFile,BufRead *.module set filetype=php 

" ruby and eruby 
au BufNewFile,BufRead *.rhtml				set filetype=eruby
:autocmd BufNewFile,BufRead *.rjs,*.rb,*rbw,*.gem,*.gemspec,*.feature,[rR]akefile* set filetype=ruby tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.js set filetype=javascript tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.css set filetype=css tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.coffee set filetype=coffeescript tabstop=2 softtabstop=2 shiftwidth=2

" abbreviations

let g:treeExplVertical=1 
set spell

map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

call pathogen#infect()
set t_Co=256
" Easy on the eyes...
set background=dark
let g:molokai_original = 0
colorscheme base16-railscasts
highlight clear SignColumn
"highlight VertSplit    ctermbg=236
"highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=0 ctermfg=236
highlight CursorLineNr ctermbg=0 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=235 ctermfg=15
highlight IncSearch    ctermbg=0   ctermfg=3
highlight Search       ctermbg=0   ctermfg=9
highlight Visual       ctermbg=15  ctermfg=0
"highlight Pmenu        ctermbg=240 ctermfg=12
"highlight PmenuSel     ctermbg=0   ctermfg=3
"highlight SpellBad     ctermbg=0   ctermfg=1

so ~/.vim/regexp_list.vim
