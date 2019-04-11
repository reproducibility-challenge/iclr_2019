%% ----------------------------------------------------------------------------
%% ReScience article template
%% Copyright (c) 2018 N.P. Rougier,
%% Released under a Creative Commons Attribution 4.0 International license.
%% ----------------------------------------------------------------------------
%% Dependencies:
%%  * metadata-draft.tex or metadata-final.tex (defined in \metadataFILE)
%%  * header.tex
%%  * content.tex
%% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rescience}[2019/03/05 Style for ReScience articles]

\newif\ifisfinal

\DeclareOption{final}{\isfinaltrue}
\DeclareOption{draft}{\isfinalfalse}

\ExecuteOptions{draft}

\ProcessOptions\relax

\ifisfinal
\def \metadataFILE{metadata-final.tex}
\else
\def \metadataFILE{metadata-draft.tex}
\fi

\LoadClass[a4paper, oneside, 10pt]{article}

% ---- Encoding ---------------------------------------------------------------
\RequirePackage[utf8]{inputenc}


% --- Langage -----------------------------------------------------------------
\RequirePackage[american]{babel}


% --- Various packages --------------------------------------------------------
\RequirePackage{ifthen}
\RequirePackage{tabularx}
\RequirePackage{tikz}
\RequirePackage{marginnote}
\RequirePackage{csquotes}


% --- Mathematics -------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{mathtools}

% --- Page layout -------------------------------------------------------------
\RequirePackage[a4paper]{geometry}
\geometry{left=4.5cm, right=3cm, top=3cm, bottom=3.5cm,
          heightrounded, headheight=12.1pt,
          marginparwidth=3cm, marginparsep=0.75cm, footskip=2cm}
\reversemarginpar


% --- Font stack --------------------------------------------------------------

%% PDFLaTeX
%% \RequirePackage[light,condensed]{roboto} % Sans Serif
%% \RequirePackage[default,light,semibold,tabular]{sourceserifpro} % Roman
%% \RequirePackage[varqu]{zi4} % Monotype
%% \makeatletter
%% \def\bfseries@sf{sb}
%% \makeatother

% XeLaTeX
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
 \setmainfont{Source Serif Pro}[
  UprightFont=Source Serif Pro Light,
  ItalicFont = Source Serif Pro Light,
  ItalicFeatures={FakeSlant=0.2},
  BoldFont = Source Serif Pro,
  BoldItalicFeatures={FakeSlant=0.2}
]
\setsansfont{Roboto Condensed}[
  UprightFont = *-Light,
  BoldFont = *-Regular
]

\setmonofont{Source Code Pro}[
  Extension = .ttf,
  UprightFont = font-Light,
  BoldFont = font-Regular
]

\newfontfamily\RobotoCon{Roboto Condensed}[
  UprightFont = *-Regular,
  BoldFont = *-Bold
]  

\newfontfamily\Roboto{Roboto}[
  UprightFont = *-Regular,
  BoldFont = *-Black
]  

\newfontfamily\SpaceRoboto{Roboto}[
  UprightFont = *-Regular,
  BoldFont = *-Medium,
  UprightFeatures={LetterSpace=35},
  BoldFeatures={LetterSpace=35}
]  


\RequirePackage{microtype}


% --- Colors ------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{darkred}{HTML}{CF232B}
\definecolor{darkblue}{HTML}{2B23CF}
\definecolor{darkgray}{HTML}{555555}
\definecolor{lightgray}{HTML}{cccccc}
\colorlet{citecolor}{black}
\colorlet{linkcolor}{darkgray}
\colorlet{urlcolor}{darkgray}


% -- Section titles & ToC -----------------------------------------------------
\RequirePackage{titlesec}
%% \titleformat{\section}
%%             {\Large\sffamily\bfseries}{\thesection}{0.25em}{}
%% \titleformat{\subsection}
%%             {\large\sffamily\bfseries}{\thesection}{0.25em}{}
            
