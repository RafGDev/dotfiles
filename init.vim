" PLUG LIST
    call plug#begin()
    Plug 'w0rp/ale' " Awesome linter
    Plug 'roxma/nvim-completion-manager' " Async autocompletion
    Plug 'Shougo/neco-vim' " Vim language pack for nvim-completion-manger 
    Plug 'roxma/nvim-cm-tern' " Javascript source for nvim-completion-manager
    Plug 'vim-airline/vim-airline' " Nice tabline
    Plug 'vim-airline/vim-airline-themes' " Nice themes for vim-airline
    Plug 'scrooloose/nerdtree' " Nice tree explorer
    Plug 'wincent/command-t' " Fuzzy finder for vim
    Plug 'sheerun/vim-polyglot' " Solid language packs
    Plug 'ap/vim-css-color' " Shows css colors in css files
    Plug 'joshdick/onedark.vim' " The best colorscheme ever
    Plug 'scrooloose/nerdcommenter' " Awesome commenting for vim
    Plug 'Valloric/MatchTagAlways' " Show starting and finishing tags in html
    Plug 'fatih/vim-go' " Awesome code plugin
    Plug 'honza/vim-snippets' " Snippet sources for ultisnips
    Plug 'epilande/vim-react-snippets' " React.js snippets
    Plug 'SirVer/ultisnips' " Snippet Engine for vim
    call plug#end()

" NVIM CONFIG 
    let g:python_host_prog  = '/usr/bin/python'
    let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'

    syntax enable " Enable syntax

    colorscheme onedark " Setting colorscheme for solarized 
    set background=dark

    set termguicolors

    let mapleader = "," " Map leader command
    filetype plugin indent on
    set clipboard=unnamedplus " Copy and paste from clipboard
    set mouse=a " Allow mouse support
    set nowrap " Allow lines to be as long as possible and not cut off
    set noswapfile " Don't make swap file when another vim instance is open
    set history=50 " Limits the history of commands that vim saves to 50
    set autoread " Reload file changes outside of vim
    set nobackup " So vim doesn't create a backup
    set cursorline " Highlight the current row 
    set gdefault " Globally search and replace by default
    set ignorecase " case insensitive search (unless otherwise specified)
    set number " Turns on absolute line numbers
    set relativenumber " Turns on relative line numbers
    set splitright " Split vertical window from the right
    set splitbelow " Split horizontal window from below

    " Make vim show indentation and trailing whitespace
    set list 
    set listchars=tab:>-,trail:.

    set formatoptions+=j  " Makes line joins better

    " Show a vertical line to show where 100 chars are
    set textwidth=100
    set formatoptions=qrn1
    set wrapmargin=0
    set colorcolumn=+1 

    set guicursor= " Uses the default cursor when in insert mode
    set foldmethod=indent " Will fold when more then two lines are indented 
    set foldnestmax=1  " Only nest the folds by 1. (So when you open fold, all cold shows up)

    " Clear Search by pressing 
    map <leader><space> :let @/=''<cr> " clear search


    " Stay in visual mode when indenting code
    vnoremap < <gv
    vnoremap > >gv



    set tabstop=4 " When pressing tab, insert 4 spaces
    set softtabstop=4 " Number of spaces in tag when editing
    set shiftwidth=4 " The amount of spaces to indent with
    set expandtab " Expand tabs to spaces when pressing tab

    " Language specific indentation

    " Sets css to use 2 spaces (mainly for nested scss)
    autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    " Sets html to use 2 spaces
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    " Sets javascript to use 2 spaces (mianly for callback hell)
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    " Sets json to use 2 spaces
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


    

" PLUGIN CONFIG
    " Custom signs for error and warning
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'

    let g:airline_theme='onedark' " Sets airline theme to solarized

    " Will use goimports to format code instead of go fmt
    let g:go_fmt_command = "goimports"

    " Set so that ale does not lint when text is changed
    let g:ale_lint_on_text_changed = 'never'

    " Will let ale autoformat on save
    let g:ale_fix_on_save = 1

    " Selecting exactly what fixers to use according to specific file
    let g:ale_fixers = {'javascript': ['prettier'], 'python': ['yapf'], 'c': ['clang-format']}

    "  Selecting only specific linters to use
    let g:ale_linters = {'go': ['golint', 'go vet', 'go build'], 
          \ 'javascript': ['eslint'], 
          \ 'python': ['pylint'], 
          \ 'json': ['jsonlint'],
          \ 'html': ['htmlhint'],
          \ 'css': []
          \  }


    " Set so that ale does not lint on enter
    let g:ale_lint_on_enter = 0 


    " Extra go syntax highlighting
    let g:go_highlight_types = 1
    let g:go_highlight_structs = 1 
    let g:go_highlight_methods = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_fmt_fail_silently = 1
    let g:go_fmt_experimental = 1 

    " Disable polygot syntax highlighting for markdown because it stuffs it up.
    let g:polyglot_disabled = ['markdown'] 

    
" MAPPING KEYS 
    " Map ctrl+c + n to :cnext  (Go to next error in vim-go)
    map <C-n> :cnext<CR>

    " Map ctrl+C + m to :cprevious (Go to previous error in vim-go)
    map <C-m> :cprevious<CR>

    " Remap leader (',') + a to :cclose. This will close error window
    nnoremap <leader>a :cclose<CR> 

    " Run ohly on go files and normal pa the leader + r to :GoRun
    autocmd FileType go nmap <leader>r  <Plug>(go-run)

    " Make navigating between splits easier
    nnoremap <C-j> <C-w><C-j>
    nnoremap <C-k> <C-w><C-k>
    nnoremap <C-l> <C-w><C-l>
    nnoremap <C-h> <C-w><C-h>

    nnoremap <C-t> :tabnew <cr>
    nnoremap <C-c>j :tabnext <cr>
    nnoremap <C-c>k :tabprevious <cr>

    " Press ',' + 'r' to run program in certain language
    autocmd FileType python nnoremap <buffer> <leader>r :exec '!python3' shellescape(@%, 1)<cr>
    autocmd FileType javascript nnoremap <buffer> <leader>r :exec '!node' shellescape(@%, 1)<cr>
    autocmd FileType c nnoremap <buffer> <leader>r :exec '!gcc -o ' shellescape(expand('%:r'), 1) shellescape(expand('%'), 1) '&& ./' . shellescape(expand('%:r'), 1)<cr>
    autocmd FileType java nnoremap <buffer> <leader>r :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<cr>
