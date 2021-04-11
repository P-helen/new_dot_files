language en_US.utf8


" Basics
	set number relativenumber
	let mapleader =","
	let g:python3_host_prog = '/usr/bin/python3'
	let g:pymode_python = 'python3'
	let g:python_host_prog = '/usr/bin/python2'


" Autocompletion
	"set wildmode=longest,list,full

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Compile python code
 	map <leader>p :w! \| !python %

" Save and compile matlab code
	map <leader>m :w! \| MatlabRun

" Open NERDTree
	map <leader>n :NERDTree
	
" Save new placeholder latex file (fill in new file name on X)
	map <leader>l :!cp ~/Documents/latex/latex.tex ~/Documents/latex/X.tex

" Align on = sign
 	map <leader>ae :Align =

" Align on % sign
 	map <leader>ap :Align % 

" Align on # sign
	map <leader>ah :Align #

" Add tab space to % sign
	map <leader>tp :s/%/    %

" Add tab space to # sign
	map <leader>th :s/#/    #

" Spits open at the bottom and right
	set splitbelow splitright

" Shorcutting split navigation
 	map <C-h> <c-w>h
 	map <C-j> <c-w>j
 	map <C-k> <c-w>k
 	map <C-l> <c-w>l

" Check file in shellcheck
	map <leader>s :!clear && shellcheck %<CR>

" Create movie from images
	map <leader>fm :! ffmpeg -r 30 -f image2 -i heat16_417_%03d.png -vcodec libx264 -crf 20 -pix_fmt yuv420p output.mp4

" Runs script to clear out tex build files when closing a .tex file (need this
" with vimtex or no?)
	autocmd VimLeave *.tex !texclear %

" Plugins will be downloaded under the specified directory
	call plug#begin('~/.vim/plugged')
	"call plug#begin(expand('~/.vim/plugged'))


" Declare the list of plugins
	Plug 'lervag/vimtex'
		let g:vimtex_compiler_latexmk = {
    		    \ 'options' : [
    		    \   '-pdf',
    		    \   '-shell-escape',
    		    \   '-verbose',
    		    \   '-file-line-error',
    		    \   '-synctex=1',
    		    \   '-interaction=nonstopmode',
    		    \ ],
    		    \}
 		let g:tex_flavor = 'latex'
		"let g:vimtex_view_forward_search_on_start = 'zathura'
 		let g:vimtex_view_method = 'zathura'
 		let g:vimtex_quickfix_mode =0
		"set conceallevel =1
 		"let g:tex_conceal = 'abdmg' 
	Plug 'junegunn/goyo.vim'
		map <leader>f :Goyo \| set linebreak<CR>
			"Plug 'ervandew/supertab'

	"Plug 'Valloric/YouCompleteMe'
	 "let g:ycm_key_list_select_completion= ['<s-j>', '<Down>']
	 "let g:ycm_key_list_previous_completion=['<s-k>', '<Up>']
	
	Plug 'chrisbra/csv.vim'

	Plug 'SirVer/ultisnips'
	 let g:UltiSnipsExpandTrigger = '<tab>'
	 "let g:UltiSnipsExpandSnippetOrJump = '<tab>'
	 "let g:UltiSnipsJumpForwardTrigger = '<c-l>'
	 let g:UltiSnipsJumpForwardTrigger = '<tab>'
	 let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	 let g:UltiSnipsSnippetDirectories=["UltiSnips", "tex.snippets"]
	 "let g:SuperTabDefaultCompletionType = '<c-n>'

	Plug 'neovim/pynvim'

	Plug 'mhinz/neovim-remote'
	 let g:vimtex_compiler_progname = 'nvr'

	 let g:vimtex_fold_manual = 1
	 let g:vimtex_latexmk_continuos = 1

	Plug 'dylanaraps/wal.vim'

	Plug 'PietroPate/vim-tex-conceal'
	 set conceallevel=2
	 let g:tex_conceal="abdgms"
	
	Plug 'MortenStabenau/matlab-vim'
	 "let g:matlab_executable = '/usr/bin/matlab'

	"Plug 'daeyun/vim-matlab'

	Plug 'junegunn/vim-easy-align'

	"Plug 'jpalardy/vim-slime'
	 "let g:slime_target = "tmux"
	 
	Plug 'preservim/nerdtree'

	" Colorschemes
	Plug 'dracula/vim',{'as':'dracula'}
	Plug 'arcticicestudio/nord-vim'
	Plug 'sts10/vim-pink-moon'
	Plug 'YorickPeterse/happy_hacking.vim'
	Plug 'ajmwagar/vim-deus'
	Plug 'wadackel/vim-dogrun'
	Plug 'morhetz/gruvbox'
	Plug 'YabataDesign/afterglow-theme'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'atelierbram/Base2Tone-vim'
	Plug 'AlessandroYorba/Alduin'
	Plug 'sainnhe/edge'
	Plug 'junegunn/seoul256.vim'
	 let g:seoul256_background = 235
	
	" List ends here. Plugins become visible to Vim after this call.
	call plug#end()




" Colors in tmux

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"DON'T NEED THIS
"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum
"set termguicolors

"colorscheme Base2Tone_SpaceDark
"colorscheme Base2Tone_DesertDark
"colorscheme Base2Tone_PorchDark
"colorscheme Base2Tone_HeathDark
"colorscheme Base2Tone_EveningDark
"colorscheme dracula
"colorscheme wal
"colorscheme nord
""colorscheme edge
colorscheme seoul256
"set background=dark


set hlsearch
"hi Search ctermbg=
"hi Search ctermfg=Red

source ~/.config/nvim/align.vim

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Remap ctrl-a for numeric sequence
"nmap <C-z> <C-a>

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif
