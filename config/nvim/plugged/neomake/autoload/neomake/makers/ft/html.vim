function! neomake#makers#ft#html#tidy() abort
    return {
                \ 'args': ['-e', '-q', '--gnu-emacs', 'true'],
                \ 'errorformat': '%A%f:%l:%c: Warning: %m',
                \ }
endfunction

function! neomake#makers#ft#html#htmlhint() abort
    return {
                \ 'args': ['--format', 'unix'],
                \ 'errorformat': '%f:%l:%c: %m',
                \ }
endfunction

function! neomake#makers#ft#html#html5check() abort
    " Ref: https://github.com/validator/validator/wiki/Output%3A-GNU#type-descriptor
    " TODO: info, non-document-error
    let errorformat = join([
                \   '%f:%l%[:.]%c-%*[0-9:.]: %trror: %m',
                \   '%f:%l%[:.]%c: %trror: %m',
                \   '%f: %trror: %m',
                \   '%E%f:%l%[:.]%c-%*[0-9:.]: %m',
                \   '%E%f:%l%[:.]%c: %m',
                \   '%E: %m',
                \ ], ',')
    return {
                \ 'exe': 'curl',
                \ 'args': ['-s',
                \   '-H', 'Content-Type: text/html; charset=utf-8',
                \   '--data-binary', '@' . expand('%:p'),
                \   'https://validator.w3.org/nu/?out=gnu',
                \ ],
                \ 'errorformat': errorformat
                \ }
endfunction

function! neomake#makers#ft#html#EnabledMakers() abort
    return ['tidy', 'htmlhint']
endfunction
