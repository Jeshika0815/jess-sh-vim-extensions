" set relation
set nocompatible
set number
set clipboard=unnamedplus,unnamed
set nomodeline
set completeopt=menu,menuone,noselect
set whichwrap+=<,>,[,],b,s " Arrowkey relate
set virtualedit=onemore
set mouse=a

" auto change .vimrc
if has('autocmd')
	augroup reload_vimrc
		autocmd!
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END
endif

syntax on
