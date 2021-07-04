" Find files using Telescope command-line sugar.
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" UNDOTree configuration
nnoremap <F5> :UndotreeToggle<CR>

" NERDTree configuration
nnoremap  <C-b> :NERDTreeToggle<CR>
nnoremap  <C-f> :NERDTreeFind<CR>

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" command-line mode
nnoremap <space> :

" movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-C> <C-W><C-c>

" move line(s) up/down in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" resize
nnoremap <silent> <Up>      :resize -2<CR>
nnoremap <silent> <Down>    :resize +2<CR>
nnoremap <silent> <Left>    :vertical resize -2<CR>
nnoremap <silent> <Right>   :vertical resize +2<CR>

" ctrl+s save
noremap <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S>     <C-C>:update<CR><ESC>
inoremap <silent> <C-S>     <C-O>:update<CR><ESC>

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" comment line(s)
nnoremap <leader>c I<C-R>=CommentLine()<CR><ESC>
vnoremap <leader>c 0I<C-R>=CommentLine()<CR><ESC>

" uncomment line(s)
nnoremap <leader>u :s!\S\s*!!<CR>
vnoremap <leader>u :s!\S\s*!!<CR>

