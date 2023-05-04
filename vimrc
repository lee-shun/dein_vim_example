set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

set wildmenu

call dein#begin('~/.vim/dein')

" 使用dein.vim的利器
" 这几个就是不使用懒加载的情况
call dein#add('Shougo/dein.vim', {'rev':'2.2'})

" on_cmd
call dein#add('haya14busa/dein-command.vim',{'lazy':1,
			\'on_cmd':'Dein',
			\})
" on_map
call dein#add('tpope/vim-commentary', {'lazy':1,
            \'on_map':{'n':'gcc', 'v':'gc'},
            \})

" on_event
call dein#add('markonm/hlyank.vim', {'lazy':1,
            \'on_event': ['TextYankPost'],
            \})

" on_if, 默认的更新时机是 "BufRead", "BufNewFile", "VimEnter" and "FileType".
call dein#add('preservim/nerdtree', {'lazy':1,
			\'on_if':'exists("g:test_load_ndt")',
			\})
" on_source
call dein#add('mhinz/vim-signify', {'lazy':1,})


call dein#end()

filetype plugin indent on
syntax enable
