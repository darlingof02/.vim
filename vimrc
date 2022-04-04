set nocompatible "避免和vi的冲突
filetype on "检测文件类型
filetype indent on "为特定文件类型载入相关缩进文件
filetype plugin on "允许插件
filetype plugin indent on

let mapleader=" "
syntax on "打开语法高亮
set number "打开行号显示 
set norelativenumber "关闭相对行号显示 
set cursorline "突出显示当前编辑行
set wrap "允许代码换行显示
set showcmd "输入的命令显示出来
set wildmenu "使用backspace时，正常处理indent，eol，start等
set hlsearch "高亮显示搜索结果
exec "nohlsearch"
set incsearch 
set ignorecase "忽略大小写搜索
set smartcase "在有一个或以上的大写字母时，大小写敏感
"set mouse=a "可以用鼠标指挥光标（建议关闭
set encoding=utf-8 "编码格式
let &t_ut='' "解决终端配色方案异常
set expandtab "设置tab键缩进
set tabstop=2 "设置tab键缩进为2格
set shiftwidth=2 "设置<<和>>命令移动宽度为2
set softtabstop=2 "设置backspace可删除两格
set foldmethod=indent "设置折叠方式
set laststatus=2 "显示状态栏
set autochdir "自动切换到当前目录为当前文件所在的目录
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Better backspace
set backspace=indent,eol,start
set scrolloff=5  "保证向上/下总有5行先显示
"随模式更改光标形态
if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif
" 更改mapleader值
nnoremap <space> <Nop>
let g:mapleader = "\<space>"

"shift + s 保存文件
"shift + q 退出 
map Q :q<CR>
map S :w<CR>


"s + i分屏，光标在右
"s + n分屏，光标在左
"s + u分屏，光标在上
"s + e分屏，光标在下
map sj :set splitright<CR>:vsplit<CR>  
map sk :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>  
map se :set splitbelow<CR>split<CR>    
"方向键上键，控制分屏大小
"方向键下键，控制分屏大小 
"方向键左键，控制分屏大小 
"方向键右键，控制分屏大小 
map <up> :res +5<CR>             
map <down> :res -5<CR>           
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"空格 + l/k/h/j 控制光标在分屏间切换
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j

"打开新标签
map tu :tabe<CR> 

"shift + u 重做撤销
map U <C-r> 

"复制内容到系统剪贴板上
map <C-c> "+y 
"可视块模式

"空格+sc打开拼写检查，用[/]+s来选择错误拼写
map <LEADER>sc :set spell!<CR> 

"placeholder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

"空格 + 回车 取消搜索高亮显示
noremap <LEADER><CR> :nohlsearch<CR> 

"H或L切换标签
noremap H gT
noremap J gT
noremap L gt
noremap K gt


" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  elseif &filetype == 'vim'
    exec "source %"
  elseif &filetype == 'javascript'
    exec "!node %"
  endif
endfunc
" 对于Mac 可以用command键位进行映射

map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc

" ==
" == vim-snippets
" ==
source ~/.vim/snippits.vim

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" Dracula配色
Plug 'dracula/vim', {'as':'dracula'}

" markdown截图
Plug 'ferrine/md-img-paste.vim'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
" Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" javacomplete2
" Plug 'artur-shaik/vim-javacomplete2'
" 中英文输入法
" Plug 'https://github.com/CodeFalling/fcitx-vim-osx'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

" coc autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-surround 
Plug 'tpope/vim-surround'

" vim-repeat
Plug 'tpope/vim-repeat'

" smartvim 
" input method
Plug 'ybian/smartim'

" Treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


call plug#end()

color snazzy
let g:SnazzyTransparent = 1

" === NERDTREE
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" ===
" === javacomplete2
" === 
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap Gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/.ycm_c-c++_conf.py"
" YCM输出logfile
" YCM的补全配置
"let g:ycm_add_preview_to_completeopt = 0 函数原型预览关闭，注释后开启
"let g:ycm_show_diagnostics_ui = 0 实时标注代码问题，注释后关闭
let g:ycm_server_keep_logfiles = 1
let g:ycm_log_level = 'debug'
" 从第二个键入字符就开始罗列匹配项
let g:ycm_min_num_identifier_candidate_chars = 2
" 注释和字符串的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings=1
" 主动补全键改为ctrl + z
let g:ycm_key_invoke_completion = '<c-z>'
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }

" java补全
let g:syntastic_java_checkers = []
" ==
" == markdown-preview
" ==

" ==
" == Dracula配色
" ==
colorscheme dracula


" ==
" == md-img-paste
" ==
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = './imgs'
" let g:mdip_imgname = 'image'
"
" ==
" == coc.vim
" ==
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-jedi', 'coc-java']

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

