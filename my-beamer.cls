\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-beamer}[2025/06/29 Report template by Romain THOMAS]

\newcommand{\templatetype}{beamer}

\RequirePackage{xcolor}

\input{assets/template-colors}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\templatetype}}
\ProcessOptions\relax
\LoadClass[]{\templatetype}


\RequirePackage{tikz}

\input{assets/template-dimensions}

\RequirePackage[skins]{tcolorbox} %tikz overzoom for title picture
\RequirePackage{ragged2e} % justify the abstract text

\RequirePackage{pgfplots}

\usetikzlibrary{pgfplots.colorbrewer}
\usetikzlibrary{pgfplots.colormaps}

% Caching for tikz figures:
%\usetikzlibrary{external}
%\tikzexternalize[prefix=tikz-figures/] % activate and define figures/ as cache folder
% Warning: This will only run if your LaTeX is set up to run with shell escape (pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %.tex, see here for example)



\pgfplotsset{compat=1.18}
 
 % color map for tikz plot
\pgfplotsset{
    % initialize BuGn:
    cycle list/GnBu,
    % combine it with 'mark list*':
    cycle multiindex* list={
        mark list*\nextlist
        GnBu\nextlist
    },
} 


\DeclareRobustCommand\titlerightlogo[1]{\gdef\@titlerightlogo{#1}}
\titlerightlogo{assets/logo.eps}
\DeclareRobustCommand\titleleftlogo[1]{\gdef\@titleleftlogo{#1}}
\titleleftlogo{assets/logo.eps}

\setbeamercolor*{structure}{bg=white,fg=\maincolor}

\setbeamercolor*{palette primary}{use=structure,fg=structure.fg,bg=structure.bg}

\setbeamercolor{section in toc}{fg=black,bg=white}
\setbeamercolor{alerted text}{use=structure,fg=structure.fg!50!black!80!black}

\setbeamercolor{titlelike}{parent=palette primary,fg=structure.fg!50!black}
%\setbeamercolor{frametitle}{bg=gray!10!white,fg=\maincolor}
\setbeamercolor{frametitle}{fg=\maincolor}

\setbeamercolor*{titlelike}{parent=palette primary}

%\setbeamercolor{title page header}{bg=gray!10!white,fg=\maincolor}
\setbeamercolor{title page header}{fg=\maincolor}


% bullet points color
\setbeamertemplate{items}[square]
\setbeamertemplate{sections/subsections in toc}[square]

% remove navigation symbols
\setbeamertemplate{navigation symbols}{}


%%%%%%%%%%% footer %%%%%%%%%%%%%%%%%%%%%%%%%%
\defbeamertemplate*{footline}{mytheme}{
  \leavevmode
  \hbox{
    \begin{beamercolorbox}[wd=.15\paperwidth,ht=\beamerfooterheight,dp=1.125ex,leftskip=.3cm,rightskip=.3cm,right]{title in head/foot}
      \includegraphics[width=\beamerfooterlogowidth,height=\beamerfooterlogoheight,keepaspectratio]{\@titlerightlogo}\hspace*{2em}
    \end{beamercolorbox}
    \begin{beamercolorbox}[wd=.75\paperwidth,ht=\beamerfooterheight,dp=1.125ex,leftskip=.3cm,rightskip=.3cm]{title in head/foot}
      \centering
      \makebox
        {\insertshorttitle}
        {-}
        {\insertsection}
    \end{beamercolorbox}
    \begin{beamercolorbox}[wd=.1\paperwidth,ht=\beamerfooterheight,dp=1.125ex,leftskip=.3cm,rightskip=.3cm]{title in head/foot}
      \insertframenumber
    \end{beamercolorbox}
  }
  \vskip0pt
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%% header %%%%%%%%%%%%%%%%%%%%%%%%%%
%\setbeamertemplate{frametitle}
%{\vskip-3pt
%  \leavevmode
%  \hbox{%
%  \begin{beamercolorbox}[wd=\paperwidth,ht=1.8ex,dp=1ex]{frametitle}%
%    \raggedright\hspace*{2em}\small\insertframetitle
%  \end{beamercolorbox}
%  }%
%}

\defbeamertemplate*{headline}{myheader}
{
  \leavevmode
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west, inner sep=0,outer sep=0] at (current page.north west){\includegraphics[width=\paperwidth, page=2]{assets/backgrounds/beamer-backgrounds.pdf}};
  \end{tikzpicture}
  \vskip0pt%
}

\defbeamertemplate*{frametitle}{myheader}
{
  \leavevmode
  \hbox{
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west, inner sep=0,outer sep=0] at (current page.north west){\includegraphics[width=\paperwidth, page=2]{assets/backgrounds/beamer-backgrounds.pdf}};
%    \node[anchor=north west, inner sep=0,outer sep=0, text width=\textwidth] {\insertframetitle};
  \end{tikzpicture}
  
  \hspace*{-0.5em}\parbox{\textwidth}{\raggedright\insertframetitle}
  
  }
  \vskip0pt%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%% Title page %%%%%%%%%%%%%%%%%%
\defbeamertemplate*{title page}{texsx}[1][]
{
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west, inner sep=0,outer sep=0] at (current page.north west){\includegraphics[width=\paperwidth, page=1]{assets/backgrounds/beamer-backgrounds.pdf}};
  \end{tikzpicture}
  \begin{beamercolorbox}[colsep=0.4cm, center, #1]{title page header}
    \usebeamerfont{title}\inserttitle\par
    \ifx\beamer@shortsubtitle\@empty % if there is no subtitle
      %nothing
    \else
      \vskip0.3cm
      \usebeamerfont{subtitle}\insertsubtitle\par
    \fi
  \end{beamercolorbox}
  \vskip0.5cm
  \begin{beamercolorbox}[leftskip=0cm, rightskip=0cm, center, #1]{author}% wd=12cm
    \usebeamerfont{author}{\centering\begin{tabular}[t]{c}\insertauthor\end{tabular}\par}
  \end{beamercolorbox}
  \vskip0.5cm
  \begin{beamercolorbox}[leftskip=0cm, rightskip=0cm, center, #1]{date}
    \usebeamerfont{author}\insertdate
  \end{beamercolorbox}
  \vfill
  \begin{tikzpicture}[remember picture,overlay]
    \node[yshift=\beamertitlelogobotmargin, xshift=-\beamertitlelogorightmargin, anchor=south east] at (current page.south east)
    {
      \includegraphics[width=\beamertitlerightlogowidth]{\@titlerightlogo}
    };
    \node[yshift=\beamertitlelogobotmargin, xshift=\beamertitlelogoleftmargin, anchor=south west] at (current page.south west)
    {
      \includegraphics[width=\beamertitleleftlogowidth]{\@titleleftlogo}
    };
  \end{tikzpicture}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%