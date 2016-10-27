"##################################################################
"########################## start Of Vimrc ##########################
"##################################################################
"--------------------------------------------------------------------------------
" 基本环境配置
"--------------------------------------------------------------------------------
set enc=utf-8  "vim内部编码
"下面两行用于防止gvim提示和软件显示出现问题
set fenc=utf-8 "文件保存编码
set guifont=Consolas:h11
"set mouse=a      "任何模式使用鼠标 
set mouse=nv      "只在普通和可视模式使用鼠标
set expandtab    "将Tab键转换为空格                          
set tabstop=4    "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4  "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab      "指定按一次backspace就删除shiftwidth宽度
set backspace=2     " 设置退格键可用
set nu!             " 显示行号
set nobackup        "不生成备份
set clipboard+=unnamed   "复制到剪贴板，默认是寄存器
set wrap           " 自动换行
"set nowrap         " 不自动换行
set linebreak       " 整词换行
set whichwrap=b,s,<,>,[,]       " 光标从行首和行末时可以跳到另一行去
"set list                       " 显示制表符
"set listchars=tab:>-,trail:-     " 将制表符显示为'>---',将行尾空格显示为'-'
set autochdir                   " 自动设置目录为正在编辑的文件所在的目录
set hidden          " 没有保存的缓冲区可以自动被隐藏
set scrolloff=5
"--------------------------------------------------------------------------------
" 查找/替换相关的设置
"--------------------------------------------------------------------------------
set hlsearch        " 高亮显示搜索结果
set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                    " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                    " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                    " 找要匹配的单词时，别忘记回车
set gdefault        " 替换时所有的行内匹配都被替换，而不是只有第一个
set ignorecase
"--------------------------------------------------------------------------------
" 状态栏相关的设置
"--------------------------------------------------------------------------------
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c]
set laststatus=2    " always show the status line
"set ruler           " 在编辑过程中，在右下角显示光标位置的状态行
"--------------------------------------------------------------------------------
" 主题设置
"--------------------------------------------------------------------------------
colorscheme zellner
"--------------------------------------------------------------------------------
" 编程相关的设置
"--------------------------------------------------------------------------------
set completeopt=longest,menu    " 关掉智能补全时的预览窗口
filetype plugin indent on       " 加了这句才可以用智能补全
syntax enable             " 打开语法高亮
syntax on
set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set smartindent     " 智能对齐方式
set shiftwidth=4    " 换行时行间交错使用4个空格
set autoindent      " 自动对齐
set ai!             " 设置自动缩进
set foldmethod=indent "代码折叠
"set foldmethod=syntax
set foldlevel=100       " Don't autofold anything (but I can still fold manually)
"set foldopen-=search   " don't open folds when you search into them
"set foldopen-=undo     " don't open folds when you undo stuff
"set foldcolumn=4
"--------------------------------------------------------------------------------
" 模仿MS Windows中的快捷键
"--------------------------------------------------------------------------------
vmap <C-c> "yy
vmap <C-x> "yd
nmap <C-v> "yp
nmap <C-a> ggvG$
"--------------------------------------------------------------------------------
" 窗口操作的快捷键
"--------------------------------------------------------------------------------
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap wx     <C-w>s     " 水平分割当前窗口
"--------------------------------------------------------------------------------
" 保存，退出，历史文件记录等快捷键
"--------------------------------------------------------------------------------
nmap <F4> :w<cr>    "保存文件修改
nmap <F3> :q<cr>    "退出vim
nmap <F12> :bro ol<cr>  "浏览文件打开记录
nmap <F2> :bd<cr>    "关闭minibufexplorer中的某个文件
"--------------------------------------------------------------------------------
" 其他配置
"--------------------------------------------------------------------------------
"让vim记忆上次编辑的位置
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
						\	exe "normal g'\"" |
								\ endif
								
"###############################################################################
" The following is the Plugins' setting
"###############################################################################
"--------------------------------------------------------------------------------
" Tagbar :比TagList好用，分类更清晰，推荐
"--------------------------------------------------------------------------------
nmap ll :TagbarToggle<CR>
"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <C-w><C-b> :BottomExplorerWindow<cr> " 切换到最下面一个窗格
"nmap <C-w><C-f> :FirstExplorerWindow<cr>   " 切换到最上面一个窗格
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>
"--------------------------------------------------------------------------------
" MiniBufExp
"--------------------------------------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplUseSingleClick = 1 "Change buffer with single click on a buffer
"let g:miniBufExplModSelTarget = 1 
"--------------------------------------------------------------------------------
" cscope
"--------------------------------------------------------------------------------
cs add /repo2/barretr/workspace/fdt1265/cscope.out /
":set cscopequickfix=s-,c-,d-,i-,t-,e-   "是否使用 quickfix 窗口来显示 cscope 结果
:set cscopetag
":set tags=/home/barretr/space/cvpsw/tags,/home/barretr/space/ISR5501/sw/vobs/tags
" 按下面这种组合键有技巧,按了<C-_>后要马上按下一个键,否则屏幕一闪
" 就回到nomal状态了
" <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr>
"设置自动更新cscope索引文件的快捷键
nmap <F9> :!find /repo2/barretr/workspace/fdt1265/sw/src/ -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.cc' -o -iname '*.hh' -o -iname "*.idl" > ./cscope.files<CR> :!cscope -b -q -i ./cscope.files -f ./cscope.out<CR> :cs reset<CR> 
nmap <F10> :cs reset<CR>
"--------------------------------------------------------------------------------
" Grep
"--------------------------------------------------------------------------------
"直接按下<F6>键在外部目录查找光标所在的字符串
nnoremap <silent> <F6> :Rgrep<CR>
nnoremap <silent> <F5> :Fgrep<CR>
"--------------------------------------------------------------------------------
" IndentLine:显示竖线
"--------------------------------------------------------------------------------
nmap <F11> : IndentLinesToggle<CR>

"##################################################################
"########################## End Of Vimrc ##########################
"##################################################################

