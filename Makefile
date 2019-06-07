# 论文主tex文件名
THESIS = thesis

# 翻页方向，留空表示不改变设置
OPENSIDE = oneside

# 各子文件目录
TEX_DIR = tex
BIB_DIR = bibs
FIG_DIR = figures

# 输出文件夹
OUTDIR = obj

# ------------------------------
# You needn't change belowing

# Silence
Q = @
 
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

.PHONY: all xelatex bibtex validate cleanall view wordcount example cleanexample setside

all: $(TARGET)

# 创造别名
xelatex: $(OUTDIR)/$(THESIS).aux
bibtex: $(OUTDIR)/$(THESIS).bbl

# set openside
setside:
ifeq ($(OPENSIDE),twoside)
	sed -i 's/oneside/twoside/' $(THESIS).tex 
endif
ifeq ($(OPENSIDE),oneside)
	sed -i 's/twoside/oneside/' $(THESIS).tex
endif

# 先检查规.need_latex则判断是否需要编译
$(TARGET): $(OUTDIR)/.need_latex | mkdirstructure setside
	$(Q) echo 编译$(THESIS).tex 原文
	$(Q) $(MAKE) -C . $(OUTDIR)/$(THESIS).aux
	$(Q) echo 生成$(OUTDIR)/$(THESIS).bbl参考文献
	$(Q) $(MAKE) -C . $(OUTDIR)/$(THESIS).bbl
	$(Q) echo 修正交叉引用
	$(Q) $(MAKE) -C . $(OUTDIR)/$(THESIS).aux
	$(Q) echo 修正目录
	$(Q) $(MAKE) -C . $(OUTDIR)/$(THESIS).aux
	mv $(OUTDIR)/$(TARGET) .

# 当源码发生改变的时候更新.need_latex标记
$(OUTDIR)/.need_latex: $(THESIS).tex $(BIB_FILES) $(TEX_FILES) $(FIG_FILES) configuration.cfg gdutthesis.cls Makefile | mkdirstructure
	$(Q) touch $(OUTDIR)/.need_latex

# 当.need_latex标记更新的时候才执行编译
$(OUTDIR)/$(THESIS).aux: $(OUTDIR)/.need_latex
	$(LATEX) $(LATEX_FLAGS) $(THESIS)
	$(Q) # 提示有bib没有编译
	$(Q) if [ "`grep "Package biblatex Warning: Please (re)run Biber on the file:" $(OUTDIR)/$(THESIS).log`" ]; then touch $(OUTDIR)/.need_bibtex; fi
	$(Q) # 提示有bib编译后还需编译一次aux修正交叉引用
	$(Q) if [ "`grep "Package biblatex Warning: Please rerun LaTeX." $(OUTDIR)/$(THESIS).log`" ]; then touch $(OUTDIR)/.need_latex; fi

$(OUTDIR)/.need_bibtex:
	$(error please run `make xelatex` first)

$(OUTDIR)/$(THESIS).bbl: $(OUTDIR)/.need_bibtex
	$(BIBTEX) $(OUTDIR)/$(THESIS)
	touch $(OUTDIR)/.need_latex

# 建立工程目录结构
mkdirstructure: $(DIRSTRUCTURES)
$(DIRSTRUCTURES):
	$(Q) if [ ! -d $@ ]; then mkdir $@; fi


$(THESIS).tex configuration.cfg:
	$(error Could not found $@; Try `make init` to start a new project)

test:
	if [ "`grep "Package biblatex Warning: Please (re)run Biber on the file:" $(OUTDIR)/$(THESIS).log`" ]; then echo touch $(OUTDIR)/.need_bibtex; fi

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
	$(MAKE) -C example/
	$(PDFVIEWER) example/example.pdf

example/gdutthesis.cls: gdutthesis.cls
	$(Q) cp gdutthesis.cls example/gdutthesis.cls

example/Makefile: Makefile
	$(Q) cp Makefile example/Makefile
	sed -i 's/THESIS *=.*/THESIS = example/' example/Makefile

cleanexample:
	$(MAKE) -C example/ clean
