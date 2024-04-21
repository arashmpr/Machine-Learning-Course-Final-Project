\LoadClass{report}
\usepackage{enumitem}
\usepackage{subcaption}
\usepackage{amsmath}
\usepackage{mfirstuc}
\usepackage{graphicx}
\usepackage{geometry}
\usepackage{float}
\usepackage{booktabs}
\usepackage[explicit]{titlesec}
\usepackage[hidelinks]{hyperref}
\usepackage[nameinlink]{cleveref}
\usepackage{pgfplotstable}
\usepackage[per-mode=symbol]{siunitx}
\usepackage[toc,title]{appendix}
\usepackage{url}
\usepackage[section]{placeins}
\usepackage{nomencl}
\usepackage{tabularx}
\usepackage{hyperref}
\makenomenclature

\AtBeginDocument{\maketitle}
\bibliographystyle{unsrt}

\newcommand\abst[1]{\newcommand\zzabst{#1}}

\newcommand*{\project}[1]{\gdef\@project{#1}}
\newcommand*{\@project}{Graduation Project I}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\myabstract}[1]{\gdef\@myabstract{#1}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\@department}{Mechanical Engineering}

\makeatletter
\renewcommand*{\maketitle}{%
  \begin{titlepage}
  \newgeometry{left=3cm,right=3cm,bottom=2cm,top=3cm}
  {\centering\includegraphics[scale=0.13]{logo}\par}
  \vspace{1cm}
  \centering
  {\scshape\LARGE  University of Tehran \par}
  \vspace{1cm}
  {\scshape\Large\@project\unskip\strut\par}
  \vspace{1.5cm}
  {\huge\bfseries{\@title}\unskip\strut\par}
  \vspace{2cm}
  {\Large\xcapitalisewords{\@author}\unskip\strut\par}
  \vspace{2cm}
  {\Large\xcapitalisewords {\@department}\unskip\strut\par}
  \vspace{2cm}
  {\large \ Summer 2023\par}
  \end{titlepage}
  \newpage
\newgeometry{left=3cm,right=3cm,bottom=2cm,top=3cm}
\pagenumbering{roman}
%\begin{abstract}
%\zzabst
%\end{abstract}

\tableofcontents
%\listoffigures
%\listoftables
\printnomenclature
\newpage
\pagenumbering{arabic}
}
\makeatother

\usepackage{etoolbox}
\patchcmd{\abstract}{\null\vfil}{}{}{}

\renewcommand{\bibname}{\raggedright References}

\titleformat{\chapter}[display]{\bfseries\centering}{\huge \chaptertitlename\ \thechapter}{1em}{\Huge #1}
\renewcommand{\contentsname}{\raggedright Table of Contents}
\renewcommand{\listfigurename}{\raggedright List of Figures}
\renewcommand{\listtablename}{\raggedright List of Tables}

\pgfplotstableset{
    every head row/.style={
    before row=\toprule,after row=\midrule},
    every last row/.style={
    after row=\bottomrule},
    col sep = &,
    row sep=\\,
    string type,
}

\newcommand{\entries}{\pgfplotstabletypeset}

\newtoggle{appendixbib}
\pretocmd\appendix{\toggletrue{appendixbib}\bibliography{ref}}{}{}
\AtEndDocument{\iftoggle{appendixbib}{}{\bibliography{ref}}}

\let\origfigure\figure
\let\endorigfigure\endfigure

\renewenvironment{figure}[1][H]{%
	\origfigure[#1]%
	\centering
}{%
	\endorigfigure
}

\let\origtable\table
\let\endorigtable\endtable

\renewenvironment{table}[1][H]{%
	\origtable[#1]%
	\centering
}{%
	\endorigtable
}
