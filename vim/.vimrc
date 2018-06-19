" vundle {
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'tpope/vim-obsession'
    Bundle 'jistr/vim-nerdtree-tabs'

    Bundle 'moll/vim-node'
    Plugin 'chemzqm/vim-jsx-improve'
    Plugin 'maksimr/vim-jsbeautify'
    Plugin 'posva/vim-vue'
    Plugin 'mattn/emmet-vim'

    Plugin 'chemzqm/wxapp.vim'
    Plugin 'chr4/nginx.vim'
    Plugin 'plasticboy/vim-markdown'
    Bundle 'solarnz/thrift.vim'

    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'haya14busa/incsearch.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'godlygeek/tabular'

    call vundle#end()
" }


" vim-pathogen
" {
    execute pathogen#infect()
    syntax on
    filetype plugin indent on
" }


" settings
" {
    set number
    set backspace=indent,eol,start
    set autoindent
    set smartindent
    set cindent
    set ruler
    set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
    set showcmd
    set showmatch
    set magic
    set softtabstop=4
    set shiftwidth=4
    set whichwrap=b,s,<,>,[,]
    set cmdheight=1
    set sidescroll=5
    set so=5
    set expandtab
    set cursorcolumn
    set cursorline
    set incsearch
    set backupext=.bak
    set hls 
    " set cc=80
    set regexpengine=1
    set clipboard=unnamed
    set laststatus=2
    set term=screen-256color
    set ignorecase
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8
    set background=dark
    colorscheme gruvbox
    syntax on
    if &t_Co > 1
        syntax enable
    endif

    " change <Leader>
    let mapleader=" "
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
" }


" NERDTREE
" {
    autocmd vimenter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeShowHidden=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeWinSize = 20
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

"     function! MyTabFunction ()
"         let line = getline('.')
"         let substr = strpart(line, -1, col('.')+1)
"         let substr = matchstr(substr, "[^ \t]*$")
"         if strlen(substr) == 0
"             return "\<tab>"
"         endif
"         return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
"     endfunction
"     inoremap <tab> <c-r>=MyTabFunction()<cr>
" }


" vim-node
" {
    autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
" }


" vim-javascript
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
    let g:javascript_conceal_noarg_arrow_function = "🞅"
    let g:javascript_conceal_underscore_arrow_function = "🞅"
    set conceallevel=1
" }


" vim-jsbeautify
" {
    " for javascript
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
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


" vim-vue
" {
    " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
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
 

" wxapp
" {
    let g:neomake_wxss_enabled_makers = ['stylelint'] 
    let g:neomake_wxml_enabled_makers = ['tidy']
" }


" tern
" {
    let tern_show_signature_in_pum = 1
    let tern_show_argument_hints = 'on_hold'
    autocmd FileType javascript setlocal omnifunc=tern#Complete
" }
 

" vim-mustache-handlebars
" {
    let g:mustache_abbreviations = 1
" }


" vim-markdown
" {
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_folding_style_pythonic = 1
    let g:vim_markdown_override_foldtext = 0
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_emphasis_multiline = 0
" }


" auto complete python file header
" {
    au BufNewFile *.py 0r /Users/jovi/.vim/python.header.template
" }


" incsearch
" {
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
" }


" common useful shortcut
" {
    " map \( i(<Esc>ea)<Esc>
    " map \{ i{<Esc>ea}<Esc>
    " map \[ i[<Esc>ea]<Esc>
    " map \" i"<Esc>ea"<Esc>
    " map \' i'<Esc>ea'<Esc>
    map gm :call cursor(0, len(getline('.'))/2) <CR>
    map fd :set fdm=indent<CR>
    map FG :set shiftwidth=2<CR>:set softtabstop=2<CR>
    map FGG :set shiftwidth=4<CR>:set softtabstop=4<CR>
    map EE :e! <CR>

    " NERDTREE persist only one
    map <Leader>n <plug>NERDTreeTabsToggle<CR>

    " map tabe
    map tb :tabe . <CR>
    " map tn :tabnew **/
" }


" xml format
" {
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" }


" moving around in command mode
" {
    " cnoremap <c-h> <left>
    " cnoremap <c-j> <down>
    " cnoremap <c-k> <up>
    " cnoremap <c-l> <right>
    " cnoremap ^     <home>
" }


" script - tabline - format
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
" {
    if exists("+showtabline")
        function! MyTabLine()
            let s = ''
            let wn = ''
            let t = tabpagenr()
            let i = 1
            while i <= tabpagenr('$')
                let buflist = tabpagebuflist(i)
                let winnr = tabpagewinnr(i)
                let s .= '%' . i . 'T'
                let s .= (i == t ? '%1*' : '%2*')
                let s .= ' '
                let wn = tabpagewinnr(i,'$')

                let s .= '%#TabNum#'
                let s .= i
                " let s .= '%*'
                let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
                let bufnr = buflist[winnr - 1]
                let file = bufname(bufnr)
                let buftype = getbufvar(bufnr, 'buftype')
                if buftype == 'nofile'
                    if file =~ '\/.'
                        let file = substitute(file, '.*\/\ze.', '', '')
                    endif
                else
                    let file = fnamemodify(file, ':p:t')
                endif
                if file == ''
                    let file = '[No Name]'
                endif
                let s .= ' ' . file . ' '
                let i = i + 1
            endwhile
            let s .= '%T%#TabLineFill#%='
            let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
            return s
        endfunction
        set stal=2
        set tabline=%!MyTabLine()
        set showtabline=1
        highlight link TabNum Special
    endif
" }
