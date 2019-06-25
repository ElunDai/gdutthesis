\NeedsTeXFormat{LaTeX2e}
\typeout{-- http://https://github.com/ElunDai/gdutthesis}
\ProvidesClass{gdutthesis-excellent}[2019/4/27 V0.1 Guang dong University of Technology Template]

% 基于ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\PassOptionsToClass{zihao=5,fontset=none}{ctexbook}
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

%%%%%%%%%%
% bookmarks
%%%%%%%%%%
\RequirePackage[pdfstartview=FitH,
CJKbookmarks=true,
bookmarksnumbered=true,
bookmarksopen=true,
colorlinks,
pdfborder=001,
linkcolor=black,
urlcolor=black,
anchorcolor=black,
citecolor=black,
]{hyperref}

%%%%%%%%%%
% PDF信息设置
%%%%%%%%%%
\AtBeginDocument{
  \hypersetup{
    pdfauthor={\author},
    pdftitle={\chinesetitle},
    pdfsubject={\school\chinesedegree 毕业论文},
    pdfkeywords={\chinesekeywords}
  }
}

%%%%%%%%%%
% 字体设置
%%%%%%%%%%
\setmainfont{Times New Roman}
\setsansfont{Arial}

\setCJKmainfont[ItalicFont=KaiTi,AutoFakeBold]{SimSun}
\setCJKsansfont[BoldFont=Microsoft YaHei]{Microsoft YaHei}

\setCJKfamilyfont{zhyahei}{Microsoft YaHei}
\setCJKfamilyfont{zhkai}{KaiTi}
\setCJKfamilyfont{zhfs}{FangSong}
\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei} % 真不知道黑体加粗是哪个傻逼中国人发明的，好看吗？
\setCJKfamilyfont{zhli}{LiSu}
\setCJKfamilyfont{zhyou}{You Yuan}
\NewDocumentCommand \songti   {}{\CJKfamily{zhsong}}
\NewDocumentCommand \songticu  {}{\CJKfamily{zhsong}}
\NewDocumentCommand \heiti    {}{\CJKfamily{zhhei}}
\NewDocumentCommand \heiticu  {}{\heiti\bfseries}
\NewDocumentCommand \fangsong {}{\CJKfamily{zhfs}}
\NewDocumentCommand \kaishu   {}{\CJKfamily{zhkai}}
\NewDocumentCommand \lishu    {}{\CJKfamily{zhli}}
\NewDocumentCommand \youyuan  {}{\CJKfamily{zhyou}}
\NewDocumentCommand \yahei    {}{\CJKfamily{zhyahei}}

\ctexset{
  autoindent     = true,
  chapter={ % 章标题:
    format       = \zihao{-4}\heiticu,
    name         = {}, % 不需要中文的 第X章
    number       = {\quad \quad\thechapter}, % 使用阿拉伯数字编号
    aftername    = {\space\space},
    afterindent  = true,
    fixskip      = true,
    beforeskip   = {0.8\baselineskip},
    afterskip    = {0.66\baselineskip},
  },
  section={ % 节标题
    format       = \zihao{5}\heiticu,
    number       = {\quad \quad\thesection},
    afterindent  = true,
    aftername    = \space,
    beforeskip   = {0pt},
    afterskip    = {0pt},
  },
  subsection={
    format       = \zihao{-4}\heiti,
    afterindent  = true,
    afterskip    = {8pt},
  },
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
}

\RequirePackage{geometry} % 设置版面
\geometry{
  paper      = a4paper,
  top        = 2.0cm,
  bottom     = 2.0cm,
  left       = 2.0cm,
  right      = 2.0cm,
  head       = 1.5cm,
  foot       = 1.5cm,
}


\let\cleardoublepage\relax % 新章节不换页

%%%%%%%%%%
% 参考文献
%%%%%%%%%%
\RequirePackage[
  backend=biber,
  style=gb7714-2015,
  url=false,
  doi=false,
  eprint=false,
]{biblatex}

\let\MakeUppercaseorigin\MakeUppercase%储存原始设置
\preto{\printbibliography}{\renewcommand{\MakeUppercase}[1]{#1}}% 强制首字母大写其他小写

\RequirePackage{fancyhdr}
\pagestyle{fancy} % 应用fancy的默认设置
\renewcommand{\headrulewidth}{0pt} %分割线宽度，0为没有
\fancyhf{} %清空默认设置
\fancyfoot[C]{\footnotesize \thepage}

%%%%%%%%%%
% 图表
%%%%%%%%%%
\RequirePackage[labelsep=quad]{caption} % 表格图
\DeclareCaptionFont{heiticu}{\heiticu}
\captionsetup[table]{font={heiticu,small},skip=0pt}
\captionsetup[figure]{font={small}}

\RequirePackage[center,nooneline,small]{subfigure} % 子图

%%%%%%%%%%
% 列表
%%%%%%%%%%
\RequirePackage{enumerate} % 列表
\RequirePackage{enumitem} % 列表缩进

\setlist[enumerate,1]{itemindent=\parindent,label={\arabic{enumi}、}}
\setlist[enumerate,2]{label={(\arabic{enumii})}}

%%%%%%%%%%
% 自定义标注
%%%%%%%%%%

% 自定义引用
\newcommand{\custcite}[1]{$^{[#1]}$}

% 自定义图标题
\newcommand{\custfigcaption}[1]{\caption*{#1}} % 使用\caption*{}更直接
\newcommand{\custtabcaption}[1]{\caption*{\heiticu #1}} % 在图环境伪造表的caption样式

%%%%%%%%%%
% 绘制封面
%%%%%%%%%%
\renewcommand{\maketitle}{
	\makeexcellenttitle
}


\newcommand\makeexcellenttitle{
  你好
}

%%%%%%%%%%
% include configureation file
%%%%%%%%%%
\AtEndOfClass{\input{configuration-excellent.cfg}}

\endinput
