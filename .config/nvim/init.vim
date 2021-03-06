"配置主要参照 github.com/theniceboy/nvim

syntax on
" 让leader 键映射为空格键
let mapleader=" " 

" 当 Vim 从磁盘上读取文件的时候，会对文件的编码进行探测。如果文件的编码方式和 Vim 的内部编码方式不同，Vim 就会对编码进行转换。转换完毕后，Vim 会将 fileencoding 选项设置为文件的编码。通过打开文件后设置 fileencoding，我们可以将文件由一种编码转换为另一种编码。但是，由前面的介绍可以看出，fileencoding 是在打开文件的时候，由 Vim 进行探测后自动设置的。因此，如果出现乱码，我们无法通过在打开文件后重新设置 fileencoding 来纠正乱码。
" 编码的自动识别是通过设置 fileencodings 实现的，它是一个用逗号分隔的列表，列表中的每一项是一种编码的名称。当我们打开文件的时候，VIM 按顺序使用 fileencodings 中的编码进行尝试解码，如果成功的话，就使用该编码方式进行解码，并将 fileencoding 设置为这个值，如果失败的话，就继续试验下一个编码。
" latin1 是一种非常宽松的编码方式，任何一种编码方式得到的文本，用 latin1 进行解码，都不会发生解码失败，当然解码得到的结果自然也就是理所当然的“乱码”。
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


set smartindent
set expandtab
set ignorecase
set smartcase
set wrap
set number
set cursorline
set incsearch
set hlsearch
set showcmd
set wildmenu
set scrolloff=5
set tabstop=4   "使用tab键产生4个空格
set softtabstop=4   "使用回退键(backspace) 回退4个空格
set clipboard=unnamed
set cindent
set showmatch
set backspace=indent,eol,start
set shiftwidth=4
set foldmethod=indent "依据indent缩进方式折叠代码"
set foldlevel=99

