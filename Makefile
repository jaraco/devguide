# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
PYTHON        = python3
VENVDIR       = ./venv
BUILDDIR      = _build
SPHINXOPTS    = -W --keep-going -n
SPHINXBUILD   = $(VENVDIR)/bin/sphinx-build
SPHINXLINT    = $(VENVDIR)/bin/sphinx-lint
PAPER         =

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

.PHONY: help venv clean html dirhtml singlehtml pickle json htmlhelp qthelp \
        devhelp epub latex latexpdf text man changes linkcheck doctest htmlview check

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  venv       to create a venv with necessary tools"
	@echo "  html       to make standalone HTML files"
	@echo "  htmlview   to open the index page built by the html target in your browser"
	@echo "  clean      to remove the venv and build files"
	@echo "  dirhtml    to make HTML files named index.html in directories"
	@echo "  singlehtml to make a single large HTML file"
	@echo "  pickle     to make pickle files"
	@echo "  json       to make JSON files"
	@echo "  htmlhelp   to make HTML files and a HTML help project"
	@echo "  qthelp     to make HTML files and a qthelp project"
	@echo "  devhelp    to make HTML files and a Devhelp project"
	@echo "  epub       to make an epub"
	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
	@echo "  text       to make text files"
	@echo "  man        to make manual pages"
	@echo "  changes    to make an overview of all changed/added/deprecated items"
	@echo "  linkcheck  to check all external links for integrity"
	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"
	@echo "  check      to run a check for frequent markup errors"

clean: clean-venv
	-rm -rf $(BUILDDIR)/*

clean-venv:
	rm -rf $(VENVDIR)

venv:
	@if [ -d $(VENVDIR) ] ; then \
		echo "venv already exists."; \
		echo "To recreate it, remove it first with \`make clean-venv'."; \
	else \
		$(MAKE) ensure-venv; \
	fi

ensure-venv:
	@if [ ! -d $(VENVDIR) ] ; then \
		$(PYTHON) -m venv $(VENVDIR); \
		$(VENVDIR)/bin/python3 -m pip install --upgrade pip; \
		$(VENVDIR)/bin/python3 -m pip install -r requirements.txt; \
		echo "The venv has been created in the $(VENVDIR) directory"; \
	fi

html: ensure-venv
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

dirhtml: ensure-venv
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

singlehtml: ensure-venv
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

pickle: ensure-venv
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) $(BUILDDIR)/pickle
	@echo
	@echo "Build finished; now you can process the pickle files."

json: ensure-venv
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) $(BUILDDIR)/json
	@echo
	@echo "Build finished; now you can process the JSON files."

htmlhelp: ensure-venv
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) $(BUILDDIR)/htmlhelp
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in $(BUILDDIR)/htmlhelp."

qthelp: ensure-venv
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) $(BUILDDIR)/qthelp
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/PythonDevelopersGuide.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/PythonDevelopersGuide.qhc"

devhelp: ensure-venv
	$(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) $(BUILDDIR)/devhelp
	@echo
	@echo "Build finished."
	@echo "To view the help file:"
	@echo "# mkdir -p $$HOME/.local/share/devhelp/PythonDevelopersGuide"
	@echo "# ln -s $(BUILDDIR)/devhelp $$HOME/.local/share/devhelp/PythonDevelopersGuide"
	@echo "# devhelp"

epub: ensure-venv
	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) $(BUILDDIR)/epub
	@echo
	@echo "Build finished. The epub file is in $(BUILDDIR)/epub."

latex: ensure-venv
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make' in that directory to run these through (pdf)latex" \
	      "(use \`make latexpdf' here to do that automatically)."

latexpdf: ensure-venv
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "Running LaTeX files through pdflatex..."
	make -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

text: ensure-venv
	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
	@echo
	@echo "Build finished. The text files are in $(BUILDDIR)/text."

man: ensure-venv
	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) $(BUILDDIR)/man
	@echo
	@echo "Build finished. The manual pages are in $(BUILDDIR)/man."

changes: ensure-venv
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
	@echo
	@echo "The overview file is in $(BUILDDIR)/changes."

linkcheck: ensure-venv
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

doctest: ensure-venv
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

htmlview: html
	$(PYTHON) -c "import os, webbrowser; webbrowser.open('file://' + os.path.realpath('_build/html/index.html'))"

check: ensure-venv
	# Ignore the tools and venv dirs and check that the default role is not used.
	$(SPHINXLINT) -i tools -i $(VENVDIR) --enable default-role

serve:
	@echo "The 'serve' target was removed, use 'htmlview' instead" \
	      "(see https://github.com/python/cpython/issues/80510)"
