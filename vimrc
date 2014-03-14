set nocompatible
command! W :w
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible.git'
Bundle 'vim-scripts/YankRing.vim.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'jayferd/eco.vim.git'
Bundle 'mattn/gist-vim.git'
Bundle 'juvenn/mustache.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'vim-scripts/ruby-matchit.git'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'Townk/vim-autoclose.git'
Bundle 'vim-scripts/bufexplorer.zip.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml.git'
Bundle 'henrik/vim-indexed-search.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'tpope/vim-rvm.git'
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate.git'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'gregsexton/gitv'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'vim-scripts/Tagbar.git'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'tpope/vim-dispatch.git'
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'

filetype plugin indent on     " required! "

runtime macros/matchit.vim

syntax on

set shell=/bin/zsh
highlight Pmenu ctermbg=238 gui=bold
"set background=light
"set term=xterm
set backspace=indent,eol,start
set guioptions= " remove all guioptions
set guioptions=i
set history=1000
set noautowrite         " autosave off :next etc
set nobackup
set nowritebackup
set noswapfile
set dir=~/tmp
set modeline
set modelines=8
set pastetoggle=<F2>
set shiftwidth=2
set softtabstop=2
set ts=2
set bs=2
set expandtab
set autoindent
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/.hg/*
set wildignore+=*/.git/*
set list
set nu
set listchars=tab:»·
set listchars+=trail:·
set formatoptions-=o
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set cpo-=<
set wcm=<C-Z>
set mouse=a
set ttymouse=xterm2
set gfn=Inconsolata-dz\ for\ Powerline\ 12
set guifont=Inconsolata-dz\ for\ Powerline\ 12
set t_Co=256
set laststatus=2
set hidden
set shortmess=atI
set undodir=~/tmp/vim/

syntax enable
set background=dark
"set clipboard=unnamedplus
colorscheme Tomorrow-Night
"colorscheme solarized

let g:SuperTabDefaultCompletionType = "<c-n>"

let g:syntastic_enable_signs=1

let g:indent_guides_guide_size = 1

let mapleader = ","

" We use silversearch as a replacement for ack-grep
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ack_wildignore = 0
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"

filetype on
compiler ruby

function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunction

"use the . in VMODE
vnoremap . :norm.<CR>

" Mappings

	"map to bufexplorer
	nnoremap <C-B> :BufExplorer<CR>

	"map to fuzzy finder text mate stylez
	nnoremap <c-n> :NERDTreeToggle<CR><CR>

	"map Q to something useful
	noremap Q gq

	nnoremap <C-L> :call g:ToggleNuMode()<cr>

	" Edit routes
	command! Rroutes :R config/routes.rb
	command! RTroutes :RT config/routes.rb

	" Edit factories
	command! Rfactories :R spec/factories.rb
	command! RTfactories :RT spec/factories.rb

	vmap D y'>2o<Esc>p

	nnoremap / /\v
	vnoremap / /\v
	" nnoremap ; :
	nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>


"omnifunc=rubycomplete#Complete is set by rails.vim
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

autocmd BufRead,BufNewFile *.html source ~/.vim/indent/html_grb.vim

" Close tags
imap ,/ </<C-X><C-O>

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


" Align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Ctags
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TagbarToggle<CR>


" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" Switch between file and buffers
nmap ## <C-^>

" Clean whitespace on save
autocmd BufWritePre  *  call StripTrailingWhite()

function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction


" Moving line up and down
nnoremap <C-S-J> :m+<CR>==
nnoremap <C-S-K> :m-2<CR>==
inoremap <C-S-J> <Esc>:m+<CR>==gi
inoremap <C-S-K> <Esc>:m-2<CR>==gi
vnoremap <C-S-J> :m'>+<CR>gv=gv
vnoremap <C-S-K> :m-2<CR>gv=gv

" Yank Ring
nnoremap <C-F11> :YRShow<CR>
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'

" Consitent copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


let g:AutoCloseExpandEnterOn = ""


map <leader>r :Rrunner<CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>



" Gvim startup size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=160 columns=150
endif

autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif
autocmd User Bundler
      \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif

let g:rspec_command = "Dispatch rspec {spec}"
" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" Make control-p faster
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }


" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


let g:airline_powerline_fonts = 1
