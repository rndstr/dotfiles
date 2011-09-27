" Vim color scheme
"
" Name:         rndstr.vim
"
" Based on blackboard.vim by Ben Wyrosdick <ben.wyrosdick@gmail.com> 
"
" :colorscheme rndstr
" :he cterm-colors
" :so $VIMRUNTIME/syntax/hitest.vim

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "rndstr"

if has("gui_running")
"  hi TabLine cterm=none ctermfg=0 ctermbg=7
"  hi TabLineSel cterm=bold,underline ctermfg=7 ctermbg=4
"  hi TabLineFill cterm=none ctermfg=4 ctermbg=7

  "GUI Colors
  highlight Normal guifg=White   guibg=#0B1022
  highlight Cursor guifg=Black   guibg=Yellow
  highlight CursorLine guibg=#191E2F
  highlight LineNr guibg=#323232 guifg=#888888
  highlight Folded guifg=#f1f3e8 guibg=#444444
  highlight Pmenu guibg=#84A7C1

  "General Colors
  highlight Comment guifg=#AEAEAE
  "highlight Constant guifg=#CAFE1E
  highlight Constant guifg=#FF0000
  highlight Keyword guifg=#FFDE00
  highlight String guifg=#00D42D
  highlight Type guifg=#84A7C1
  highlight Identifier guifg=#FD6200 gui=NONE
  highlight Function guifg=#459BFD gui=NONE
  highlight clear Search
  highlight Search guibg=#1C3B79
  highlight PreProc guifg=#FF5600
  highlight Question guibg=#FFA500 guifg=White

  "HTML Colors
  highlight link htmlTag Type
  highlight link htmlEndTag htmlTag
  highlight link htmlTagName htmlTag

  "Ruby Colors
  highlight link rubyClass Keyword
  highlight link rubyDefine Keyword
  highlight link rubyConstant Type
  highlight link rubySymbol Constant
  highlight link rubyStringDelimiter rubyString
  highlight link rubyInclude Keyword
  highlight link rubyAttribute Keyword
  highlight link rubyInstanceVariable Normal

  "Rails Colors
  highlight link railsMethod Type
end

hi CursorLine cterm=bold ctermbg=none

highlight extraWhitespace ctermbg=5 guibg=#9975a6
" any tabs
match extraWhitespace /\t/
" trailing whitespace
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

highlight debugCode ctermbg=5 guifg=#000000 guibg=#f648af

