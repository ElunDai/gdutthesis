% 格式要求
% 毕业设计(论文)原则上要用 A4 复印纸打印

% 页边距:上边距:30mm;下边距:25mm;左边距:30mm;右边距:20mm;行间距:1.5 倍行距;
% 页码:论文页码从绪论部分开始,至附录,用阿拉伯数字连续编排,页码位于页脚右侧。封面、中英文设计说明(论文摘要)和目录不编入论文页码。

% 字体和字号
% 论 文 题目: 二号黑体加粗(封面)
% 章 标 题: 三号黑体加粗
% 节 标 题: 小四号黑体加粗
% 条 标 题: 小四号黑体
% 正 文: 小四号宋体
% 页 码: 小五号 Times New Roman 体
% 数字和字母: Times New Roman 体

% 公式
% 公式应另起一行写在稿纸中央,公式和编号之间不加虚线。
% 公式较长时最好在等号“=”处转行
% 公式序号按章编排,如第一章第一个公式序号为“(1.1)” , 附录 A 中的第一个公式为“(A1)”等
% 用圆括号括起来放在公式右边行末。
% 文中引用公式时,一般用“见式(1.1)”或“由公式(1.1)”。

% 表格
% 每个表格应有自己的表序和表题。并应在文中进行说明,例如:“如表 1.1”。
% 表序一般按章编排,如第一章第一个插表的序号为“表 1.1”等。表序与表名之间空一格,表名中不允许使用标点符号,表名后不加标点。
% 表序与表名置于表上居中(五号黑体加粗,数字和字母为五号 Times New Roman 体加粗)
% 表头设计应简单明了,尽量不用斜线。表头与表格为一整体,不得拆开排写于两页。表格不加左右边线。
% 全表如用同一单位,将单位符号移至表头右上角。
% 表中数据应正确无误,书写清楚。数字空缺的格内加“-”字线(占 2 个数字),不允许用“”、“同上”之类的写法
% 表内文字说明(五号宋体),起行空一格、转行顶格、句末不加标点。
% 表中若有附注时,用小五号宋体,写在表的下方,句末加标点。
% 仅有一条附注时写成:“注:...”;有多条附注时,附注各项的序号一律用阿拉伯数字,写成:“注:1....”。

% 插图
% 每幅插图均应有图题(由图号和图名组成)。图号按章编排,如第一章第一图的图号为“图 1.1”等。
% 图题置于图下,用五号宋体。有图注或其他说明时应置于图题之上, 用小五号宋体。
% 图名在图号之后空一格排写。引用图应说明出处,在图题右上角加引用文献号。
% 图中若有分图时,分图号用(a)、(b)等置于分图之下。

% 注释


% 附录
% 论文的附录依序用大写正体 A,B,C......编序号,如:附录 A。
% 附录中的图、表、式等另行编序号,与正文分开,也一律用阿拉伯数字编码,但在数码前冠以附录序码,如:图 A1;表 B2;式(B3)等,见样张 10(1)、10(2)。


% 论文题目：二号黑体加粗居中
% 外语论文题目需中外文表示,外文题目另起行,小二号加粗
% 学  院、专  业、年级班别、学  号、学生姓名、指导教师、年  月

% 封面书脊
% 论文题目、姓名：四号黑体加粗
% 学院名称：小四号黑体加粗

% 中文设计说明(论文摘要)
% 摘要：三号黑体,加粗
% 摘要正文后下空一行打印“关键词”三字(四号黑体,加粗)，最后一个关键词后不打标点符号
% 摘要正文和关键词(小四号宋体,1.5 倍行距)

% 英文设计说明(论文摘要)
% 另起一页
% 字号与中文摘要相同
% 英文和汉语拼音一律为 Times New Roman 体

% 目录
% 理工、社科类专业目录的三级标题,建议按 1......、 1.1......、 1.1.1......的格式编写;
% 外语类专业目录的三级标题,建议按I、A、a 的格式编写。
% 目录中各章题序的阿拉伯数字用 Times New Roman 体,第一级标题用小四号黑体,
% 其余用小四号宋体。

% 设计(论文)正文
% 每章应另起一页
% 各章标题要突出重点、简明扼要。
% 字数一般在 15 字以内, 不得使用标点符号。
% 标题中尽量不采用英文缩写词,对必须采用者,应使用本行业的通用缩写词。
% 层次为章(如“1”)、节(如“1.1”)、条(如“1.1.1”)、款(如“1、”)、项(如“(1)”)。
% 若节后无需“条”时可直接列“款”、“项”。
% “节”、“条”的段前、段后各设为 0.5 行

