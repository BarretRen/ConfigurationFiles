set enc=utf-8  "vim内部编码
"下面两行用于防止gvim提示和软件显示出现问题
set fenc=utf-8 "文件保存编码
set guifont=Consolas:h11
set mouse=a      "任何模式使用鼠标 
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
"set listchars = tab:>-,trail:- " 将制表符显示为'>---',将行尾空格显示为'-'
set listchars=tab:.\ ,trail:.   " 将制表符显示为'.   '
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
" 编程相关的设置
"--------------------------------------------------------------------------------
set completeopt=longest,menu    " 关掉智能补全时的预览窗口
filetype plugin indent on       " 加了这句才可以用智能补全
"omnicpp的配置
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteDot = 1   
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DisplayMode=1
"-----------------------------
syntax enable             " 打开语法高亮
syntax on
set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set smartindent     " 智能对齐方式
set shiftwidth=4    " 换行时行间交错使用4个空格
set autoindent      " 自动对齐
set ai!             " 设置自动缩进
colorscheme desert

"--------------------------------------------------------------------------------
" 代码
"--------------------------------------------------------------------------------
"set foldmarker={,}
"set foldmethod=marker
set foldmethod=syntax
set foldlevel=100       " Don't autofold anything (but I can still fold manually)
"set foldopen-=search   " don't open folds when you search into them
"set foldopen-=undo     " don't open folds when you undo stuff
"set foldcolumn=4

"--------------------------------------------------------------------------------
" 模仿MS Windows中的快捷键
"--------------------------------------------------------------------------------
vmap <C-c> "yy
vmap <C-x> "yd
"nmap <C-v> "yp
"vmap <C-v> "yp
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
"nmap <C-h> :bro ol<cr>  "浏览文件打开记录
nmap <F2> :bd<cr>    "关闭minibufexplorer中的某个文件
"###############################################################################
" The following is the Plugins' setting
"###############################################################################
 
"--------------------------------------------------------------------------------
" TagList :Tlist
"--------------------------------------------------------------------------------
let Tlist_Show_One_File=1  "只显示当前文件的tag
let Tlist_Exit_OnlyWindow = 1  "taglist为最后一个窗口时，退出vim
let Tlist_Use_Right_Window=1   "taglist窗口放在右侧
let Tlist_Show_Menu=1   "显示菜单
"--------------------------------------------------------------------------------
" NERDTree 文件浏览器 :e <PATH>
"--------------------------------------------------------------------------------
let g:NERDTree_title='NERD Tree'
function! NERDTree_Start()
	    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
		    return 1
endfunction
"let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=0 "不显示帮助面板
let NERDTreeDirArrows=0 "目录箭头 1 显示箭头  0传统+-|号
 
"--------------------------------------------------------------------------------
" write buffer
"--------------------------------------------------------------------------------
nmap <F6> :n<cr>   " 切换到下一个buffer
nmap <F7> :N<cr>   " 切换到上一个buffer
 
"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <C-w><C-b> :BottomExplorerWindow<cr> " 切换到最下面一个窗格
"nmap <C-w><C-f> :FirstExplorerWindow<cr>   " 切换到最上面一个窗格
let g:winManagerWindowLayout='NERDTree|TagList'
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
cs add /repo2/barretr/workspace/cscope.out /repo2/barretr/workspace
":set cscopequickfix=s-,c-,d-,i-,t-,e-   "是否使用 quickfix 窗口来显示 cscope 结果
:set cscopetag
":set tags=/home/barretr/space/cvpsw/tags,/home/barretr/space/ISR5501/sw/vobs/tags
" 按下面这种组合键有技巧,按了<C-_>后要马上按下一个键,否则屏幕一闪
" 就回到nomal状态了
" <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr>
"设置自动更新cscope索引文件的快捷键
nmap <F9> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.cc' -o -iname '*.hh' > ./cscope.files<CR> :!cscope -b -q -i ./cscope.files -f ./cscope.out<CR> :cs reset<CR> 
nmap <F10> :cs reset<CR>
"----------------------------------------------------------------------------
"source exploer
"----------------------------------------------------------------------------
nmap <F5> :SrcExplToggle<CR>    "快捷键映射
let g:SrcExpl_winHeight = 8     "默认高度
let g:SrcExpl_refreshTime = 100 "更新时间(ms)
let g:SrcExpl_isUpdateTags = 0  "每次打开SrcExpl时是否更新tags(0为不更新)
let g:SrcExpl_updateTagsKey = "<F12>"   "更新tags的快捷键
"--------------------------------------------------------------------------------
" Grep
"--------------------------------------------------------------------------------
"直接按下<F3>键来查找光标所在的字符串
nnoremap <silent> <F8> :Rgrep<CR>
 

"--------------------------------------------------------------------------------
" 其他配置
"--------------------------------------------------------------------------------

"让vim记忆上次编辑的位置
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
						\	exe "normal g'\"" |
								\ endif

"创建制定类型文档是自动添加title注释
"autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 

func SetComment()
      call setline(1,"/************************************************************************") 
      call append(line("."), "**                                                                              **")
      call append(line(".")+1, "**                                            NOKIA                           **")
      call append(line(".")+2, "**                                                                            **")
      call append(line(".")+3, "                                                                ")
      call append(line(".")+4,"***************************************************************************/") 
      call append(line(".")+5, "/************************ COPYRIGHT INFORMATION ******************")
      call append(line(".")+6, "   FILE       ：".expand("%:t")) 
      call append(line(".")+7, "                                                                ")
      call append(line(".")+8, "   PURPOSE    ：herb")
      call append(line(".")+9, "                                                                ")
      call append(line(".")+10,"   CLASS      ：                                                ") 
      call append(line(".")+11,"                                                               ")
      call append(line(".")+12,"   SWB        :                                                 ")
      call append(line(".")+13,"                                                                ")
      call append(line(".")+14,"   Related Doc:                                                 ")
      call append(line(".")+15,"                                                                ")
      call append(line(".")+16,"   AUTHOR     ：Barret Ren") 
      call append(line(".")+17, "                                                                ")
      call append(line(".")+18,"   HISTORY    : ")
      call append(line(".")+19, "  " .strftime(" %Y/%m/%d"))
      call append(line(".")+20, "                                                                ")
      call append(line(".")+21, "***********************************************************************/") 
 endfunc
 
 func SetTitle()
      call SetComment()
      if expand("%:e") == 'hpp' 
         call append(line(".")+22, "#ifndef ".toupper(expand("%:t:r"))."_HPP") 
         call append(line(".")+23, "#define ".toupper(expand("%:t:r"))."_HPP") 
         call append(line(".")+27, "#endif //".toupper(expand("%:t:r"))."_HPP") 
      elseif expand("%:e") == 'h' 
         call append(line(".")+22, "#ifndef ".toupper(expand("%:t:r"))."_H") 
         call append(line(".")+23, "#define ".toupper(expand("%:t:r"))."_H") 
         call append(line(".")+27, "#endif //".toupper(expand("%:t:r"))."_H")
      elseif &filetype == 'c' 
         call append(line(".")+22,"#include \"".expand("%:t:r").".h\"") 
      elseif &filetype == 'cpp' 
         call append(line(".")+22, "#include \"".expand("%:t:r").".hpp\"") 
      endif
 endfunc
"##################################################################
"########################## End Of Vimrc ##########################
"##################################################################

