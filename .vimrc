source ~/.dotfiles/.vim/bundle/vim-pathogen/autoload/pathogen.vim


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

let g:indentLine_char = '⦙'

" all folds expanded to lvl 20
set foldlevelstart=20

" linting
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" Highlight trailing whitespace
"ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
"if &listchars ==# 'eol:$'
"  set listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:+
"  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
"    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
"  endif
"endif
"set nofoldenable                  
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
set nofixendofline
set backspace=2
set expandtab
set softtabstop=2
set tabstop=2
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
:autocmd BufNewFile,BufRead *.rjs,*.rb,*rbw,*.gem,*.gemspec,*.feature,*.thor,[rR]akefile* set filetype=ruby tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.js set filetype=javascript tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.tsx,*.jsx,*.vue set tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.css set filetype=css tabstop=2 softtabstop=2 shiftwidth=2
:autocmd BufNewFile,BufRead *.coffee set filetype=coffeescript tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
"set background=dark
let g:molokai_original = 0
colorscheme base16-monokai
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
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=0   ctermfg=3
"highlight SpellBad     ctermbg=0   ctermfg=1
" Tab Line background
highlight TabLineFill  ctermbg=0
" Inactive Tabs
highlight TabLine      ctermbg=235 ctermfg=238
" Active Tab
highlight TabLineSel   ctermbg=235   ctermfg=7
" Window Title/Tab #
highlight Title        ctermbg=0   ctermfg=0

so ~/.vim/regexp_list.vim

"Make endwise work with CoC
let g:endwise_no_mappings = v:true
inoremap <expr> <Plug>CustomCocCR pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd

"CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" CoC Config & Keybindings
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" fix endwise w/coc
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() :"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\<c-r>=EndwiseDiscretionary()\<CR>" 

