# 论文主tex文件名
THESIS = thesis

# 各子文件目录
TEX_DIR = tex
BIB_DIR = bibs
FIG_DIR = figures

# 输出文件夹
OUTDIR = obj

# ------------------------------
# You needn't change belowing

# Silence
# Q = @
 
# Set Pdf viewer
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
# PDFVIEWER = evince
	PDFVIEWER = xdg-open
endif

ifeq ($(UNAME), Darwin)
	PDFVIEWER = open
endif

# 搜索全部源码
# SOURCES := $(shell find ./ -name "*.tex" -o -name "*.bib")
TEX_FILES = $(shell find . -name '*.tex' -or -name '*.sty' -or -name '*.cls')
BIB_FILES = $(shell find . -name '*.bib')
BST_FILES = $(shell find . -name '*.bst')
FIG_FILES = $(shell find $(FIG_DIR) -type f)
SOURCES = $(TEX_FILES) $(BIB_FILES) $(BST_FILES) $(FIG_FILES) configuration.cfg

# 生成pdf的文件名
TARGET = $(THESIS).pdf

# compiler
LATEX = xelatex
BIBTEX = biber
#BIBTEX = bibtex

# Option for latexmk
LATEX_FLAGS = -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory obj/
# LATEX_FLAGS += -shell-escape # work with minted

DIRSTRUCTURES = $(TEX_DIR) $(BIB_DIR) $(FIG_DIR) $(OUTDIR)

.PHONY: all bib validate cleanall pvc view wordcount git zip example cleanexample

all: $(TARGET)

$(TARGET): $(THESIS).tex configuration.cfg $(SOURCES) $(if $(BIB_FILES), $(OUTDIR)/$(THESIS).bbl) gdutthesis.cls | mkdirstructure
	$(LATEX) $(LATEX_FLAGS) $(THESIS)
	mv $(OUTDIR)/$(TARGET) .

$(OUTDIR)/$(THESIS).aux: $(THESIS).tex configuration.cfg $(TEX_FILES) $(FIG_FILES) | mkdirstructure
	$(LATEX) $(LATEX_FLAGS) $(THESIS)

$(OUTDIR)/$(THESIS).bbl: $(SOURCES) | mkdirstructure
	$(LATEX) $(LATEX_FLAGS) $(THESIS)
	$(BIBTEX) $(OUTDIR)/$(THESIS)

# 建立工程目录结构
mkdirstructure: $(DIRSTRUCTURES)
$(DIRSTRUCTURES):
	$(Q) if [ ! -d $@ ]; then mkdir $@; fi

xelatex: | mkdirstructure
	$(LATEX) $(LATEX_FLAGS) $(THESIS)

bibtex: | mkdirstructure
	$(BIBTEX) $(OUTDIR)/$(THESIS)

$(THESIS).tex configuration.cfg:
	$(error Could not found $@; Try `make init` to start a new project)

init:
	$(Q) if [ ! -f ${THESIS}.tex ]; then cp template/thesis.tex.template ${THESIS}.tex; fi
	$(Q) if [ ! -d tex ]; then cp -r template/tex.template tex; fi
	$(Q) if [ ! -d bibs ]; then cp -r template/bibs.template bibs; fi
	$(Q) if [ ! -f configuration.cfg ]; then cp -r template/configuration.cfg.template configuration.cfg; fi

validate:
	$(LATEX) -no-pdf -halt-on-error $(OUTDIR)/$(THESIS)
	$(BIBTEX) --debug $(OUTDIR)/$(THESIS)

cleanall: clean
	$(Q) $(RM) $(TARGET) 2> /dev/null || true

clean:
	$(Q) $(RM) -r $(OUTDIR)
# 	$(Q) latexmk -c -silent 2> /dev/null
# 	$(Q) $(RM) $(TEX_DIR)/*.aux 2> /dev/null || true

view: all
	$(Q) $(PDFVIEWER) $(TARGET)

wordcount:
	$(Q) texcount $(shell find . -name '*.tex')

example: example/gdutthesis.cls example/Makefile
	$(MAKE) -C example/ THESIS=example
	$(PDFVIEWER) example/example.pdf

example/gdutthesis.cls: gdutthesis.cls
	$(Q) cp gdutthesis.cls example/gdutthesis.cls

example/Makefile: Makefile
	$(Q) cp Makefile example/Makefile

cleanexample:
	$(MAKE) -C example/ clean THESIS=example
