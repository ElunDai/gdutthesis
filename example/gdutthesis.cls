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
% 第三条 > 六、论文页面设置 > 行间距:1.5 倍行距，此处为比对Word修正后的值
\LoadClass[a4paper,UTF8,linespread=1.63]{ctexbook}

%%%%%%%%%%
% RequirePackage
%%%%%%%%%%
\RequirePackage{ulem}% 下划线修正
\RequirePackage{xifthen} % 判断语句

%%%%%%%%%%
% Define variable settings
%%%%%%%%%%
\newcommand\school[1]{\def\gdut@value@school{#1}} % 学校
\renewcommand\title[1]{\def\gdut@value@chinesetitle{#1}} % 论文题目
\newcommand\englishtitle[1]{\def\gdut@value@englishtitle{#1}} % 论文英文题目
\newcommand\chinesedegree[1]{\def\gdut@value@chinesedegree{#1}} % 学位
\newcommand\studentnumber[1]{\def\gdut@value@studentnumber{#1}} % 学号
\newcommand\institute[1]{\def\gdut@value@college{#1}} % 学院
\newcommand\major[1]{\def\gdut@value@major{#1}} % 专业
\newcommand\class[1]{\def\gdut@value@class{#1}} % 年级班别
\renewcommand\author[1]{\def\gdut@value@author{#1}} % 作者
\renewcommand\authoren[1]{\def\gdut@value@authoren{#1}} % 作者英文名
\newcommand\advisor[1]{\def\gdut@value@advisor{#1}} % 指导老师
\newcommand\coursename[1]{\def\gdut@value@coursename{#1}} % 课程名称
\newcommand\submitdate[1]{\def\gdut@value@submitdate{#1}} % 提交日期
\newcommand\chinesekeywords[1]{\def\gdut@value@chinesekeywords{#1}} % 中文关键词
\newcommand\englishkeywords[1]{\def\gdut@value@englishkeywords{#1}} % 英文关键词
\newcommand\projectid[1]{\def\gdut@value@projectid{#1}} % 项目编号
\newcommand\projecttype[1]{\def\gdut@value@projecttype{#1}} % 题目来源, 填写企业项目|国家级|省部级|厅局级|校级
\newcommand\concentration[1]{\def\gdut@value@concentration{#1}} % 专业方向


%%%%%%%%%%
% patch commands
%%%%%%%%%%
\RequirePackage{etoolbox}
% 下一部分从奇数页开始，并且填充的空白页为空样式
\patchcmd{\cleardoublepage}
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd{\chapter}
  {\thispagestyle{\CTEX@chapter@pagestyle}} % 章节标题所在页也有页码
  {}{}{}
%\patchcmd{\@chapter}
%  {\if@twocolumn}
%  {\addtocontents{loa}{\protect\addvspace{10\p@}}
%   \if@twocolumn}
%  {}{}

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
    pdfauthor={\gdut@value@author},
    pdftitle={\gdut@value@chinesetitle},
    pdfsubject={\gdut@value@school\gdut@value@chinesedegree 毕业论文},
    pdfkeywords={\gdut@value@chinesekeywords}
  }
}

%%%%%%%%%
% 段落设置 
%%%%%%%%%
% 取消分页
\newenvironment{nocleardoublepage}{
  \let\cleardoublepageorigin\cleardoublepage
  \let\cleardoublepage\relax
}{
  \let\cleardoublepage\cleardoublepageorigin
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
% 页眉页脚设置
%%%%%%%%%%
\RequirePackage{fancyhdr}

\addtocontents{toc}{\protect}

\fancypagestyle{main}{
  \renewcommand{\headrulewidth}{0pt}
  % \fancyhead[RO]{\leftmark} % 章名
  % \fancyhead[LE]{\rightmark} % 节名
  \fancyfoot[LE,RO]{\footnotesize \thepage}
}


\fancypagestyle{plain}{
   \fancyhf{}
   % \fancyfoot[LE,RO]{\footnotesize \thepage}
   \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{translatechinese}{
  \fancyfoot[LE,RO]{\footnotesize \thepage}
  \fancyhead[C]{\huge\heiticu \chinese{thetranslate}、 外文参考文献翻译-译文}
}

\fancypagestyle{translateenglish}{
  \fancyfoot[LE,RO]{\footnotesize \thepage}
  \fancyhead[C]{\huge\heiticu \chinese{thetranslate}、 外文参考文献翻译-译文}
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
  \let\cleardoublepageorign\cleardoublepage % 保存原始信息
  \let\cleardoublepage\clearpage % 正文章节不需要从奇数页开始
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}
}

%  文后部分
\renewcommand\backmatter{
  \let\cleardoublepage\cleardoublepageorign%还原成奇数页开启新章节
  \cleardoublepage
}

%%%%%%%%%%
% 论文翻译
%%%%%%%%%%

\newcommand{\nocontentsline}[3]{}% 强制不加入目录
\newcommand{\tocless}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}%加在\chapter前使用
\let\addcontentslinesave\addcontentsline%保存现场

\newcounter{thetranslate}
\newcommand\translateenglish{
  \cleardoublepage
  \stepcounter{thetranslate}
  %\thispagestyle{translateenglish} % 页眉显示大标题
  \vspace*{10pt}
  {\centering \huge\heiticu \chinese{thetranslate}、外文参考文献翻译-原文\\}
  \vspace*{20pt}
  \let\addcontentsline\addcontentslinesave%还原现场
  \addcontentsline{toc}{part}{\chinese{thetranslate}、外文参考文献翻译-原文}
  \renewcommand{\addcontentsline}{\nocontentsline}% 防止加入目录
}
\newcommand\translatechinese{
  \cleardoublepage
  \stepcounter{thetranslate}
  %\thispagestyle{translatechinese} % 页眉显示大标题
  \vspace*{10pt}
  {\centering \huge\heiticu \chinese{thetranslate}、外文参考文献翻译-译文\\}
  \vspace*{20pt}
  %\part{外文参考文献翻译-译文}
  \let\addcontentsline\addcontentslinesave%还原现场
  \addcontentsline{toc}{part}{\chinese{thetranslate}、外文参考文献翻译-译文}
  \renewcommand{\addcontentsline}{\nocontentsline}% 防止加入目录
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
    beforeskip   = {10pt},
    afterskip    = {20pt},
  },
  section={ % 节标题
    format       = \zihao{-4}\heiticu,
    afterindent  = true,
    aftername    = \space,
    afterskip    = {12pt},
  },
  subsection={
    format       = \zihao{-4}\heiti,
    afterindent  = true,
    afterskip    = {8pt},
  },
  part={
    format       = \huge\heiticu\centering,
    name         = {,、}, % 不需要中文的 第X章
    number       = \chinese{part},
    aftername    = \nobreak,
    beforeskip   = {10pt},
    afterskip    = {20pt},
  },
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
}


%%%%%%%%%%
% 图表
%%%%%%%%%%
\RequirePackage[labelsep=quad]{caption} % 表格图
\DeclareCaptionFont{heiticu}{\heiticu}
\captionsetup[table]{font={heiticu,small},skip=0pt}
\captionsetup[figure]{font={small}}

\RequirePackage[center,nooneline,small]{subfigure} % 子图

%%%%%%%%%%
% 目录设置
%%%%%%%%%%
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage
   \pdfbookmark[0]{目录}{toc} % 增加索引
   \chapter}
  {}{}

\RequirePackage[subfigure, titles]{tocloft}
\renewcommand{\cftpnumalign}{l}
\renewcommand{\cftchapfont}{\heiti}
\renewcommand{\cftdotsep}{0}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappagefont}{}
\renewcommand{\cftbeforechapskip}{0pt}

\renewcommand{\cftpartfont}{\heiti}
\renewcommand{\cftpartpagefont}{}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftbeforepartskip}{0pt}

%%%%%%%%%%
% 绘制封面
%%%%%%%%%%
\renewcommand{\maketitle}{
	\makethesistitle
}

% 绘制论文封面
\RequirePackage{array}

\newcommand\makethesistitle{
  \pdfbookmark[0]{封面}{cover}
  \cleardoublepage
  \thispagestyle{empty}
  % 插入校徽
  \begin{figure}[t]
    \quad \quad\includegraphics[width=2.14cm]{figures/gdut_logo}
  \end{figure}
  % 插入广工校名
  \begin{figure}[h]
    \centering
    \includegraphics[width=10.36cm]{figures/gdut_title}
  \end{figure}
  \begin{center}
  % 标题
  {
    \heiticu
    \zihao{1}
    \gdut@value@chinesedegree 毕业设计（论文）\\
    \vskip \stretch{1}
    \zihao{2}
    \gdut@value@chinesetitle \\
  }
  \vskip \stretch{1}
  {
    \zihao{3}\heiti 
    \def\arraystretch{1}
    \begin{tabular}{r @{\quad} p{7cm}<{\centering}}
    %\tabcolsep20pt
    {学\quad \quad 院} & \heiticu \uline{\hfill \gdut@value@college \hfill} \\
    {专\quad \quad 业} & \heiticu \uline{\hfill \gdut@value@major \hfill} \\
    \ifthenelse{\equal{\gdut@value@concentration}{}}{}{& \heiticu \uline{\hfill （\gdut@value@concentration） \hfill} \\}
    {年级班别} & \heiticu \uline{\hfill \gdut@value@class \hfill} \\
    {学\quad \quad 号} & \heiticu \uline{\hfill \gdut@value@studentnumber \hfill} \\
    {姓\quad \quad 名} & \heiticu \uline{\hfill \gdut@value@author \hfill} \\
    {指导老师} & \heiticu \uline{\hfill \gdut@value@advisor \hfill} \\
    \end{tabular}
    \vfill
    \gdut@value@submitdate \\
  }
  \end{center}
}

%%%%%%%%%%
% 摘要
%%%%%%%%%%
\RequirePackage{pgfkeys}

\newif\ifabstractcontinue
\newif\ifprojecttype
\pgfkeys{
  /abstract/.is family, /abstract,
  language/.initial=,
  keywords/.initial=,
  keywordslabel/.initial=,
  title/.initial=,
  chinese/.style={title={摘\quad \quad 要},keywords={\gdut@value@chinesekeywords},
    language=chinese,keywordslabel={关键词：}},
  english/.style={title={Abstract},keywords={\gdut@value@englishkeywords},
    language=english,keywordslabel={Keywords:~}},
  continue/.is if=abstractcontinue,
  continue=false,
  projecttype/.is if=projecttype,
  projecttype=true,
}

% 选项:
% chinese 中文摘要
% english 英文摘要
% continue=true 连续排版不分成新页
\newenvironment{abstract}[1]{
  \pgfkeys{/abstract, #1}
  \ifabstractcontinue
    %\gdef\clearforchapter{}
  \else
    \cleardoublepage
  \fi
  %\chapter*{\pgfkeysvalueof{/abstract/title}}
  {\zihao{3}\heiticu\centering \pgfkeysvalueof{/abstract/title}\par}
  \vspace{20pt}
  \ifthenelse{\equal{\pgfkeysvalueof{/abstract/language}}{chinese}}
    {\pdfbookmark[0]{摘要}{zhabstract}}
    {\pdfbookmark[0]{Abstract}{enabstract}}
  \zihao{-4}
}{
  ~\par
  {\zihao{4}\heiticu \pgfkeysvalueof{/abstract/keywordslabel}}\pgfkeysvalueof{/abstract/keywords}\par
  \ifthenelse{\equal{\pgfkeysvalueof{/abstract/language}}{chinese}}{
    \vskip \stretch{2}
    \noindent
    \zihao{5}
    \ifprojecttype
      \ifdefempty{\gdut@value@projectid}
        {}{注：本设计(论文)题目来源于\gdut@value@projecttype 项目，项目编号为：\uline{\gdut@value@projectid}}。
      \vskip \stretch{1}
    \fi
  }{}
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

\let\MakeUppercaseorigin\MakeUppercase%储存原始设置
\preto{\printbibliography}{\renewcommand{\MakeUppercase}[1]{#1}}% 强制首字母大写其他小写
%\appto{\printbibliography}{\let\MakeUppercase\MakeUppercaseorigin}%还原原始设置%会让引用出不来

%\RequirePackage[nottoc]{tocbibind}
%\RequirePackage{gbt7714}

%\usepackage{natbib}
%\bibliographystyle{unsrtnat}

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
% 结论
%%%%%%%%%%
\newenvironment{conclusion}
  {\chapter*{结~~~~论}\addcontentsline{toc}{chapter}{结论}}
  {}

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