\titleformat{\section}{\Large\sffamily\bfseries}
            {\llap{{\textcolor{lightgray}{\normalfont\sffamily\thesection}}\hskip 0.5em}}{0em}{}
\titleformat{\subsection}{\large\sffamily\bfseries}
     {\llap{{\textcolor{lightgray}{\normalfont\sffamily\thesubsection}}\hskip 0.5em}}{0em}{}
     
\titleformat{\subsubsection}[runin]
            {\normalfont\sffamily\bfseries}{}{0em}{}[\mbox{ --- }]
\titlespacing{\subsubsection}
             {0pt}                        % left
             {3.25ex plus 1ex minus .2ex} % before
             {0pt}                        % after


%% \allsectionsfont{\normalfont\sffamily}


% --- Captions ----------------------------------------------------------------
\RequirePackage[labelsep=period]{caption}
\renewcommand{\captionfont}{\small}
\renewcommand{\captionlabelfont}{\small\sffamily\bfseries}
%% \captionsetup[figure]{justification=justified, singlelinecheck=false}
%% \captionsetup[table]{justification=justified, singlelinecheck=false}
%% \captionsetup[listing]{justification=justified, singlelinecheck=false}


% --- Hyperref & colors -------------------------------------------------------
\RequirePackage[pdfusetitle,
            bookmarks=true,
            breaklinks=true,
            pdfborder={0 0 0},
            citecolor=citecolor,
            linkcolor=linkcolor,
            urlcolor=urlcolor,
            colorlinks=true,
            linktocpage=false,
            hyperindex=true,
            colorlinks=true,
            linktocpage=false,
            linkbordercolor=white]{hyperref}
\hypersetup{linkcolor=black,urlcolor=darkgray}
\urlstyle{sf}


% --- Listings ----------------------------------------------------------------
\RequirePackage{listings}
\lstset{%
  basicstyle=\ttfamily\small,
  keywordstyle=\color{black},
  commentstyle=\color{gray},
  stringstyle=\color{black},
  backgroundcolor=\color{white},
  numbers=none,
  numberstyle=\ttfamily,
  stepnumber=2,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  frame=none,
  framerule=0.5pt,
  tabsize=2,
  rulesep=5em,
  captionpos=b,
  breaklines=true,
  breakatwhitespace=false,
  framexleftmargin=0em,
  xleftmargin=0em,
  framexrightmargin=0em,
  xrightmargin=0em,
  aboveskip=0.5em,
  belowskip=0.5em,
}


% --- Text Layout -------------------------------------------------------------
% No indentation at beginning of a new paragraph
\setlength\parindent{0pt}

% No space between items in itemize and enuemrate lists
\RequirePackage{enumitem}
%\setlist[itemize]{noitemsep}
%\setlist[enumerate]{noitemsep}

\renewcommand*{\marginfont}{\scriptsize\sffamily}

%\linespread{1.1}


% --- Authors block -----------------------------------------------------------
\RequirePackage{authblk,etoolbox}
\makeatletter
% patch \maketitle so that it doesn't center
\patchcmd{\@maketitle}{center}{flushleft}{}{}
\patchcmd{\@maketitle}{center}{flushleft}{}{}
% patch \maketitle so that the font size for the title is normal
\patchcmd{\@maketitle}{\LARGE}{\LARGE\sffamily\bfseries\vspace{-2.em}}{}{}
% patch the patch by authblk so that the author block is flush left
\def\maketitle{{%
  \renewenvironment{tabular}[2][]
    {\begin{flushleft}}
    {\end{flushleft}}
  \AB@maketitle}}
\makeatother
\setlength{\affilsep}{0.25em}
\renewcommand\Affilfont{\normalfont\sffamily\footnotesize}
\renewcommand\Authfont{\sffamily\bfseries\small}
\renewcommand\Authands{\normalfont\sffamily\small}
\makeatletter
\renewcommand\AB@affilsepx{ -- \protect\Affilfont}
\makeatother


