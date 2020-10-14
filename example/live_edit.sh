#!env bash
export TEXINPUTS=./tex:../latex:

[[ $# != 1 ]] && {
	echo USAGE: $0 FILENAME
	exit 1
}

latexmk --pvc -lualatex -interaction=nonstopmode -output-directory=./out $1
