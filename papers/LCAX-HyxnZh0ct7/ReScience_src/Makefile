# From  https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# -----------------------------------------------------------------------------
# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.

all: draft
draft: draft.pdf
final: final.pdf


# CUSTOM BUILD RULES
# -----------------------------------------------------------------------------
metadata-draft.tex: metadata-draft.yaml
	./yaml-to-latex.py -i $< -o $@

metadata-final.tex: metadata-final.yaml
	./yaml-to-latex.py -i $< -o $@


# MAIN LATEXMK RULE
# -----------------------------------------------------------------------------
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.
draft.pdf: draft.tex content.tex metadata-draft.tex
	latexmk -pdf -pdflatex="xelatex -interaction=nonstopmode" -use-make draft.tex

final.pdf: final.tex content.tex metadata-final.tex
	latexmk -pdf -pdflatex="xelatex -interaction=nonstopmode" -use-make final.tex

clean:
	@latexmk -CA
	@rm -f *.bbl
	@rm -f *.run.xml
