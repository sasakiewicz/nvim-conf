
command! ProjectWindow          lua require'tools'.project_window()
command! ProjectSelect          lua require'tools'.project_select()
command! ProjectOpenFile        lua require'tools'.project_open_file()
command! ProjectSearchFile      lua require'tools'.project_search_file()
command! ProjectTag             lua require'tools'.project_tag()
command! ProjectSearchTextInput lua require'tools'.project_search_text(vim.api.nvim_eval('input("Search: ")'))
command! ProjectSearchTextWord  lua require'tools'.project_search_text(vim.api.nvim_eval('expand("<cword>")'))
command! ProjectStatus          lua require'tools'.project_status()
command! ProjectUpdate          lua require'tools'.project_update()
command! ProjectDebug           lua require'tools'.project_debug()
command! ProjectLog             lua require'tools'.project_log()
command! BuildSelect            lua require'tools'.build_select()
command! BuildBuild             lua require'tools'.build_build()
command! BuildRun               lua require'tools'.build_run()
command! BuildClean             lua require'tools'.build_clean()
command! BuildTerm              lua require'tools'.build_term()

nnoremap <leader>r :Files<CR>
nnoremap <leader>ac :exec 'Ag ' . expand('<cword>')<CR>
nnoremap <expr> <leader>av ':vimgrep' . ' ' . expand('<cword>') . ' ' . '..\' 
nnoremap <leader>ai :Ag 
nnoremap <leader>p :BuildBuild<CR>
nnoremap <leader>P :ProjectWindow<CR>
"nnoremap <leader>P :BuildGtags<CR>
nnoremap <leader>E :ProjectOpenFile<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
"nnoremap <leader>w :Windows<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>h :History:<CR>
nnoremap <leader>H :History/<CR>

nnoremap <leader>e :Files %:h<CR>
nnoremap <leader>k :Windows<CR>
nnoremap <leader>o :BTags<CR>
nnoremap <leader>j :Buffer<CR>
nnoremap <leader>t :TagbarToggle<cr>
