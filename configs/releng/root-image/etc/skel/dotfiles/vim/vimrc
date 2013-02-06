"
" Nick Bair's Vim Configuration
"
" It's my favorite, because it's mine!
" http://nickbair.net
"

" needed for pathogen to function in jailed shell environments
set shell=/bin/bash
" load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
" update runtimepath variable to load plugins
" from ~/.vim/bundle using pathogen
" and refresh hepltags
call pathogen#infect()
call pathogen#helptags()



" break Vi compatibility and set Vim defaults
set nocompatible



"
" =Display
"
set ruler                  " always show cursor position in status bar
set showcmd                " show commands while typing
set number                 " show line numbers
set showtabline=2          " always show tab bar

" set font and colors
if has('win32')
	set guifont=Consolas:h11
else
	set guifont=Monaco\ 10
endif
colorscheme molokai



"
" =Formatting
"
" auto-indenting (based on filetype if available)
if has('autocmd')
	filetype plugin indent on
else
	set autoindent
endif

set textwidth=72           " line breaks at column 72
set formatoptions+=tcroql  " see :h fo and :h fo-table
set linebreak              " only break lines at certain character types
set nowrap                 " don't soft-wrap lines (it makes coding hard)
set tabstop=4              " tab size for tab key
set shiftwidth=4           " tab size for >> and << and autoindent
set noexpandtab            " do NOT use spaces instead of tabs



"
" =Syntax Highlighting
"
" enable syntax highlighting in color terminals
if &t_Co > 2 || has('gui_running')
	syntax on
endif



"
" =Search
"
set incsearch   " incremental searching (find as you type)
set ignorecase  " case-insensitive searches
set nohlsearch  " do not highlight search results



"
" =Folding
"
set foldmethod=indent
set nofoldenable
set foldlevel=1



"
" =Misc
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" command line history
set history=50

" auto-save files when switching buffers
set autowrite

if has('autocmd')
	" create & initialize new autocmd group 'misc'
	augroup misc
		" clear group
		au!

		" remember last known cursor position
		au BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\ exec "normal! g`\"" |
					\ endif

		au BufEnter * lcd %:p:h
	augroup end
endif

" enable mouse
set mouse=a



"
" =Abbreviations
"
" expand %% to [current directory] in command mode 
cabbr <expr> %% expand('%:p:h')



"
" =Commands
"
" diff the current buffer with the file from which it was loaded
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis |
	wincmd p | diffthis
endif



"
" =Keymappings
"
" break undo on line breaks in insert mode
inoremap <C-U> <C-G>u<C-U>

" expand \e to :e [current directory] in normal mode
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" expand \w to the specified path
nnoremap <Leader>w :e ~/Projects/Web/

" tab shortcuts
nnoremap ,0 :tabfirst<CR>
nnoremap ,l :tabnext<CR>
nnoremap ,h :tabprevious<CR>
nnoremap ,$ :tablast<CR>
nnoremap ,x :tabclose<CR>
nnoremap ,m :tabmove 

" map \nt to open/close NERDTree
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
