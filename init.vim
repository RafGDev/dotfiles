" PLUG LIST
    call plug#begin()
    Plug 'roxma/nvim-completion-manager' " Async autocompletion
    Plug 'w0rp/ale' " Awesome linter
    Plug 'roxma/nvim-cm-tern' 
    Plug 'roxma/ncm-clang'
    Plug 'Shougo/neco-vim' " Vim language pack for nvim-completion-manger 
    "Plug 'terryma/vim-smooth-scroll'
    Plug 'vim-airline/vim-airline' " Nice tabline
    Plug 'vim-airline/vim-airline-themes' " Nice themes for vim-airline
    Plug 'scrooloose/nerdtree' " Nice tree explorer
    Plug 'sheerun/vim-polyglot' " Solid language packs
    Plug 'ap/vim-css-color' " Shows css colors in css files
    Plug 'chriskempson/base16-vim'
    Plug 'joshdick/onedark.vim' " The best colorscheme ever
    Plug 'scrooloose/nerdcommenter' " Awesome commenting for vim
    Plug 'Valloric/MatchTagAlways' " Show starting and finishing tags in html
    Plug 'fatih/vim-go' " Awesome code plugin
    Plug 'honza/vim-snippets' " Snippet sources for ultisnips
    Plug 'epilande/vim-react-snippets' " React.js snippets
    Plug 'SirVer/ultisnips' " Snippet Engine for vim
    set rtp+=/usr/local/opt/fzf
    call plug#end()

" NVIM CONFIG 
    let g:python_host_prog  = '/usr/bin/python'
    let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'

    syntax enable " Enable syntax

    colorscheme onedark " Setting colorscheme for solarized 
    set background=dark

    set termguicolors

    let mapleader = "," " Map leader command
    let maplocalleader = " " " Map local leader command
    filetype plugin indent on
    set clipboard=unnamedplus " Copy and paste from clipboard

    set mouse=a " Allow mouse support
    set nowrap " Allow lines to be as long as possible and not cut off
    set noswapfile " Don't make swap file when another vim instance is open
    set synmaxcol=300 " Stop drawing after line reaches longer than 300 chars
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

    set formatoptions+=j  " Makes line joins better

    " Show a vertical line to show where 100 chars are
    set textwidth=100
    set formatoptions=qrn1
    set wrapmargin=0
    set colorcolumn=+1 

    set guicursor= " Uses the default cursor when in insert mode
    set foldmethod=indent " Will fold when more then two lines are indented 
    set foldnestmax=2  " Only nest the folds by 1. (So when you open fold, all cold shows up)

    set tags=./tags;$HOME " Looks for ctags file recursively until reaching $HOME

    " Clear Search by pressing 
    map <leader><space> :let @/=''<cr> " clear search

    " Stay in visual mode when indenting code
    vnoremap < <gv
    vnoremap > >gv

    set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*/node_modules/*,*.mp4,*.mpg,*.ts



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

    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb " Set spell checking to English Great Britain

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
    let g:ale_fixers = {'javascript': ['prettier'], 'python': ['yapf'], 'c': ['clang-format'], 'javascript.jsx': ['prettier'], 'json': ['prettier']}

    "  Selecting only specific linters to use
    let g:ale_linters = {'go': ['golint', 'go vet', 'go build'], 
	  \ 'javascript': ['eslint'], 
	  \ 'python': ['pyls'], 
	  \ 'c': ['clang'], 
	  \ 'json': ['jsonlint'],
	  \ 'html': ['htmlhint'],
	  \ 'css': [],
	  \ 'docker': ['hadolint']
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

"    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
    "noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0 , 1)<CR>

    
"MAPPING KEYS 
    " Source vimrc easier. sv stands for 'source vimrc'
    nnoremap <leader>sv :source $MYVIMRC <cr>

    " Make it easier to open up $MYVIMRC (stands for open vimrc)
    nnoremap <leader>ev :vsplit $MYVIMRC <cr>

    " Mappings for vim-ale to go to the next error 
    nnoremap <leader>aj :ALENext<cr>
    nnoremap <leader>ak :ALEPrevious<cr> 

    " Make navigating between splits easier
    nnoremap <C-j> <C-w><C-j>
    nnoremap <C-k> <C-w><C-k>
    nnoremap <C-l> <C-w><C-l>
    nnoremap <C-h> <C-w><C-h>

    " Makes tab switching faster
    nnoremap <C-t> :tabnew <cr>
    nnoremap <C-c>j :tabnext <cr>
    nnoremap <C-c>k :tabprevious <cr>

    " Refreshes the files available in command-t
    nnoremap <Leader>t :FZF <cr>

    " Remap za to zA and zA to za because I i'll use recursive open more
    nnoremap za zA
    nnoremap zA za

    " Map leader + n to toggle nerdtree faster
    autocmd FileType java nnoremap <buffer> <localleader>r :execute '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<cr>
    autocmd FileType c nnoremap <buffer> <leader>r :execute '!gcc'shellescape(expand('%'), 1) '&& ./a.out' <cr>
   


