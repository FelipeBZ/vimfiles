" Opções gerais:
syntax on
set nobackup
set wildmode=longest,list " Completa o comando com TAB igual o bash

" Opções de pesquisa:
set ignorecase
set smartcase
set incsearch

" Opções de identação: 
" * identação automática ativada
" * usa espaços no lugar de TABs
" * 4 espaços de identação
filetype plugin indent on
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" Opções de GUI
colorscheme koehler
set number
set guifont=Monospace\ 10  
set guioptions-=T " Toolbar é coisa para fracos

" Para CSS e HTML, usar 2 espaços de identação. Quatro espaços é exagero
autocmd FileType css set ai tabstop=2 shiftwidth=2 expandtab
autocmd FileType html set ai tabstop=2 shiftwidth=2 expandtab
autocmd FileType scss set ai tabstop=2 shiftwidth=2 expandtab

" Atalhos para plugins
map <F5> :NERDTree<CR>
map <F6> :ColorSel<CR>

" Cria e escolhe as abas
map <C-t> :tabnew<CR>
map <C-TAB> :tabnext<CR>
map <C-S-TAB> :tabprevious<CR>

" Mover texto com os TABs
vnoremap < <gv
vnoremap > >gv
map <TAB> >
map <S-TAB> <

" Auto-completa segundo a sintaxe, caso não haja dicionário omnicomplete
setlocal omnifunc=syntaxcomplete#Complete

" Função que usa o omnicomplete apenas com o TAB
function! CleverTab()
 if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
 return "\<Tab>"
 elseif exists('&omnifunc') && &omnifunc != ''
 return "\<C-X>\<C-O>"
 else
 return "\<Tab>"
 endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Atalhos de teclado comuns
" Permite selecionar com SHIFT + SETA como no Windows
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive

" Backspace no modo de visão apaga a seleção
vnoremap <BS> d

" HATERS GONNA HATE:
" CTRL-X corta
vnoremap <C-X> "+x

" CTRL-C copia
vnoremap <C-C> "+y

" CTRL-V cola
map <C-V>             "+gP
imap <C-V>            <C-R>+
cmap <C-V>            <C-R>+

" CTRL-S salva
noremap <C-S>        :update<CR>
vnoremap <C-S>       <C-C>:update<CR>
inoremap <C-S>       <C-O>:update<CR>

" CTRL-Z desfaz
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y refaz
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-A seleciona tudo
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-F4 fecha a aba
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" Baseado em
" http://henriquegogo.wordpress.com/2009/08/31/disseram-me-ide-entao-eu-vim
