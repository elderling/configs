".vimrc

syntax on

set t_Co=256
colorscheme solarized
set gfn=DejaVu\ Sans\ Mono\:h14
"set gfw=Monaco:h14
set guioptions=aA
"set clipboard=unnamedplus
set autoindent "Preserve current indent on new lines
set smartindent
set textwidth=78 "wrap at this column
set backspace=indent,eol,start "Make backspaces delete sensibly

set tabstop=2 "Indentation levels every four columns
set expandtab "Convert all tabs typed into spaces
set shiftwidth=2 "Indent/outdent by four columns
set shiftround "Indent/outdent to nearest tabstop

set matchpairs+=<:> "Allow % to bounce between angles too

set number

"set encoding=latin1

" Always show a status line
set laststatus=2
"set laststatus=0

" Turn off annoying 'show all matches' behavior
set nohlsearch

let perl_fold = 1
let perl_fold_blocks = 1

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType xhtml setlocal foldmethod=syntax
au FileType html setlocal foldmethod=syntax

let javaScript_fold = 1

"set foldmethod=indent
"set foldmethod=manual
set foldmethod=syntax

cabbrev idate r! date +"\%Y-\%m-\%d"
cabbrev isub r ~/.template/submit_template.txt

"Adds a 'Shell' command, which acts like !, but creates a new buffer and
"inserts the output of the command
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:    ' . a:cmdline)
    call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    call setline(3, substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    1
endfunction

set mouse=a

set wildmenu "Turn on WiLd menu

" => Files and Backups
set nobackup
set nowb
set noswapfile

set ruler "always show current position

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Set to auto read when a file is changed from the outside
set autoread

" needed to make snipMate work
filetype plugin on
filetype indent on

set showcmd

" Set 7 lines to the cursors - when moving vertical
set so=7

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
        let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
            return curdir
        endfunction

set cmdheight=1

" NERDTree
map <F4> :NERDTreeToggle<CR><CR>

set equalprg=perltidy

"au BufRead,BufNewFile *.tx set filetype=tx
au BufRead,BufNewFile *.asd set filetype=lisp

"vimdiff stuff
set diffopt+=iwhite "Ignore whitespace

" Different colorscheme if in vimdiff mode
" if &diff
"     colorscheme ron
" endif

au FileType javascript call JavaScriptFold()

execute pathogen#infect()
let g:slime_target = "tmux"

" Draw a vertical bar showing where the textwidth +3 is
" set cc=+3
" number of 'context' lines when the cursor moves offscreen
set scrolloff=5
" set so=0

