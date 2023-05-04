set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

set wildmenu

call dein#begin('~/.vim/dein')

""======================== 插件选项 ========================
"" rev
call dein#add('Shougo/dein.vim', {'rev':'2.2'})

"" build, lazy
call dein#add('junegunn/fzf', {'lazy':1,
			\'build': './install --all',
			\})
"" if
call dein#add('luochen1990/rainbow', {
			\'if':'v:version >= 801'
			\})

""======================== 懒加载的例子 ========================
"" on_cmd
call dein#add('haya14busa/dein-command.vim',{'lazy':1,
			\'on_cmd':'Dein',
			\})
"" on_map
call dein#add('tpope/vim-commentary', {'lazy':1,
			\'on_map':{'n':['gcc','gc'], 'v':'gc'},
			\'on_event':'InsertEnter',
			\})

" on_event
call dein#add('markonm/hlyank.vim', {'lazy':1,
			\'on_event': ['TextYankPost'],
			\})

""" on_if, 默认的更新时机是 BufRead, BufNewFile, VimEnter and FileType.
call dein#add('preservim/nerdtree', {'lazy':1,
			\'on_if':'exists("g:test_load_ndt")',
			\})
" on_source
call dein#add('mhinz/vim-signify', {'lazy':1,
			\'on_source':'hlyank.vim',
			\})
" depends
call dein#add('honza/vim-snippets', {'lazy':1,})
call dein#add('SirVer/ultisnips', {'lazy':1,
			\'depends':['vim-snippets'],
			\'on_event':'InsertEnter',
			\})

""======================== 使用钩子来实现插件模块化配置 ========================

call dein#add('roxma/vim-hug-neovim-rpc',{'lazy':1})
call dein#add('roxma/nvim-yarp', {'lazy':1,
			\'depends':'vim-hug-neovim-rpc',
			\})
call dein#add('ryanoasis/vim-devicons',{'lazy':1})
call dein#add('kristijanhusak/defx-icons', {'lazy':1,
			\'depends':['vim-devicons'],
			\'hook_source':'source ~/.vim/plug_conf/before/defx_icons_conf.vim'})
let s:defx_nvim_config = {'lazy':1,
			\'rev':'1.5',
			\'on_cmd':'Defx',
			\'on_map':'<space>t',
			\'depends':['nvim-yarp', 'vim-hug-neovim-rpc', 'defx-icons'],
			\'hook_post_source':'source ~/.vim/plug_conf/after/defx_conf.vim',
			\'hook_done_update': ''}
call dein#add('Shougo/defx.nvim', s:defx_nvim_config)

call dein#end()

filetype plugin indent on
syntax enable
