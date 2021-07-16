" neovim config file
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'pbogut/fzf-mru.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vista.vim'
"Plug 'preservim/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'jkramer/vim-checkbox'
Plug 'jiangmiao/auto-pairs'
"Plug 'joshdick/onedark.vim'
Plug 'bluz71/vim-moonfly-colors'
"Plug 'chriskempson/base16-vim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

set autoindent " on by default
set smartindent " automatically indent after context change
set history=50
set ruler " show cursor location in statusline
set relativenumber
set showcmd " show incomplete cmds in statusline
set showtabline=2 " default 1 (only show if >1tabs
set termguicolors

" onedark
" colorscheme onedark
"let g:onedark_terminal_italics=1
"let g:airline_theme="onedark"

" base16
"colorscheme base16-ocean
"let base16colorspace=256
" let g:airline_theme='base16'

" mooonfly
colorscheme moonfly
let g:moonflyCursorColor = 1
let g:moonflyUnderlineMatchParen = 1 
let g:moonflyUnderCurls=1
let g:moonflyItalics=1

" colors
set bg=dark

" decoration of vertical split indicator
hi VertSplit ctermfg=fg ctermbg=bg

syntax on " default: blank
filetype plugin indent on

set number " show line numbers in gutter
set showmatch " hl matching brackets

set incsearch " search while typing
set hlsearch " default: one
set ignorecase  "ignore case
set smartcase " ignore case if search pattern conaints uppercase
set list
set listchars=tab:>·,trail:~,extends:>,precedes:<,nbsp:+
set cursorline "hl cursor line
set splitbelow
set splitright

set tabstop=4
set smarttab  " on by default
set softtabstop=4
set expandtab  " always insert spaces for <Tab>
set shiftround " < and > commands will round to even multiples of shiftwidth
set shiftwidth=4  " by how many spaces to shift with < or >

set stl=%!airline#statusline(2)
set tal=%!airline#extensions#tabline#get()

set foldenable

set backupdir=~/.local/share/nvim/backup "don't store backups in cwd

" for iso keyboard
let mapleader=","

" ;-)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" disable ex mode
map Q gq

" undo over linebreaks
inoremap <C-U> <C-G>u<C-U>

" disable search hl until next search
nnoremap <C-L> :nohlsearch<CR><C-L>

" fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>g :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>c :BCommits<CR>
nnoremap <silent> <Leader>m :FZFMru<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Leader>T :Tags<CR>
nnoremap <silent> <Leader>tt :BTags<CR>

if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

" tie fzf to bottom split in nvim>0.5
let g:fzf_layout = { "window": "silent botright 15split enew" }

" :Rg to not include filenames
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" :Commits formatting
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" tagbar
nmap <F8> :TagbarToggle<CR>

" toggle location
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" neovim-lsp
set completeopt = "menu,menuone,noinsert"

nnoremap <silent> <c-b> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

lua require'lspconfig'.pyright.setup{}
"lua require'lspconfig'.pyls_ms.setup{cmd={"dotnet", "exec", "/home/niid/src/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll"}}
"lua require'lspconfig'.rust_analyzer.setup{}
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" neomake
call neomake#configure#automake('nrw', 50) " when to activate automake
let g:neomake_python_enabled_makers = ['flake8'] " which linter to enable for Python source file linting
let g:neomake_open_list = 2
let g:neomake_rust_cargo_command = ['check', '--examples', '--tests']

" neoformat
nnoremap <silent> <c-k>f :Neoformat<CR>
let g:neoformat_enabled_python = [ 'black', 'autopep8', 'yapf' ]
autocmd BufWrite *.rs :Neoformat

" airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_statusline_ontop=0
let g:airline_powerline_fonts = 1

" NERDTree
let g:NERDTreeShowIgnoredStatus = 0
let g:NERDTreeCascadeOpenSingleChildDir = 1
let NERDTREEShowBookmarks=1
map <leader>ne :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<cr>

" auto reload
if has ('autocmd') " Remain compatible with earlier versions
augroup vimrc     " Source vim configuration upon save
autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

"indentLine
"let g:indentLine_fileTypeExclude = ['markdown', 'json', 'yml', 'yaml', 'toml']
let g:indentLine_concealcursor=""
let g:indentLine_char = '⎸'
"vim-indent-guides
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
