call plug#begin('~/.local/share/nvim/plugins')

" Languages
Plug 'kballard/vim-swift'
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'rhysd/vim-crystal'
Plug 'dag/vim-fish'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'

" Editing
Plug 'scrooloose/nerdcommenter'

" Snippets/Linters/Autocomplete
Plug 'scrooloose/syntastic'

" Miscellaneous
Plug 'xolox/vim-misc'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

"--* Theming *--
set background=dark
colorscheme solarized

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set clipboard=unnamed,unnamedplus

"--* AutoCmds *--
autocmd BufWritePre * :%s/\s\+$//e

"--* Key Bindings *--
let mapleader = "\<SPC>"
let maplocalleader = '<CTRL>-\<SPC>'
