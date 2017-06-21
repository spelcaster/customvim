" Set clang as the default compiler
compiler clang

set tabstop=2
set shiftwidth=2

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-Wall -pedantic -std=c++14 -stdlib=libc++'