" 将折叠命令改为zf，展开可以用zr，也可以zm
map zf za   
" 重新打开文件后，光标会定位在上次编的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd FileType markdown  nmap <leader>` h````````<left><left><left>cpp<cr><Esc>O
" 在 markdown.snippets 中进行了定义， cpp +ctrl+c
"autocmd FileType markdown inoremap *  ****<left><left>
"用于在文字上添加删除线
"下面的这些定义可以使用 snippets 来定义，以防造成键位的混乱
"autocmd FileType markdown inoremap ~ ~~~~<left><left>  
"autocmd FileType markdown inoremap $ $$<left>
"避免输入带来的￥符号的混乱
autocmd FileType markdown inoremap ￥ $
autocmd FileType markdown inoremap × *
"autocmd FileType markdown inoremap $ $$<cr><Esc>O 
autocmd FileType markdown imap { {}<left>
autocmd FileType markdown imap （ (
autocmd FileType markdown imap ） )
autocmd FileType python inoremap ; :
autocmd FileType python imap { {}<left>
"autocmd FileType python imap <C-x> """"""""<left><left><left><cr><Esc>O  
autocmd FileType python nmap <leader>; o""""""""<left><left><left><cr><Esc>O
autocmd FileType python imap <C-c> <Esc>A:<Esc>o""""""""<left><left><left>
autocmd FileType python imap <C-x> <Esc>A:<cr>

" 当光标在某个单词上的时候，在 normal 模式下，按 # 可以高亮当前 标签页
" 内所有该词出现的地方

" 将注释改成一下的快捷方式，之所以有8个" 的原因是 ，需要按8次", 才能产生 6个",
" <cr>是回车
" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" Open the snippets file anytime
map <LEADER>rd :e ~/.config/nvim/dict/sum.dict<CR>

" C++ 中添加{}
imap <C-j> <Esc>A{<CR><Esc>O
imap <C-l> <Esc>A;<CR>
imap <C-k> <Esc>A;<Esc>

" 删除()中的内容，dh(
" 删除()中以及括号， da(
" 其他符号中删除方法类似，只是将（改成相应的符号即可
"
" 多行操作说明： ctrl+v -> H -> 输入或者缩进 -> esc


noremap j h
noremap i k
noremap k j
noremap h i
noremap H I
noremap J 7h
noremap I 5k
noremap K 6j
noremap L 7l
"因为 shift+k 在man命令中是来查询的，因此<来remap快速向下
noremap < 5j

map ! :q!<CR>
map s <nop>
map S :w<CR>
map Q :q<CR>
"map R :source $MYVIMRC<CR>

" 分屏
map sl :set splitright<CR>:vsplit<CR> 
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
" 用于分屏后跳转窗口
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>l  <C-w>l

"如果是tmux中的分屏：Ctrl+a + h, 然后在屏幕间跳转，使用 ctrl+a +o

"将取消高亮设置map为;
nnoremap ; :noh<CR>    
nnoremap e w
nnoremap w b
" 因为vim 默认的 b 是上个单词， w 是下一个单词，这里 e 和 w 靠的近，所以将 e
" 映射为b
" $ 是行末尾，0 是行首， ^ 是该行第一个字符处

" 用于在同一个tab中打开的多个文档进行跳转
map b :bp<CR>  "跳转到上一个
map n :bn<CR>
map q :bd<CR>  " 关闭当前的窗口

"因为后面的tagbar要用方向建进行上下移动，所以这里不进行映射
"map <up> :res +5<CR>  "
"map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Compile function 实现自动编译
map t :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "! ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "! ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :! bash %
  elseif &filetype == 'python'
    set splitbelow
    ":vsp
    ":vertical resize-10
    :sp
    " 这里是在虚拟环境中的，不同的虚拟环境需要用不同的python编译器
    " 这个可以通过在不同的虚拟环境中通过 which Python 来查询路径
    ":term /home/wck/.conda/envs/py36/bin/python %
    :term /usr/bin/python %
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

" working on it...
map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc


"按shift+v进入visual line模式,然后输入normal A ("和db删除光标前的字符冲突),
"下面的语句中的c4l，c是change改变的意思，想有改变4个字符，并进入insert模式
"map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

call plug#begin('~/.vim/plugged')
" 用于缩进显示
Plug 'nathanaelkane/vim-indent-guides'
" 用于python 函数注释
Plug 'heavenshell/vim-pydocstring'
" markdown 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp' " 为markdown提供公式支持
   
" 各种对齐，使用方法是在visual模式下选中，然后输入：tabu 使用tab键补全，然后
" /= 就是将等号对齐，依次类推
Plug 'godlygeek/tabular'
" markdown 语法高亮插件
"Plug 'plasticboy/vim-markdown'

" 提供函数和类等定义的跳转，
" ctrl+]来跳转到定义 ctrl+w] 用新窗口打开并跳转到定义，通过 ctrl+o
" 跳回原来地方，ctrl+i 再跳回来
Plug 'universal-ctags/ctags'  " 需要通过 sudo pacman -S ctags 安装之后才可以
Plug 'ludovicchabant/vim-gutentags' "结合上面的一起使用，当只有文件夹是个工程的时候才会有用，不是工程，可以建立一个空的 .root 文件即可，具体见配置
" 文件资源查看
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' " 用于图标显示文件类型
" 显示函数和类的列表， 使用 T 来显示
Plug 'majutsushi/tagbar'
" 各种标点符号的配对生成
Plug 'Raimondi/delimitMate'
" 显示标题栏，比如在一个tab中打开多个文件，在vim上方显示文件信息，下方显示当前文件信息
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 代码自动补全
" 关于ycm和coc，希望coc在非c/c++中起作用，其方法就是添加在for中，这个像是coc的白名单
" ycm 只在c/c++ 中，添加进对应的 whitelist 当中即可。
" 但是如果在同一个buffer中打开coc支持的文件，也有ycm支持的文件，那么这两者使用的时候，也还会有冲突，但即使有冲突，也不妨碍补全实现
" 如果打开文件命令栏中出现：/home/wck/.config/coc/extensions/node_modules/coc-tailwindcss/out/index.js, 说明是coc补全
Plug 'Valloric/YouCompleteMe'
" 当是Python环境的时候，要将后面 for 的内容去掉，在 C++ 环境要加上 
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'for': ['json', 'markdown', 'vim', 'sh', 'zsh', 'text', 'py']}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" 语法检查插件
Plug 'dense-analysis/ale'
" 进行多行编辑，可以对同一个变量名的多处进行统一重构
Plug 'terryma/vim-multiple-cursors'
" 为python提供语义高亮
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" 是快速注释,默认已经映射过了 <leader>cc是注释，<leader>cu是取消注释
Plug 'scrooloose/nerdcommenter'
" 为函数提供智能提示
Plug 'Shougo/echodoc.vim'
" 为C++ 文件提供颜色支持
Plug 'octol/vim-cpp-enhanced-highlight'
" 将编辑的程序回滚到上一个/上几个状态上, 通过W来召唤
Plug 'mbbill/undotree'
" 显示更改的文件内容，但是必须是在git仓库中，否则不会显示更改的内容
" 通过 git init 可以讲文件初始化为仓库，通过 git add .; git commit -m "xxx";
" 然后再更改程序内容，就是在旁边显示出来更改过的内容，实际是通过与仓库中上一个
" 提交的版本内容进行比较的
Plug 'airblade/vim-gitgutter'
" 对括号进行配色
"Plug 'frazrepo/vim-rainbow'
" vim 主题颜色
"Plug 'altercation/vim-colors-solarized'
"
"Plug 'chrisbra/Colorizer'
" vim颜色配置
"Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
" 各种语法高亮
Plug 'sheerun/vim-polyglot'
" gdb 插件
"Plug 'cgdb/cgdb'

" Snippets 对程序中重复出现的片段，能够使用快捷键快速的实现
Plug 'SirVer/ultisnips'   "是snippet的引擎
Plug 'honza/vim-snippets'  "是别人已经写好的补全片段，可以自定义或者在其中进行修改，路径在~/.vim/plugged/vim-snippets/UltiSnips路径下
" 浏览代码时候，光标在哪一个变量上，会在该变量下方加下划线，这样能够看清该变量用在哪些地方
Plug 'itchyny/vim-cursorword'
" 快速查询文件插件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"查询库函数的manual
Plug 'vim-utils/vim-man'
"翻译
Plug 'voldikss/vim-translator'
" spell auto correction ，启动方法在命令行输入： enableautocorrect 
Plug 'sedm0784/vim-you-autocorrect'
call plug#end()


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1


" ===
" === snazzy
" ===
"colorscheme snazzy
"let g:SnazzyTransparent = 1
"let g:lightline = {
"\ 'colorscheme': 'snazzy',
"\ }

"===
"=== airline
"=== 
"let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
"let g:lightline = {
  "\     'active': {
  "\         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  "\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  "\     }
  "\ }


"===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

"===
"=== markdown
"===
nmap <leader>c :Toc<CR> <left><left><left><left><left><left><left><left>
"[[ "跳转上一个标题
"]] "跳转下一个标题
"]c "跳转到当前标题
"]u "跳转到副标题
":Toc "显示目录
 

"===
"=== nerdtree
"===
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "j"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = "o"    "打开制定的文件
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "u"
let NERDTreeMapChangeRoot = "n"
" mapmenu设置后，,+a 是添加一个文件或者路径，
" ,+d是删除当前位置处的文件，进入添加或者删除操作后，不想操作，想退出，可以用ctrl+c取消
let NERDTreeMapMenu = ","   

" 不显示隐藏文件
let g:NERDTreeHidden=0
" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']  

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


"===
"=== ale
"===
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" 错误检查的依赖
let g:ale_virtualtext_cursor = 1
let g:ale_linters = {
				\ 'c': ['gcc', 'cppcheck'], 
				\ 'cpp': ['gcc', 'cppcheck'], 
				\ 'python': ['flake8', 'pylint'], 
				\ 'lua': ['luac'], 
				\ 'go': ['go build', 'gofmt'],
				\ 'java': ['javac'],
				\ 'javascript': ['eslint'], 
				\ }
let g:ale_c_gcc_executable = '/usr/bin/gcc'
let b:ale_fixers = ['autopep8', 'yapf']



"===
"=== ctags
"===
" ctrl+]来跳转到定义 ctrl+w] 用新窗口打开并跳转到定义
set tags=./.tags;,.tags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_enabled = 1
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


"===
"=== Pydocstrinh 为函数自动添加注释
"===
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab


"===
"=== Tagbar
"===
nmap <silent> T  :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'     "ctags 程序的路径
let g:tagbar_width=30             "窗口宽度设置为 30
let g:tagbar_left=1                "设置在 vim 左边显示
"let g:tagbar_map_openfold = "zv"   "按 zv 组合键打开标签，默认 zc 关闭标签
let g:tagbar_autofocus = 1


"===
"=== multi_cursor
"===
" 使用方法，对于refactor(重构)变量名， 使用CTRL+n
" 进行变量选择，要改几个就按ctrl+n, 然后按 c ，就可以更改了
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line


"===
"=== YouCompleteMe
"===
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 需要在上面的 .ycm_extra_conf.py 中添加
" '-isystem',
"'/usr/include',
"'-isystem',
"'/usr/include/c++/9.2.0',    "这个要根据具体c++版本来确定到底是哪一个
"'-isystem',
"'/usr/include/i386-linux-gnu/c++'
"才能够补全 C++ 头文件
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_key_invoke_completion = '<c-z>'
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
let g:ycm_collect_identifiers_from_tags_files = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion = 2
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
set completeopt=menu,menuone
" 用于函数参数的补全，但是会弹出预览窗口
let g:ycm_add_preview_to_completeopt = 0
" 函数跳转
map gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
" 定义白名单
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
            \ }


