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
SOURCES = $(TEX_FILES) $(BIB_FILES) $(BST_FILES) $(FIG_FILES)

# 生成pdf的文件名
TARGET = $(THESIS).pdf

# compiler
LATEX = xelatex
BIBTEX = biber
# Option for latexmk
LATEX_FLAGS = -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory obj/

DIRSTRUCTURES = $(TEX_DIR) $(BIB_DIR) $(FIG_DIR) $(OUTDIR)

.PHONY: all bib validate cleanall pvc view wordcount git zip

all: $(TARGET)

# $(OUTDIR)/$(THESIS).pdf: $(THESIS).tex $(SOURCES) gdutthesis.cls configuration.cfg Makefile | mkdirstructure
$(TARGET): $(OUTDIR)/$(THESIS).aux $(SOURCES) $(if $(BIB_FILES), obj/$(THESIS).bbl)| mkdirstructure
	$(LATEX) $(LATEX_FLAGS) $(THESIS)
	mv $(OUTDIR)/$(TARGET) .

$(OUTDIR)/$(THESIS).aux: $(TEX_FILES) $(FIG_FILES) | mkdirstructure
	$(LATEX) $(LATEX_FLAGS) $(THESIS)

$(OUTDIR)/$(THESIS).bbl: $(BIB_FILES) | $(OUTDIR)/$(THESIS).aux
	$(BIBTEX) $(OUTDIR)/$(THESIS)

# 建立工程目录结构
mkdirstructure: $(DIRSTRUCTURES)
$(DIRSTRUCTURES):
	$(Q) if [ ! -d $@ ]; then mkdir $@; fi

$(THESIS).tex:
	@ echo "Auto generate "$(THESIS)".tex from template."
	cp ./example/thesis_tmplate.tex $(THESIS).tex

validate:
	$(LATEX) -no-pdf -halt-on-error $(OUTDIR)/$(THESIS)
	$(BIBTEX) --debug $(OUTDIR)/$(THESIS)

cleanall: clean
	$(Q) $(RM) $(TARGET) 2> /dev/null || true

clean:
	$(Q) $(RM) -r $(OUTDIR)
# 	$(Q) latexmk -c -silent 2> /dev/null
# 	$(Q) $(RM) $(TEX_DIR)/*.aux 2> /dev/null || true


git:
	git push --tags github; git push github;

view: all
	$(Q) $(PDFVIEWER) $(TARGET)

wordcount:
	$(Q) texcount $(THESIS).tex
