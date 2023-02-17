MAKE_FILES = $(wildcard main_*.mk)
PDF_FILES = $(MAKE_FILES:%.mk=out/%.pdf)


define make_clean
	${MAKE} -f $1 clean;
endef

all: $(PDF_FILES)

out/%.pdf: %.mk
	${MAKE} -f $<

clean:
	$(foreach MAKE_FILE, ${MAKE_FILES}, $(call make_clean, ${MAKE_FILE}))
