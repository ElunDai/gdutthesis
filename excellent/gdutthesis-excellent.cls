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


\endinput