% 参考文献的引用
% 用上标的形式置于所引内容最末句的右上角,用小四号字体。所引参考文献编号用阿拉伯数字置于方括号中
% 当提及的参考文献为文中直接说明时,其序号应该用小四号字与正文排齐,如“由文献[8, 10-14]可知”。

\NeedsTeXFormat{LaTeX2e}
\typeout{-- http://https://github.com/ElunDai/gdutthesis}
\ProvidesClass{gdutthesis}[Guang dong University of Technology Template]

% version number
\def\IEEEtransversionmajor{0}
\def\IEEEtransversionminor{1}

% 论文类型
\newif\ifgdut@coursepaper	\gdut@coursepaperfalse
\DeclareOption{coursepaper}{\gdut@coursepapertrue}

\newif\ifgdut@thesis		\gdut@thesisfalse
\DeclareOption{thesis}{\gdut@bachelortrue}

% 基于ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\PassOptionsToClass{zihao=-4}{ctexbook}
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

% Define variable settings
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
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage
   \pdfbookmark[0]{目录}{toc} % 增加索引
   \chapter}
  {}{}

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
 % bookmarks
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
\RequirePackage{geometry} % 设置版面
\geometry{
  paper      = a4paper,
  top        = 3.0cm,
  bottom     = 2.5cm,
  left       = 3.0cm,
  right      = 2.0cm,
}


%%%%%%%%%%
% 页眉页脚设置
%%%%%%%%%%

% 去除目录页码
\addtocontents{toc}{\protect\thispagestyle{empty}}

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
  \pagestyle{fancy}
  \pagenumbering{arabic}
}

\RequirePackage{fancyhdr}
% 正文页眉页脚设置
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\fancyhead[RO]{\leftmark} % 章名
\fancyhead[LE]{\rightmark} % 节名
\fancyfoot[LE,RO]{\thepage}

\fancypagestyle{plain}{
   \fancyhf{}
   \fancyfoot[LE,RO]{\thepage}
   \renewcommand{\headrulewidth}{0pt}
}

%%%%%%%%%%
% 字号设置及章节名设置
%%%%%%%%%%
\ctexset{
  contentsname   = 目\quad \quad 录,
%  listfigurename = ,
%  listtablename  = ,
  autoindent     = true,
  chapter={ % 章标题:
    format       = \zihao{3}\bfseries\heiti\centering,
    name         = {}, % 不需要中文的 第X章
    number       = \thechapter, % 使用阿拉伯数字编号
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {15\p@},
    afterskip    = {12\p@},
  },
  section={ % 节标题
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={ % 条标题
    format       = \zihao{-4}\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsubsection={ %
    format       = \normalsize\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
}

%%%%%%%%%%
% 段落设置
%%%%%%%%%%
\linespread{1.5}

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
    \includegraphics[width=0.15\linewidth]{gdut_logo}
  \end{figure}
  % 插入广工校名
  \begin{figure}[h]
    \centering
    \includegraphics[width=0.7\linewidth]{gdut_tittle}
  \end{figure}
  
  \begin{center}
  % 标题
  {
    \zihao{2} \bfseries
    \gdut@value@chinesedegree 毕业设计（论文）\\
    \vskip \stretch{1}
    \gdut@value@chinesetitle \\
  }
  \vskip \stretch{1}
  {
    \zihao{4}\bfseries
    \def\arraystretch{1.5}
    \begin{tabular}{r @{\quad} c}
    %\tabcolsep20pt
    学\quad \quad 院 & \gdut@value@college \\
    \cline{2-2}
    专\quad \quad 业 & \gdut@value@major \\
    \cline{2-2}
    年级班别 & \gdut@value@class \\
    \cline{2-2}
    学\quad \quad 号 & \gdut@value@studentnumber \\
    \cline{2-2}
    姓\quad \quad 名 & \gdut@value@author \\
    \cline{2-2}
    指导老师 & \gdut@value@advisor \\
    \cline{2-2}
    \end{tabular}
  }
  \end{center}
  \vskip \stretch{1}
  \begin{figure}[b]
    \centering
    \zihao{4} \gdut@value@submitdate \\
  \end{figure}
}

%%%%%%%%%%
% 摘要
%%%%%%%%%%
%\newif\ifgdut@abstracttype\sjtu@reviewfalse

\RequirePackage{xifthen} % 判断语句
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
  ~\\ \noindent
  \ifthenelse{\equal{\gdut@value@abstracttype}{english}}{
    \zihao{4}\textbf{Keywords: }\gdut@value@englishkeywords
  }{
    \zihao{4}\textbf{关键词：}\gdut@value@chinesekeywords
  }
}

%%%%%%%%%%
% 
%%%%%%%%%%

% include configureation file
\AtEndOfClass{\input{configuration.cfg}}

\endinput
