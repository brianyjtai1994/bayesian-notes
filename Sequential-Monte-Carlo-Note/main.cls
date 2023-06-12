\NeedsTeXFormat{LaTeX2e} % sets the LATEX version for the class to work
\ProvidesClass{main}
\LoadClass[a4paper, 12pt]{article}
%%%% Required packages %%%%
\PassOptionsToPackage{dvipsnames}{xcolor}
\RequirePackage{geometry}
\RequirePackage{booktabs}
\RequirePackage{paracol}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{floatflt}
\RequirePackage{xcolor}
\RequirePackage[colorlinks]{hyperref}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[tt=false]{libertine}
\RequirePackage{siunitx}
\RequirePackage[version=4]{mhchem}
\RequirePackage[backend=biber, style=phys, biblabel=brackets, url=true]{biblatex}
%%%% Settings %%%%
\geometry{left=15mm,right=15mm,bindingoffset=0mm,top=15mm,bottom=15mm}
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}
\renewcommand{\baselinestretch}{1.0}
\numberwithin{equation}{section} % equation numbered within sections
\allowdisplaybreaks
\definecolor{text-blue}{HTML}{0076BA}
\definecolor{text-red}{HTML}{EE220C}
\definecolor{deepblue}{HTML}{03468F}
\hypersetup{allcolors=blue}
%
\sisetup{
    detect-weight=true,
    detect-family=true,
    text-series-to-math=true,
    text-family-to-math=true,
    per-mode=reciprocal,
    inter-unit-product=\ensuremath{{}\cdot{}},
    input-digits=0123456789\mitpi,
    print-unity-mantissa=false,
    separate-uncertainty=true,
    multi-part-units=single,
    range-units=single
}
% maketitle
\renewcommand{\maketitle}{
    \begin{center}
        \vspace*{-3ex}
        {\huge \textsc{\@title}}
        \vspace*{.5ex}\\
        \rule{\linewidth}{0.7pt}\\[.5ex]
        \hfill \@author, \@date
    \end{center}
}
%%%% Commands %%%%
\DeclareMathOperator{\erf}{erf}
\DeclareMathOperator{\erfc}{erfc}
\DeclarePairedDelimiterX\abs[1]{\vert}{\vert}{#1}
\DeclarePairedDelimiterX\bra[1]{\langle}{\vert}{#1\,}
\DeclarePairedDelimiterX\ket[1]{\vert}{\rangle}{\,\mathopen{}#1}
\newcommand{\braket}{\braket@i}
    \def\braket@i #1#2{\@ifnextchar\bgroup{\braket@j{#1}{#2}}{\braketI{#1}{#2}}}
    \def\braket@j #1#2#3{\braketII{#1}{#2}{#3}}
    \DeclarePairedDelimiterX\braketI[2]{\langle}{\rangle}%
        {#1\,\delimsize\vert\,\mathopen{}#2}
    \DeclarePairedDelimiterX\braketII[3]{\langle}{\rangle}%
        {#1\,\delimsize\vert\,\mathopen{}#2\,\delimsize\vert\,\mathopen{}#3}
\DeclarePairedDelimiterX\paren[1]{(}{)}{#1}
\DeclarePairedDelimiterX\bracket[1]{[}{]}{#1}
\DeclarePairedDelimiterX\pbrace[1]{\lbrace}{\rbrace}{#1}
%
\newcommand{\xbar}{\bar{x}}
\newcommand{\op}[1]{\hat{\mathcal{#1}}}
%
\newcommand{\sums}{\sums@i}
    \def\sums@i #1{\@ifnextchar\bgroup{\sums@ii{#1}}{\sum_{#1}}}
    \def\sums@ii #1#2{\sum_{#1}^{#2}}
%
\newcommand*{\tran}{{\mathpalette\tran@i{}}}
    \newcommand*{\tran@i}[2]{\raisebox{\depth}{$\m@th#1\intercal$}}
%
\renewcommand{\vec}{\vec@i}
    \def\@vec  #1{\boldsymbol{\lowercase{#1}}}
    \def\vec@i #1{\@ifnextchar\bgroup{\vec@j{#1}}{\@vec{#1}}}
    \def\vec@j #1#2{\@ifnextchar\bgroup{\vec@k{#1}{#2}}{\@vec{#1}_{#2}}}
    \def\vec@k #1#2#3{\@vec{#1}_{#2}^{#3}}
%
\newcommand{\tvec}{\tvec@i}
    \def\tvec@i #1{\@ifnextchar\bgroup{\tvec@j{#1}}{\@vec{#1}^{\tran}}}
    \def\tvec@j #1#2{\@ifnextchar\bgroup{\tvec@k{#1}{#2}}{\@vec{#1}_{#2}^{\tran}}}
    \def\tvec@k #1#2#3{\@vec{#1}_{#2}^{#3\tran}}
%
% \newcommand{\mat}{\@mat}
\newcommand{\mat}{\mat@i}
    \def\@mat  #1{\boldsymbol{\uppercase{#1}}}
    \def\mat@i #1{\@ifnextchar\bgroup{\mat@j{#1}}{\@mat{#1}}}
    \def\mat@j #1#2{\@ifnextchar\bgroup{\mat@k{#1}{#2}}{{\@mat{#1}_{#2}}}}
    \def\mat@k #1#2#3{{\@mat{#1}_{#2}^{#3}}}
%
\newcommand{\tmat}{\tmat@i}
    \def\tmat@i #1{\@ifnextchar\bgroup{\tmat@j{#1}}{\@mat{#1}^{\tran}}}
    \def\tmat@j #1#2{\@ifnextchar\bgroup{\tmat@k{#1}{#2}}{\@mat{#1}_{#2}^{\tran}}}
    \def\tmat@k #1#2#3{\@mat{#1}_{#2}^{#3\tran}}
%
\newcommand{\gradient}{\gradient@i}
    \def\gradient@i #1{\@ifnextchar\bgroup{\gradient@j{#1}}{\@vec{\nabla}#1}}
    \def\gradient@j #1#2{\@vec{\nabla}^{#1}#2}
%
\newcommand{\jacobian}[2]{\dfrac{\partial #1}{\partial #2}}
%
\newcommand{\hessian}{\hessian@i}
    \def\hessian@i #1#2{
        \@ifnextchar\bgroup{\hessian@j{#1}{#2}}{\dfrac{\partial^{2} #1}{\partial #2^{2}}}
    }
    \def\hessian@j #1#2#3{\dfrac{\partial^{2} #1}{\partial #2\partial #3}}
%
\newcommand{\prob}{\@ifnextchar[{\@prob}{\@prob[p]}}
    \def\@prob [#1]#2{{#1}\paren*{#2}}
\newcommand{\cprob}{\@ifnextchar[{\@cprob}{\@cprob[p]}}
    \def\@cprob [#1]#2#3{{#1}\left({#2}\left\vert\,{#3}\right)\right.}
\newcommand{\expval}{\@ifnextchar[{\expval@I}{\expval@J}}
    \def\expval@I [#1]#2{\@ifnextchar\bgroup{\expval@i[#1]{#2}}{\mathbb{E}\bracket[#1]{#2}}}
    \def\expval@i [#1]#2#3{\mathbb{E}_{#2}\bracket[#1]{#3}}
    \def\expval@J #1{\@ifnextchar\bgroup{\expval@j{#1}}{\mathbb{E}\bracket*{#1}}}
    \def\expval@j #1#2{\mathbb{E}_{#1}\bracket*{#2}}
\newcommand{\varval}{\@ifnextchar[{\varval@i}{\varval@j}}
    \def\varval@i [#1]#2{\operatorname{Var}_{#1}\bracket*{#2}}
    \def\varval@j #1{\operatorname{Var}\bracket*{#1}}
\newcommand{\covval}{\@ifnextchar[{\covval@i}{\covval@j}}
    \def\covval@i [#1]#2{\operatorname{Cov}_{#1}\bracket*{#2}}
    \def\covval@j #1{\operatorname{Cov}\bracket*{#1}}
