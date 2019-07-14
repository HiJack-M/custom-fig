" Vundle.vim
" {
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " plugins
    " {
        " capacity improved
        Plugin 'flazz/vim-colorschemes'
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'scrooloose/nerdtree'
        Plugin 'jistr/vim-nerdtree-tabs'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'djoshea/vim-autoread'
        Plugin 'danro/rename.vim'
        Plugin 'tpope/vim-obsession'
        " Plugin 'kien/ctrlp.vim'   " [discard] replaced by fzf
        Plugin 'haya14busa/incsearch.vim'
        Plugin 'henrik/vim-indexed-search'
        Plugin 'jiangmiao/auto-pairs'
        Plugin 'terryma/vim-multiple-cursors'

        " extends
        Plugin 'tpope/vim-fugitive'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'godlygeek/tabular'
        Plugin 'plasticboy/vim-markdown'
        Plugin 'chr4/nginx.vim'
        Plugin 'cespare/vim-toml'
        Plugin 'solarnz/thrift.vim'
        Plugin 'tomlion/vim-solidity'
        Plugin 'jrozner/vim-antlr'
        Plugin 'jpalardy/vim-slime'
        Plugin 'maksimr/vim-jsbeautify'
        Plugin 'moll/vim-node'
        Plugin 'leafgarland/typescript-vim'
        " Plugin 'l04m33/vlime', {'rtp': 'vim/'}

        " 3rd ecosystem
        Plugin 'chemzqm/vim-jsx-improve'
        Plugin 'mattn/emmet-vim'
        Plugin 'digitaltoad/vim-pug'
        Plugin 'mustache/vim-mustache-handlebars'
        Plugin 'posva/vim-vue'
        Plugin 'chemzqm/wxapp.vim'
    " }

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
" }


" settings
" {
    " set shell=/bin/sh
    set number
    set backspace=indent,eol,start
    set autoindent
    set smartindent
    set cindent
    set incsearch
    set smartcase
    set cursorcolumn
    set cursorline
    set showcmd
    set showmatch
    set ignorecase
    set magic

    set softtabstop=4
    set shiftwidth=4
    set whichwrap=b,s,<,>,[,]
    set cmdheight=1
    set sidescroll=5
    set so=5
    set expandtab

    set backupext=.bak
    set regexpengine=1
    set clipboard=unnamed
    set laststatus=2

    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8

    set hls 
    set background=dark
    set term=screen-256color
    colorscheme gruvbox

    set lisp                " lisp default autoindex
    set previewheight=25    " vim-fugitive > GStatus height

    syntax on
    if &t_Co > 1
        syntax enable
    endif

    let mapleader=" "
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
" }


" [.conf] file highlight
" {
    setf dosini
    autocmd BufRead,BufNewFile logging.conf setf dosini
" }


" fzf config
" {
    set rtp+=/usr/local/opt/fzf
" }


" vim-airline
" {
    let g:airline_powerline_fonts = 1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'jsformatter'

    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#tab_nr_type= 2
    let g:airline#extensions#tabline#show_tab_type = 1

    let g:airline_theme='lucius'
" }


" NERDTREE
" {
    " Start NERDTree
    autocmd VimEnter * NERDTree
    " Go to previous (last accessed) window.
    autocmd VimEnter * wincmd p

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeShowHidden=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeWinSize = 20
" }


" NERDTree auto highlight (FIXME exec PluginInstall must close NERDTree)
" {
    " Check if NERDTree is open or active
    function! IsNERDTreeOpen()        
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction

    " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
    " file, and we're not in vimdiff
    function! SyncTree()
      if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
      endif
    endfunction

    " Highlight currently open buffer in NERDTree
    autocmd BufEnter * call SyncTree()
" }


" YouCompleteMe
" {
    let g:ycm_min_num_of_chars_for_completion = 3 
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_complete_in_comments = 1
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>', '<tab>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

    " resolve conflict, disable [Syntastic] and [Eclim]
    let g:syntastic_java_checkers = []
    let g:EclimFileTypeValidate = 0

    " goto definition
    nnoremap <leader>jd :YcmCompleter GoTo<CR>
" }


" tern
" {
    let tern_show_signature_in_pum = 1
    let tern_show_argument_hints = 'on_hold'
    autocmd FileType javascript setlocal omnifunc=tern#Complete
" }
 

" fzf
" {
    map <c-p> :FZF <CR>
" }


" incsearch
" {
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
" }


" nerdcommenter
" https://github.com/scrooloose/nerdcommenter
" {
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1

    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = {
    \   'c': { 'left': '/**','right': '*/' },
    \   'javascript.jsx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
    \ }

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1
" }