"===
"=== echodoc
"===
set noshowmode
let g:echodoc_enable_at_startup = 1
"let g:echodoc#enable_at_startup = 1
"let g:echodoc#type = 'virtual'


"===
"=== vim cpp enhanced highlight
"===
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

"===
"=== undotree
"===
noremap W :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ==
" == GitGutter
" ==
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>



"===
"=== vim-colors-solarized
"===
"syntax enable
"set background=dark
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"colorscheme solarized


"=== 
"=== onedark.vim
"===
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set termguicolors   " 启用它后，在terminal 和 tmux
"下颜色都是一样的，当前是在terminal 下 背景是暗光，在tmux 下是纯黑的
"let g:onedark_termcolors=256
"onedark.vim override: Set a custom background color in the terminal

"if (has("autocmd") && !has("gui_running"))
  "augroup colors
    "autocmd!
    "let s:background = { "gui": "#282C34", "cterm": "235", "cterm16": "0" }
    "autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
  "augroup END
"endif


colorscheme onedark

"===
"=== termdebug 是内置插件，不需要进行安装
"=== 要使得gdb窗口回到normal模式下，可以说使用 ctrl+\
"=== ctrl+n，然后使用<leader>+j k l i 等进行窗口切换，也可使用ctrl+w w 切换
"let g:termdebug_wide = 163 
nnoremap <Leader>d :packadd termdebug<CR><ESC>:Termdebug<CR><ESC><c-w>w<c-w>w<c-w>H
" K 在上面已经map 为 快速向下翻页，而在 termdebug 中K
" 等价与:Evaluate，所以这里将:Evaluate 重新map，   补充：结果是不行的，B
" 可以map，但是K 仍然是 :Evaluate ,仍然会覆盖掉之前的，:Evaluate
" 作用是在debug过程中，运行到某一步之前的所有的变量都可以将光标放在变量上面，按住K就可以查看变量值。
"noremap <silent> B :Evaluate<cr>


