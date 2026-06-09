.PHONY: meserve_fundamental_concepts_of_algebra
PANDOC := pandoc
PANDOCFLAGS := --write=pdf --pdf-engine=xelatex -V mainfont="STIX Two Math"

MESERVE_MAIN := meserve_fundamental_concepts_of_algebra
MESERVE_MD := $(wildcard $(MESERVE_MAIN)/src/*.md)
MESERVE_PDF := $(patsubst $(MESERVE_MAIN)/src/%.md,target/$(MESERVE_MAIN)/%.pdf,$(MESERVE_MD))
meserve_fundamental_concepts_of_algebra:
	mkdir -p target/$(MESERVE_MAIN)
	for file in $(MESERVE_MAIN)/src/*.md; do \
		name=$$(basename "$$file" .md); \
		echo "Processing $$file"; \
		$(PANDOC) "$$file" \
			-o "target/$(MESERVE_MAIN)/$$name.pdf" \
			$(PANDOCFLAGS); \
done