\NeedsTeXFormat{LaTeX2e}
\typeout{-- http://https://github.com/ElunDai/gdutthesis}
\ProvidesClass{gdutthesis}[2019/4/27 V0.1 Guang dong University of Technology Template]

% version number
\def\IEEEtransversionmajor{0}
\def\IEEEtransversionminor{1}

% 论文类型
\newif\ifgdut@coursepaper\gdut@coursepaperfalse
\DeclareOption{coursepaper}{\gdut@coursepapertrue}

\newif\ifgdut@thesis		\gdut@thesisfalse
\DeclareOption{thesis}{\gdut@bachelortrue}

% 基于ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\PassOptionsToClass{zihao=-4,fontset=none}{ctexbook}
\PassOptionsToPackage{no-math}{fontspec}
% 第三条 > 一、书写 > 毕业设计(论文)原则上要用 A4 复印纸打印
\LoadClass[a4paper,UTF8]{ctexbook}

%%%%%%%%%%
% RequirePackage
%%%%%%%%%%
\RequirePackage{ulem}% 下划线修正
\RequirePackage{xifthen} % 判断语句
\RequirePackage{enumerate} % 列表
\RequirePackage{enumitem} % 列表缩进

%%%%%%%%%%
% Define variable settings
%%%%%%%%%%
\newcommand\school[1]{\def\gdut@value@school{#1}} % 学校
\renewcommand\title[1]{\def\gdut@value@chinesetitle{#1}} % 论文题目
\newcommand\chinesedegree[1]{\def\gdut@value@chinesedegree{#1}} % 学位
\newcommand\studentnumber[1]{\def\gdut@value@studentnumber{#1}} % 学号
\newcommand\institute[1]{\def\gdut@value@college{#1}} % 学院
\newcommand\major[1]{\def\gdut@value@major{#1}} % 专业
\newcommand\class[1]{\def\gdut@value@class{#1}} % 年级班别
\renewcommand\author[1]{\def\gdut@value@author{#1}} % 作者
\newcommand\advisor[1]{\def\gdut@value@advisor{#1}} % 指导老师
\newcommand\coursename[1]{\def\gdut@value@coursename{#1}} % 课程名称
\newcommand\submitdate[1]{\def\gdut@value@submitdate{#1}} % 提交日期
\newcommand\chinesekeywords[1]{\def\gdut@value@chinesekeywords{#1}} % 中文关键词
\newcommand\englishkeywords[1]{\def\gdut@value@englishkeywords{#1}} % 英文关键词
\newcommand\projectid[1]{\def\gdut@value@projectid{#1}} % 英文关键词


%%%%%%%%%%
% patch commands
%%%%%%%%%%
\RequirePackage{etoolbox}
% 下一部分从奇数页开始，并且填充的空白页为空样式
\patchcmd{\cleardoublepage}
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
%\patchcmd{\chapter}
%  {\thispagestyle{\CTEX@chapter@pagestyle}} % 章节标题所在页也有页码
%  {}{}{}
%\patchcmd{\@chapter}
%  {\if@twocolumn}
%  {\addtocontents{loa}{\protect\addvspace{10\p@}}
%   \if@twocolumn}
%  {}{}

%%%%%%%%%%
% PDF信息设置
%%%%%%%%%%
\RequirePackage[pdfstartview=FitH,
CJKbookmarks=true,
bookmarksnumbered=true,
bookmarksopen=true,
colorlinks,
pdfborder=001,
linkcolor=black,
anchorcolor=black,
citecolor=black,
]{hyperref}

%%%%%%%%%%
% bookmarks
%%%%%%%%%%
\AtBeginDocument{
  \hypersetup{
    pdfauthor={\gdut@value@author},
    pdftitle={\gdut@value@chinesetitle},
    pdfsubject={\gdut@value@school\gdut@value@chinesedegree 毕业论文},
    pdfkeywords={\gdut@value@chinesekeywords}
  }
}


%%%%%%%%%%
% 页面设置
%%%%%%%%%%

% 第三条 > 六、论文页面设置 > 页边距:上边距:30mm;下边距:25mm;左边距:30mm;右边距:20mm;

\RequirePackage{geometry} % 设置版面
\geometry{
  paper      = a4paper,
  top        = 3.0cm,
  bottom     = 2.5cm,
  left       = 3.0cm,
  right      = 2.0cm,
  head       = 1.5cm,
  foot       = 1.5cm,
}


%%%%%%%%%%
% 段落设置
%%%%%%%%%%
% 第三条 > 六、论文页面设置 > 行间距:1.5 倍行距
\linespread{1.5}

%%%%%%%%%%
% 页眉页脚设置
%%%%%%%%%%
\RequirePackage{fancyhdr}

\addtocontents{toc}{\protect}

\fancypagestyle{main}{
  \renewcommand{\headrulewidth}{0pt}
  % \fancyhead[RO]{\leftmark} % 章名
  % \fancyhead[LE]{\rightmark} % 节名
  \fancyfoot[LE,RO]{\thepage}
}


\fancypagestyle{plain}{
   \fancyhf{}
   % \fancyfoot[LE,RO]{\thepage}
   \renewcommand{\headrulewidth}{0pt}
}

% 正文前部分页码显示方为罗马数字应用页面样式plain
\renewcommand\frontmatter{
  \cleardoublepage
  \@mainmatterfalse
  \pagestyle{plain}
  \pagenumbering{roman}
}

% 正文显示为阿拉伯数字应用页面样式fancy
\renewcommand\mainmatter{
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}
}


%%%%%%%%%%
% 字体设置
%%%%%%%%%%
\setmainfont{Times New Roman}
\setsansfont{Arial}

\setCJKmainfont[BoldFont=SimHei,ItalicFont=KaiTi]{SimSun}
\setCJKsansfont[BoldFont=Microsoft YaHei]{Microsoft YaHei}

\setCJKfamilyfont{zhyahei}{Microsoft YaHei}
\setCJKfamilyfont{zhkai}{KaiTi}
\setCJKfamilyfont{zhfs}{FangSong}
\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei} % 真不知道黑体加粗是哪个傻逼中国人发明的，好看吗？
\setCJKfamilyfont{zhli}{LiSu}
\setCJKfamilyfont{zhyou}{You Yuan}
\NewDocumentCommand \songti   {}{\CJKfamily{zhsong}}
\NewDocumentCommand \heiti    {}{\CJKfamily{zhhei}}
\NewDocumentCommand \heiticu  {}{\heiti\bfseries}
\NewDocumentCommand \fangsong {}{\CJKfamily{zhfs}}
\NewDocumentCommand \kaishu   {}{\CJKfamily{zhkai}}
\NewDocumentCommand \lishu    {}{\CJKfamily{zhli}}
\NewDocumentCommand \youyuan  {}{\CJKfamily{zhyou}}
\NewDocumentCommand \yahei    {}{\CJKfamily{zhyahei}}

%%%%%%%%%%
% 字号设置及章节名设置
%%%%%%%%%%
\ctexset{
  contentsname   = 目\quad \quad 录,
  bibname        = 参考文献,
%  listfigurename = ,
%  listtablename  = ,
  autoindent     = true,
  chapter={ % 章标题:
    format       = \zihao{3}\heiticu\centering,
    name         = {}, % 不需要中文的 第X章
    number       = \thechapter, % 使用阿拉伯数字编号
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    fixskip      = true,
    beforeskip   = {0pt},
    afterskip    = {20pt},
  },
  section={ % 节标题
    format       = \zihao{-4}\heiticu,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={
    format       = \zihao{-4}\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
}


%%%%%%%%%%
% 图表
%%%%%%%%%%
\RequirePackage[labelsep=quad,skip=10pt]{caption} % 表格图
\DeclareCaptionFont{heiticu}{\heiticu}
\captionsetup[table]{font={heiticu,small}}
\captionsetup[figure]{font={small}}

\RequirePackage[center,nooneline,small]{subfigure} % 子图

%%%%%%%%%%
% 目录设置
%%%%%%%%%%
%\patchcmd\tableofcontents
%  {\chapter}
%  {\cleardoublepage
%   \pdfbookmark[0]{目录}{toc} % 增加索引
%   \chapter}
%  {}{}

\RequirePackage[subfigure, titles]{tocloft}
\renewcommand{\cftpnumalign}{l}
\renewcommand{\cftchapfont}{\heiti}
\renewcommand{\cftdotsep}{0}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

%%%%%%%%%%
% 绘制封面
%%%%%%%%%%

\renewcommand{\maketitle}{
	\makethesistitle
}

% 绘制论文封面
\RequirePackage{array}

\newcommand\makethesistitle{
  \cleardoublepage
  \thispagestyle{empty}
  % 插入校徽
  \begin{figure}[t]
    \includegraphics[width=0.14\linewidth]{figures/gdut_logo}
  \end{figure}
  % 插入广工校名
  \begin{figure}[h]
    \centering
    \includegraphics[width=0.7\linewidth]{figures/gdut_title}
  \end{figure}
  
  \begin{center}
  % 标题
  {
    \zihao{2} \heiticu
    \gdut@value@chinesedegree 毕业设计（论文）\\
    \vskip \stretch{1}
    \gdut@value@chinesetitle \\
  }
  \vskip \stretch{1}
  {
    \zihao{4}\heiti
    \def\arraystretch{1.5}
    \begin{tabular}{r @{\quad} c}
    %\tabcolsep20pt
    学\quad \quad 院 & \uline{\hfill \gdut@value@college \hfill} \\
    专\quad \quad 业 & \uline{\hfill \gdut@value@major \hfill} \\
    年级班别 & \uline{\hfill \gdut@value@class \hfill} \\
    学\quad \quad 号 & \uline{\hfill \gdut@value@studentnumber \hfill} \\
    姓\quad \quad 名 & \uline{\hfill \gdut@value@author \hfill} \\
    指导老师 & \uline{\hfill \gdut@value@advisor \hfill} \\
    \end{tabular}
    \vfill
    \gdut@value@submitdate \\
  }
  \end{center}
}

%%%%%%%%%%
% 摘要
%%%%%%%%%%
\newenvironment{abstract}[1]{ % 传入 chinese | english
  \cleardoublepage
  \def\gdut@value@abstracttype{#1} % 储存#1到变量中给end evironment用
  \ifthenelse{\equal{\gdut@value@abstracttype}{english}}{
  	\chapter*{Abstract}
    \zihao{4} \markboth{Abstract}{}
  }{
    \pdfbookmark[0]{摘要}{abstract}
    \chapter*{摘\quad \quad 要}
    \zihao{4} \markboth{摘\quad \quad 要}{}
  }
}{
  ~\\
  ~\par
  \ifthenelse{\equal{\gdut@value@abstracttype}{english}}{
    \zihao{4}\textbf{Keywords: }\gdut@value@englishkeywords
  }{
    \zihao{4}{\heiticu 关键词：}\gdut@value@chinesekeywords
    \vskip \stretch{2}
    \noindent
    \zihao{5} 注：本设计(论文)题目来源于教师的国家级（或省部级、厅局级、校级、企业）科研项目，项目编号为：
    \uline{\ifdefempty{\gdut@value@projectid}{\hspace{4em}}{\gdut@value@projectid}}。
    \vskip \stretch{1}
  }
}

%%%%%%%%%%
% 参考文献
%%%%%%%%%%
%\RequirePackage{cite}
%\bibliographystyle{plain}

\RequirePackage[
  backend=biber,
  style=gb7714-2015,
  url=false,
  doi=false,
  eprint=false,
]{biblatex}

%%%%%%%%%%
% 附录
%%%%%%%%%%
\RequirePackage{appendix}
\renewcommand{\appendixname}{附录}
\renewcommand{\appendixpagename}{附~~~~录}
%\renewcommand{\appendixtocname}{附录}

%%%%%%%%%%
% 致谢
%%%%%%%%%%
\renewenvironment{thanks}{%
  \chapter*{%
    致~~~~谢
    \markboth{致~~~~谢}{}
  }
  \addcontentsline{toc}{chapter}{致谢}
}{}

%%%%%%%%%%
% 书脊
%%%%%%%%%%
\newcommand{\spine}{
\cleardoublepage
\thispagestyle{empty}
\begin{figure}[h]
\centering
\vskip 2cm % 距离顶部2cm
\begin{minipage}{1.5em}
\zihao{4} \bfseries
\gdut@value@chinesetitle
\end{minipage}
\end{figure}

\vskip \stretch{1}

\begin{figure}[h]
\centering
\begin{minipage}{1.5em}
\zihao{4} \bfseries
\gdut@value@author
\vskip 2cm % 姓名距离底学院2cm
\gdut@value@college
\end{minipage}
\end{figure}

\vskip 2cm % 距离底部2cm
}


%%%%%%%%%%
% 列表
%%%%%%%%%%
%\def\labelenumi{\arabic{enumi}、} % 列表样式 1、xxx 2、xxx

\newenvironment{kuan}
  {\begin{enumerate}[itemindent=\parindent,label={1、}]}
  {\end{enumerate}}

\newenvironment{xiang}
  {\begin{enumerate}[label={(1)}]}
  {\end{enumerate}}

%%%%%%%%%%
% 代码块
%%%%%%%%%%
\RequirePackage{listings}

\renewcommand{\lstlistingname}{清单}

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em,
  % 改变双引号和单引号的样式
  literate={"}{\textquotedbl}1,
  upquote=true
}


%%%%%%%%%%
% include configureation file
%%%%%%%%%%
\AtEndOfClass{\input{configuration.cfg}}

\endinput