" XML format
" https://stackoverflow.com/questions/21408222/vim-indent-xml-file
" @Birei's answer
" gg=G
" {
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" }


" vim-markdown
" {
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_folding_style_pythonic = 1
    let g:vim_markdown_override_foldtext = 0
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_emphasis_multiline = 0
" }


" vim-slime
" {
    let g:slime_target = "tmux"
    let g:slime_paste_file = "$HOME/.slime_paste"
    let g:slime_python_ipython = 1
" }


" vim-jsbeautify
" {
    " for javascript
    autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
    " for json
    autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
    " for jsx
    autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
    " for html
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    " for css or scss
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

    " binding a function for js, html and css in visual mode on
    autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
    autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
    autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
" }


" vim-node
" {
    autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
" }


" vim-javascript > jsx-improve
" {
    " conflict with jsx-improve, consider confirm reason
    " let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_ngdoc = 1
    let g:javascript_plugin_flow = 1

    set foldmethod=syntax
    augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=syntax
    augroup END

    let g:javascript_conceal_function             = "ƒ"
    let g:javascript_conceal_null                 = "ø"
    let g:javascript_conceal_this                 = "@"
    let g:javascript_conceal_return               = "⇚"
    let g:javascript_conceal_undefined            = "¿"
    let g:javascript_conceal_NaN                  = "ℕ"
    let g:javascript_conceal_prototype            = "¶"
    let g:javascript_conceal_static               = "•"
    let g:javascript_conceal_super                = "Ω"
    let g:javascript_conceal_arrow_function       = "⇒"
    set conceallevel=1
" }


" emmet-vim
" {
    let g:user_emmet_mode='a'    "enable all function in all mode.
    let g:user_emmet_leader_key='<C-e>'
    let g:user_emmet_settings = {
    \ 'javascript.jsx' : {
    \   'extends' : 'jsx',
    \  },
    \ 'javascript' : {
    \   'extends' : 'jsx',
    \ },
    \ 'wxss': {
    \   'extends': 'css',
    \ },
    \ 'wxml': {
    \   'extends': 'html',
    \   'aliases': {
    \     'div': 'view',
    \     'span': 'text',
    \   },
    \  'default_attributes': {
    \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
    \     'navigator': [{'url': '', 'redirect': 'false'}],
    \     'scroll-view': [{'bindscroll': ''}],
    \     'swiper': [{'autoplay': 'false', 'current': '0'}],
    \     'icon': [{'type': 'success', 'size': '23'}],
    \     'progress': [{'precent': '0'}],
    \     'button': [{'size': 'default'}],
    \     'checkbox-group': [{'bindchange': ''}],
    \     'checkbox': [{'value': '', 'checked': ''}],
    \     'form': [{'bindsubmit': ''}],
    \     'input': [{'type': 'text'}],
    \     'label': [{'for': ''}],
    \     'picker': [{'bindchange': ''}],
    \     'radio-group': [{'bindchange': ''}],
    \     'radio': [{'checked': ''}],
    \     'switch': [{'checked': ''}],
    \     'slider': [{'value': ''}],
    \     'action-sheet': [{'bindchange': ''}],
    \     'modal': [{'title': ''}],
    \     'loading': [{'bindchange': ''}],
    \     'toast': [{'duration': '1500'}],
    \     'audio': [{'src': ''}],
    \     'video': [{'src': ''}],
    \     'image': [{'src': '', 'mode': 'scaleToFill'}],
    \   }
    \ },
    \}
" }
 

" vim-mustache-handlebars
" {
    let g:mustache_abbreviations = 1
" }


" vim-vue
" {
    " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" }


" wxapp
" {
    let g:neomake_wxss_enabled_makers = ['stylelint'] 
    let g:neomake_wxml_enabled_makers = ['tidy']
" }


" auto complete python file header
" {
    au BufNewFile *.py 0r /Users/jovi/.vim/python.header.template
" }


" common useful shortcut
" {
    map ,c :%s///gn <CR>
    map gm :call cursor(0, len(getline('.'))/2) <CR>

    " indent space
    map fd :set fdm=indent<CR>
    map FG :set shiftwidth=2<CR>:set softtabstop=2<CR>
    map FGG :set shiftwidth=4<CR>:set softtabstop=4<CR>

    " NERDTREE persist only one
    map <Leader>n <plug>NERDTreeTabsToggle<CR>
    map <Leader>f :NERDTreeFind<CR>
" }
