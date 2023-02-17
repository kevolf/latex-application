TEX_DIR = tex
OUT_DIR = out

TEX_FLAGS = -lualatex

export TEXINPUTS += :./tex:../latex:

include ../LaTeX.make
