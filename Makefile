# 论文主tex文件名
THESIS = thesis

# 各子文件目录
TEX_DIR = tex
BIB_DIR = bib
FIG_DIR = figures

# ------------------------------
# You needn't change belowing

# Silence
# Q = @

# 搜索全部源码
SOURCES := $(shell find ./ -name "*.tex" -o -name "*.bib")

# 生成pdf的文件名
TARGET = $(THESIS).pdf

# compiler
LATEX = xelatex
# Option for latexmk
LATEX_OPT = -synctex=1 -interaction=nonstopmode

DIRSTRUCTURES = $(TEX_DIR) $(BIB_DIR) $(FIG_DIR)

.PHONY : all cleanall pvc view wordcount git zip

all: $(TARGET)

$(TARGET): $(THESIS).tex $(SOURCES) | mkdirstructure #  gdutthesis.cls gdutthesis.cfg Makefile
	$(LATEX) $(LATEX_OPT) $(THESIS)

# 建立工程目录结构
mkdirstructure: $(DIRSTRUCTURES)
$(DIRSTRUCTURES):
	$(Q) if [ ! -f $@ ]; then mkdir $@; fi

$(THESIS).tex:
	@ echo "Auto generate "$(THESIS)".tex from template."
	cp ./example/thesis_tmplate.tex $(THESIS).tex

validate:
	xelatex -no-pdf -halt-on-error $(THESIS)
	biber --debug $(THESIS)

cleanall: clean
	$(Q) $(RM) $(TARGET) 2> /dev/null || true
	$(Q) $(RM) $(THESIS).xdv 2> /dev/null || true
	$(Q) $(RM) $(THESIS).synctex.gz 2> /dev/null || true

clean:
	$(Q) latexmk -c -silent 2> /dev/null
	$(Q) $(RM) $(TEX_DIR)/*.aux 2> /dev/null || true


git:
	git push --tags github; git push github;

view : $(THESIS).pdf
	xdg-open $<

wordcount:
	$(Q) texcount $(THESIS).tex
