autocmd BufNewFile,BufRead *.cpp call s:DetectGoogleTest()
autocmd BufNewFile,BufRead *.cc  call s:DetectGoogleTest()
autocmd BufNewFile,BufRead *.h   call s:DetectGoogleTest()
autocmd BufNewFile,BufRead *.hpp call s:DetectGoogleTest()

func! s:DetectGoogleTest()
  let i = 1
  while i < 30
    if getline(i) =~# '#include "gtest/gtest.h"'
      set ft=googletest
    endif
    if getline(i) =~# '#include <gtest/gtest.h>'
      set ft=googletest
    endif
    let i += 1
  endwhile
  let j = 1
  while i < 100
    if getline(i) =~# 'TEST('
      set ft=googletest
    endif
    if getline(i) =~# 'TEST_F('
      set ft=googletest
    endif
    let i += 1
  endwhile
endfun


