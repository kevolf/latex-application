###############################################################################
# SPECIFY TARGET NAME
TEX_ROOT ?= main

###############################################################################
# PATH SETTINGS
TEX_DIR ?= tex
OUT_DIR ?= out
VPATH += $(TEX_DIR)

###############################################################################
# FILES
TEX_FILES += $(wildcard $(TEX_DIR)/*.tex)

###############################################################################
# COMPILER SETTINGS
TEX_FLAGS ?= -pdf
TEX_FLAGS += -interaction=nonstopmode -output-directory=${OUT_DIR}

###############################################################################
# COMMANDS
CMD_RM      = rm -rf
CMD_CP      = cp
CMD_MV      = mv
CMD_MKDIR   = mkdir -p
CMD_LATEXMK = latexmk

PRINT   = @printf "%s\n"
MSG_START   = @printf "[START] %s\n"
MSG_END     = @printf "[DONE] %s\n"

###############################################################################
# MSGs
MAIN_TEX_MSG="generating $(TEX_ROOT).tex"
PDF_MSG="generating pdf"
CLEAN_MSG = "removing temporary files"

###############################################################################
# TARGETS

# Make shortcuts
# $@ file named on the left side of ':'
# $^ file named on the right site of ':' 
# $< first item in the list
# 
# %.c random filename with suffix '.c'

.PHONY: clean pdf $(TEX_ROOT).pdf
pdf: $(TEX_ROOT).pdf

live: TEX_FLAGS += -interaction=nonstopmode --pvc
live: $(TEX_ROOT).pdf

# GENERATE PDF FILE
$(TEX_ROOT).pdf: $(TEX_DIR)/$(TEX_ROOT).tex
	$(MSG_START) $(PDF_MSG)
	$(CMD_LATEXMK) $(TEX_FLAGS) $<
	$(MSG_END) $(PDF_MSG)


# CLEAN COMPILABLE FILES
clean:
	$(MSG_START) $(CLEAN_MSG)
	$(CMD_LATEXMK) -c $(TEX_DIR)/$(TEX_ROOT).tex -output-directory=${OUT_DIR}
	$(MSG_END) $(CLEAN_MSG)

# Provide some help to the user
help:
	$(PRINT) "This makefile is used to build LaTeX documents"
	$(PRINT) "========================================================================="
	$(PRINT) "make pdf................................................generate $(TEX_ROOT).pdf"
	$(PRINT) "make live............................................live update $(TEX_ROOT).pdf"
	$(PRINT) "make help..........................................display this help text"
	$(PRINT) "make clean.........................................remove temporary files"