" ===
" === Ultisnips
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-c>"    " ctrl+c触发 snippets 
let g:UltiSnipsJumpForwardTrigger="<c-c>"   " ctrl+c跳转到下一个变量的占位符
let g:UltiSnipsJumpBackwardTrigger="<c-n>"  " 跳回上一个
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/plugged/vim-snippets/Ultisnips/', 'UltiSnips']
"let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/Ultisnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" head: 添加头文件
" cl : 添加类
" cla ： 在类设置在类对应的头文件中
" fun : 函数
" 具体的设置在 ~/.vim/plugged/vim-snippets/Ultisnips/cpp.snippets
" 中进行修改或者自定义，当然该路径下还有其他类型语言(如Python、c等)的 snippets
" ，进行相应的查看修改即可



" ===
" === FZF
" ===
noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-h> :MRU<CR>      
noremap <C-t> :BTags<CR>
"noremap <C-l> :LinesWithPreview<CR>
"noremap <C-w> :Buffers<CR>  //这个和跳换窗口冲突
noremap q; :History:<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:0%', '?'),
  \   <bang>0)


command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" 在历史文件中查找，并预览
command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
  \ call fzf#vim#buffer_tags('', {
  \     'down': '40%',
  \     'options': '--with-nth 1 
  \                 --reverse 
  \                 --prompt "> " 
  \                 --preview-window="70%" 
  \                 --preview "
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
  \                     head -n 16"'
  \ })
