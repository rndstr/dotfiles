"""""""""""""""""""""""""""
" xmledit
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"""""""""""""""""""""""""""
" powerline
let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""
" sessionman
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>ss :SessionSaveAs<CR>

"""""""""""""""""""""""""""
" syntastic
let g:syntastic_auto_jump=1

"""""""""""""""""""""""""""
" ctrlp
let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
nmap <leader>ff :CtrlP<CR>
nmap <leader>fb :CtrlPBuffer<CR>
nmap <leader>fm :CtrlPMRUFiles<CR>

" prolly should move this to ~/.vim/after/plugin/ ?

command! JSLint !js ~/.dotfiles/bin/jslint "`cat %`" | sed -e 's/<div>/<div>\&nbsp;/g' | lynx -dump -stdin


let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}


"""""""""""""""""""""""""""
" indent-guides
if has("gui_running")
  let g:indent_guides_enable_on_vim_startup = 1
endif


"""""""""""""""""""""""""""
" fuzzyfinder
let g:fuf_file_exclude = '\v\(~|-)$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'
let g:fuf_coveragefile_exclude = '\v\(~|-)$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])\.(hg|git|bzr|svn)|cache($|[/\\])'
let g:fuf_coveragefile_globPatterns = ['~/**/.*', '~/**/*']
let g:fuf_dir_exclude = '\v(^|[/\\])(\.(hg|git|bzr|svn)|cache)($|[/\\])'
let g:fuf_maxMenuWidth = 300

let g:fuf_keyOpen = '<CR>'
let g:fuf_keyOpenTabpage = '<C-t>'
let g:fuf_keyOpenSplit = '<C-k>'
let g:fuf_keyOpenVsplit = '<C-l>'

"nmap ,ff :FufFile<CR>
"nmap ,fc :FufCoverageFile<CR>
"nmap ,fl :FufLine<CR>
"nmap ,fh :FufHelp<CR>
"nmap ,fb :FufBuffer<CR>
"nmap ,ft :FufBufferTag<CR>


nmap <leader>vb :VCSBlame<CR>
nmap <leader>vl :VCSLog<CR>
nmap <leader>vd :VCSDiff<CR>

"""""""""""""""""""""""""""
" gist
let g:gist_clip_command = 'xclip -sel clip'
let g:gist_detect_filetype = 1
let g:gist_browser_command = 'opera %URL% &'


""""""""""""""""""""""""
" gundo
map <F9> :GundoToggle<CR>
let g:gundo_width = 72
let g:gundo_preview_height = 27


""""""""""""""""""""""""
" cscope
set cscopeprg=/usr/bin/cscope


""""""""""""""""""""""""
" NERD_tree.vim
" http://www.catonmat.net/blog/vim-plugins-nerdtree-vim/

map <silent> <F8> :NERDTreeToggle<CR>



""""""""""""""""""""""""
" taglist.vim
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_Sort_Type = 'name'
let Tlist_Use_Right_Window = 1

""""""""""""""""""""""""
" taglist.vim
nmap <silent> <F7> :TagbarToggle<CR>


""""""""""""""""""""""""
" surround.vim


"  Old text                  Command     New text ~
"  print "Hello *world!"     yss-        <?php print "Hello world!" ?>

autocmd FileType php let b:surround_45 = "<?php \r ?>"



"""""""""""""""""""""""""""
" plugin/DoxygenToolkit.vim

nnoremap <C-x> :Dox<CR>

let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_authorName="Roland Schilter"
" set empty for non c++ files
let g:DoxygenToolkit_commentType=""

let g:DoxygenToolkit_licenseTag="Copyright (C) 2010 Roland Schilter <mail@rolandschilter.ch>\<enter>\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "This program is free software; you can redistribute it and/or modify\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "it under the terms of the GNU General Public License as published by\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "the Free Software Foundation; either version 2 of the License, or\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "(at your option) any later version.\<enter>\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "This program is distributed in the hope that it will be useful,\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "but WITHOUT ANY WARRANTY; without even the implied warranty of\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "GNU General Public License for more details.\<enter>\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "You should have received a copy of the GNU General Public License\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "along with this program; if not, write to the Free Software\<enter>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.\<enter>"



"""""""""""""""""""""""""""
" VimDebugger

map <leader>dr :DbgRun<CR>
map <leader>dq :DbgDetach<CR>
map <F11> :DbgStepInto<CR>
map <F10> :DbgStepOver<CR>
map <S-F11> :DbgStepOut<CR>
map <F12> :DbgToggleBreakpoint<CR>
map <leader>db :DbgToggleBreakpoint<CR>
