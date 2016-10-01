DOCUMENT=diploma
.PHONY: all clean

all:
	mkdir -p out out/include out/chapters
	latexmk -pdf -cd -outdir=../out -jobname=$(DOCUMENT) -interaction=nonstopmode -file-line-error ./src/main
	cp out/$(DOCUMENT).pdf .

travis:
	latexmk -pdf -cd -jobname=$(DOCUMENT) ./src/main

clean:
	rm -rf ./out
	rm -f $(DOCUMENT).pdf
	find . -type f -name '*.aux' -delete
	find . -type f -name '*.dvi' -delete
	find . -type f -name '*.thm' -delete
	find . -type f -name '*.lof' -delete
	find . -type f -name '*.log' -delete
	find . -type f -name '*.lot' -delete
	find . -type f -name '*.fls' -delete
	find . -type f -name '*.out' -delete
	find . -type f -name '*.toc' -delete
	find . -type f -name '*.bbl' -delete
	find . -type f -name '*.blg' -delete
	find . -type f -name '*.bcf' -delete
	find . -type f -name '*.fdb_latexmk' -delete
	find . -type f -name '*.run.xml' -delete
	find . -type f -name '*.syntex.gz' -delete
