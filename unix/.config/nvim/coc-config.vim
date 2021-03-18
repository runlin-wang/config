"  coc-config.vim Author "Leo <alin.run@foxmail.com>" Date 19.03.2021
"                                       __ _       
"   ___ ___   ___       ___ ___  _ __  / _(_) __ _ 
"  / __/ _ \ / __|____ / __/ _ \| '_ \| |_| |/ _` |
" | (_| (_) | (_|_____| (_| (_) | | | |  _| | (_| |
"  \___\___/ \___|     \___\___/|_| |_|_| |_|\__, |
"                                            |___/ 


" ==================================================
" extensions
" ==================================================

let g:coc_global_extensions = [
 \ 'coc-json', 
 \ 'coc-tsserver',
 \ 'coc-html',
 \ 'coc-css',
 \ 'coc-go',
 \ 'coc-pyright',
 \ 'coc-snippets',
 \ 'coc-explorer',
 \ 'coc-vimlsp']

" ==================================================
" settings
" ==================================================

nnoremap <space>e :CocCommand explorer<CR>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <Leader>h to show documentation in preview window.
nnoremap <silent> <Leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