"使用CTRL-J/CTRL-K（或者CTRL-N/CTRL-P）进行上下选择
"使用Enter选中条目，CTRL-CCTRTRL-G/ESC`进行退出操作
"精确文件匹配，在文件前面加 '， 比如精确搜索init.vim， 可以输入 'init.vim
" 将文件路径在vim 命令：Files 路径名 ,设置好工作路径之后，在使用 ag
" 来搜索某个变量或者函数或者类在哪些文件中使用，就方便多了；
" 如果不设置好路径，那么就是在当前路径下依据文件内容进行搜索，那么就会出现很多不与当前工程(程序相关的)
" 的文件，因为那些文件中也可能存在要搜索的内容

"路径自动补全，<c-x><c-f> 是vim 默认的补全文件路径的快捷键，把它映射为 fzf
"查找路径的方式，再将 <c-x><c-f> 循环映射为 ctrl+z， 这样就方便多了。
imap <c-z> <c-x><c-f>
imap <c-x><c-f> <plug>(fzf-complete-path)

"===
"=== vim-man ： 在 normal 模式下，光标在函数或者关键字，按 m 或者 K 皆可以
"===
" shift + k : 也是查寻函数manual的
"nmap m :Man <C-R>=expand("<cword>")<CR><CR>
nmap m :Vman <C-R>=expand("<cword>")<CR><CR>
nmap <leader>m :Vman 2 <C-R>=expand("<cword>")<CR><CR>
"当使用 m ，该函数的解释后面有(n)， 一般是有2个选项的原因，而不知道选择哪一个，这个时候就给出了一个大概的描述，而不是具体的函数说明，要想使用，需要手动，在normal 模式下，：Vman 2 fun， 其中fun是函数名，即可， 现在通过 空格+m， 就可以实现了，不用输入
"因为在man 的页面中，K 是man 预设的查询快捷键，因此将 ctrl + k 作为快速向下键


"===
"=== vim-translator : 在 normal 模式下， 使用 空格+t
"可以翻译当前光标下的单词； 在 visual下， 选中的内容，使用 空格+t 可以翻译句子
"===
" Echo translation in the cmdline
"nmap <silent> <Leader>w <Plug>Translate
"vmap <silent> <Leader>w <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>t <Plug>TranslateW
vmap <silent> <Leader>t <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV


"关于函数跳转的问题, YouCompleteMe 跳转到定义只能在自身所在的文件实现, 跳转到声明可以跨文件, 所以可以使用 ctags 来配合使用, 比如有 scr 路径存放 cpp 源文件, include 路径存放 h 头文件, 可以在 scr 路径下生成 .root 空文件,通过 ctrl+] 来跳转到定义, 声明用 ycm 的 gd 快捷键

"还有一个方法就是通过 fzf 在工程内搜索函数名,使用 ctrl+f 调用 ag 来实现,
"但是要注意,使用 ag 来查询,只能是在当前文件所在路径或者是该路径的子目录内搜索,
"ag 搜索的范围是向下的
" 实现函数的跳转不过是查看函数的具体形式,有时候我们只要知道该接口的信息就够了,这个时候可以使用
" man 来查询, 具体就是使用 vim-man


" ===
" === coc.nvim
" ===
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"let g:coc#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'markdown' : '~/.config/nvim/dict/sum.dict',
    "\ }

" ===
" === coc
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

" Useful commands
"nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>rn <Plug>(coc-rename)


