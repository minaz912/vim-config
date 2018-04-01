
" Neomake
" ---------
let g:neomake_open_list = 0
let g:neomake_verbose = 1
let g:airline#extensions#neomake#enabled = 1

if ! empty(g:python3_host_prog)
	let g:neomake_python_python_exe = g:python3_host_prog
endif

" JAVASCRIPT / JSX
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'

" YAML / ANSIBLE
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_ansible_enabled_makers = ['yamllint']
let g:neomake_ansible_yamllint_maker = neomake#makers#ft#yaml#yamllint()

" Find a way to move this to plugins.yaml autocmd
function! MyOnBattery()
  return readfile('/sys/class/power_supply/ADP1/online') == ['0']
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake({
  \ 'TextChanged': {},
  \ 'InsertLeave': {},
  \ 'BufWritePost': {'delay': 0},
	\ 'BufRead': {'delay': 0},
  \ 'BufWinEnter': {},
  \ }, 500)

  " call neomake#configure#automake('nrw', 750)
endif
" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
