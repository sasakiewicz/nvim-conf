
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
let g:easy_align_delimiters['/'] = { 'pattern': '//', 'ignore_groups': ['String'] }
let g:easy_align_delimiters[']'] = { 'pattern': '[[\]]', 'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
let g:easy_align_delimiters[')'] = { 'pattern': '[()]', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
let g:easy_align_delimiters['\'] = { 'pattern': '\\' }
let g:easy_align_delimiters['%'] = { 'pattern': '%' }
let g:easy_align_delimiters['-'] = { 'pattern': '-' }
let g:easy_align_delimiters['['] = { 'pattern': '[' }
let g:easy_align_delimiters['|'] = { 'pattern': '|', 'ignore_groups': ['String'] }