% --- Various convenient macros -----------------------------------------------
\RequirePackage[many]{tcolorbox}
\newtcbox{\iconbox}[1][]{%
  enhanced,nobeforeafter,tcbox raise base, 
  boxrule=0.4pt, top=0pt, bottom=-1pt,
  right=.1pt, left=.1pt, arc=1pt, boxsep=1pt,
  fontupper={\tiny \sffamily}, before upper={\vphantom{dlg}},
  colframe=white, colback=black!10!white, coltext=black}
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\iconbox{ID}}}
\newcommand{\doi}[1]{\href{http://doi.org/#1}{#1}}
\newcommand{\github}[1]{\href{https://github.com/#1}{github.com/#1}}

% See https://tex.stackexchange.com/questions/99316/symbol-for-external-links
\newcommand{\ExternalLink}{%
    \tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{% 
        \begin{scope}[x=1ex, y=1ex]
            \clip (-0.1,-0.1) 
                --++ (-0, 1.2) 
                --++ (0.6, 0) 
                --++ (0, -0.6) 
                --++ (0.6, 0) 
                --++ (0, -1);
            \path[draw, 
                line width = 0.5, 
                rounded corners=0.5] 
                (0,0) rectangle (1,1);
        \end{scope}
        \path[draw, line width = 0.5] (0.5, 0.5) 
            -- (1, 1);
        \path[draw, line width = 0.5] (0.6, 1) 
            -- (1, 1) -- (1, 0.6);
        }
    }


% --- Headers & footers -------------------------------------------------------
\input{\metadataFILE}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancypagestyle{plain}{}
\renewcommand{\headrulewidth}{0.0pt}
\lhead{
  \ifthenelse{\value{page}=1}{}
             {\scriptsize \sffamily \articleTITLE}
}
\chead{}
\rhead{\scriptsize \sffamily \bfseries
  \ifdefempty{\articleDOI}{
    % UNDER REVIEW
    \fbox{UNDER REVIEW}
    %\fcolorbox{lightgray}{lightgray}{\textcolor{white}{UNDER REVIEW}}
  }
}
\renewcommand{\footrulewidth}{0.0pt}
\lfoot{\scriptsize \sffamily
  \href{https://rescience.github.io/}{\bfseries \textcolor{black}{\journalNAME}}
    \ifdefempty{\journalVOLUME}{}{\journalVOLUME.\journalISSUE}
     -- \authorsSHORT~\articleYEAR}
\cfoot{}
\rfoot{\scriptsize \sffamily \thepage}


% --- Bibliography ------------------------------------------------------------
\RequirePackage[
  backend=biber,
  style = numeric,
  % style=authoryear,
  sorting = none,
  giveninits = true,
  maxcitenames=3,
  mincitenames=1,
  maxbibnames=10,
  isbn = false,
  url = false,
  doi = false,
  autocite = superscript,
  natbib = true]{biblatex}
\RequirePackage{bibentry}
\DeclareFieldFormat{labelnumberwidth}{#1\adddot}
\renewcommand*{\bibfont}{\small \sffamily}
\addbibresource{\articleBIBLIOGRAPHY}


% --- Copyright statement -----------------------------------------------------
\RequirePackage{float}
\floatstyle{plain}
\newfloat{statement}{b!}{sst}


% --- PDF Information ---------------------------------------------------------
\hypersetup{
  pdfauthor={\authorsFULL},
  pdftitle={\articleTITLE},
  pdfkeywords={\articleKEYWORDS},
  pdfsubject={\articleTYPE, \articleDOMAIN},
  pdfcreator={ReScience C (rescience.github.io)},
  %  pdfproducer={}
}


% --- Title -------------------------------------------------------------------
\title{
  {\normalfont \sffamily \normalsize \textcolor{darkred}
    {
      \ifdefempty{\articleDOMAIN}{
        \articleTYPE\\
      }{
        \articleTYPE~/~\articleDOMAIN\\
      }
    }
  }
  \vspace{-.25em} \RobotoCon \articleTITLE
}


%% ============================================================================
