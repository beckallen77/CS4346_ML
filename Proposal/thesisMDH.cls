\NeedsTeXFormat{LaTeX2e}
\newcommand{\classname}{thesisMDH}
\ProvidesClass{\classname}[2020/05/03 thesisMDH]
\LoadClass[a4paper, titlepage]{article}


\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{mathtools}
\RequirePackage{fancyhdr}
\RequirePackage{enumerate}
\RequirePackage{listings}
\RequirePackage[titletoc]{appendix}
\RequirePackage[margin=3cm]{geometry}
\RequirePackage[absolute]{textpos}
\RequirePackage[section]{placeins}
\RequirePackage{url}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{xcolor}


% Bibliography
\RequirePackage[style=ieee]{biblatex}
\RequirePackage{csquotes}


\RequirePackage{scrhack} % Loads packages fixes

\NewDocumentCommand{\thesisTitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\theTitleName{\huge{\textbf{\uppercase{#2}}}}%
}

\NewDocumentCommand{\authorOne}{m m}{
\newcommand{\authorOneName}{\Large{#1} \\ \parindent0pt\small{#2}}}

\NewDocumentCommand{\authorTwo}{m m}{
\newcommand{\authorTwoName}{\Large{#1} \\ \parindent0pt\small{#2}}}


\NewDocumentCommand{\subject}{m}{\newcommand{\subjectName}{\Large{#1}}}
\NewDocumentCommand{\university}{m}{\newcommand{\uniName}{\Large{#1}}}
\NewDocumentCommand{\department}{m}{\newcommand{\depName}{\Large{#1}}}

\NewDocumentCommand{\supervisors}{m m}{
\newcommand{\superName}{\large{Supervisor(s): #1} \\ \small{#2}}}

\NewDocumentCommand{\theDate}{m}{\newcommand{\datum}{\vspace*{\fill}\large #1}}

\newcommand{\warning}[1]{\centering{\textcolor{red}{\large{\textbf{\uppercase{#1\\}}}}}}
\newcommand{\alert}[1]{\textcolor{red}{\textit{\scriptsize\textbf{\uppercase{#1}}}}}
  
\newcommand{\titlePage}{
    \begin{titlepage}
        \begin{center}
            \IfFileExists{images/TXST.png}{
            \begin{flushleft}
            \begin{figure}[H]\includegraphics[width=3mm, bb=-30 0 100 100]{images/TXST.png}
    		\end{figure}
            \end{flushleft}
            }{
    		\begin{flushleft}
    		\warning{TXST \\ missing}
    		\end{flushleft}
    		}
    		
    		
            \ifdef{\uniName}{\vspace{-5mm}\uniName\\}{\warning{Missing university name}}
            
            \ifdef{\depName}{\depName\\}{\warning{Missing department name}} 
            
            \noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}} \\
            \vspace{5mm}
            
            \ifdef{\subjectName}{\subjectName}{\warning{Missing course name}} \\
            \vspace{20mm}
            
    		\ifdef{\theTitleName}{\theTitleName}{\warning{Missing title}} \\
    		\vspace{30mm}
    		
    		\ifdef{\authorOneName}{\authorOneName \\ \vspace{10mm}}{\warning{Missing authorOne}} 
    		
    		\ifdef{\authorTwoName}{\authorTwoName \\ \vspace{10mm}}{\warning{Missing authorTwo}}

            \vspace{35mm}
            \begin{flushleft}
                
                \ifdef{\superName}{\superName \\ \vspace{20mm}}{}
                
            \end{flushleft}
            \ifdef{\datum}{\datum}{\vspace*{\fill}\warning{Missing date}}
        \end{center}
    \end{titlepage}
}

% set the style for the section and subsection headers
\renewcommand{\thesection}{\thepart \arabic{section}.}
\renewcommand{\thesubsection}{\thepart \arabic{section}.\arabic{subsection}.}

\makeatletter

\newcommand\frontmatter{%
    \cleardoublepage
  %\@mainmatterfalse
  \pagenumbering{roman}}

\newcommand\mainmatter{%
    \cleardoublepage
 % \@mainmattertrue
  \pagenumbering{arabic}}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
 % \@mainmatterfalse
  }

\makeatother

\renewenvironment{abstract}{
  \begin{center}%
  \bfseries\abstractname\vspace{-.5em}\vspace{0pt}
  \end{center}
  \itshape
}

% Code style
\lstset{
    backgroundcolor=\color[rgb]{0.92,0.92,0.92},
	basicstyle=\footnotesize,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2,
	captionpos=b,
	breaklines=false,
	keywordstyle=\color[rgb]{0,0,1},
	commentstyle=\color[rgb]{0.133,0.545,0.133}
}

% Page style
\pagestyle{fancy}
\marginparsep = 0pt

\newcommand{\fancyHeader}[2]{
\thispagestyle{fancy}
\fancyhead[R]{#1}
\fancyhead[L]{#2}
% \fancyfoot[L]{}
%\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
}

\endinput