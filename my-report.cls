\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-report}[2024/06/30 Report template by Romain THOMAS]

\newcommand{\templatetype}{report}

\input{assets/template-base}

\setlength{\chapterpicturetitlespacing}{-\Gm@tmargin}
\addtolength{\chapterpicturetitlespacing}{\chapterpictureheight}
\addtolength{\chapterpicturetitlespacing}{\chapterpicturetextmargin}

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


\newlength{\chaptertitlexshift}
\setlength{\chaptertitlexshift}{\dimexpr1in + \oddsidemargin\relax}

\newlength{\chaptertitleyshift}
\setlength{\chaptertitleyshift}{\dimexpr -\chapterpictureheight * 2 / 3 + 15pt\relax}

\newcommand*\chapterlabel{}
\titleformat{\chapter}
  {
    \gdef\chapterlabel{}
    \Huge\bfseries
  }
  {\gdef\chapterlabel{\thechapter\ }}{0pt}
  {
      \begin{tikzpicture}[remember picture,overlay]
         % add background from PDF file
          \node[anchor=north west, inner sep=0,outer sep=0] at (current page.north west){\includegraphics[width=\paperwidth, page=2]{assets/backgrounds/report-backgrounds.pdf}};
%        \begin{axis}[
%%            colormap name=GnBu,
%%            xshift=-\the\dimexpr1in+\oddsidemargin\relax,
%            xshift=-0.4 \pagewidth,
%            yshift=3cm,
%            width=1.5*\pagewidth,
%            height=12cm,
%            plot box ratio=1 2 1,
%            view={3}{25},
%            % title=Shiffftttt,
%            axis line style={draw=none},
%            tick style={draw=none},
%            xticklabel=\empty,
%            yticklabel=\empty,
%            zticklabel=\empty
%         ] at (current page.north west)
%            \addplot3 [
%%                mesh,
%%                smooth,
%                contour lua={
%                    contour dir=y,
%%                    mesh,
%                    labels=false,
%                    number=15,
%                    handler/.style=smooth, 
%                }, 
%                draw=gray,
%%                samples y=8,
%                samples=20,
%%                patch type=line,
%                domain=-9:8, y domain=0:1
%            ] {-(1 - y)*2*exp(-(x - 1.5)^2) - (1 - y)*exp(-(x + 1.5)^2) + (1 - y)*0.02*(x)^2 - y*2.5*exp(-0.2*((x + 0.2)^2) + y*0.02*(x + 0.2)^2};
%        \end{axis}
	    % position at the top of the page and add a xshift equal to the margin width
	    \node [text width=\textwidth, anchor=south west]
        at ([xshift=\chaptertitlexshift, yshift=\chaptertitleyshift] current page.north west)
        {\chapterlabel #1};
      \end{tikzpicture}
  }

\titlespacing*{\chapter}{0pt}{\chapterpicturetitlespacing}{-32pt}




\DeclareRobustCommand\abstracttitle[1]{\gdef\@abstracttitle{#1}}
\abstracttitle{}
\DeclareRobustCommand\abstract[1]{\gdef\@abstract{#1}}
\abstract{}

%title page
\DeclareRobustCommand\titlebackgroundpicture[1]{\gdef\@titlebackgroundpicture{#1}}
\renewcommand*{\maketitle}{%
\begin{titlepage}
  \begin{tikzpicture}[remember picture,overlay]
  % position at the top of the page and add a xshift equal to the margin width
  \node[yshift=-\titleboxheight -\titleboxtopmargin, xshift=-\titleboxwidth] at (current page.north east)
    {
	    \begin{tikzpicture}[remember picture, overlay]
	    
	      % add background from PDF file
          \node[anchor=north west, inner sep=0,outer sep=0] at (current page.north west){\includegraphics[width=\paperwidth, page=1]{assets/backgrounds/report-backgrounds.pdf}};
%         \begin{axis}[
%              colormap name=GnBu,
%%              xshift=-\the\dimexpr1in+\oddsidemargin\relax,
%              xshift=-0.5\pagewidth,
%              yshift=-10cm,
%              width=2\pagewidth,
%              height=40cm,
%              plot box ratio=1 5 1,
%              view={3}{25},
%              % title=Shiffftttt,
%              axis line style={draw=none},
%              tick style={draw=none},
%              xticklabel=\empty,
%              yticklabel=\empty,
%              zticklabel=\empty
%           ] at (current page.north west)
%              \addplot3 [
%%                  mesh,
%%                  smooth,
%                  contour lua={
%                      contour dir=y,
%%                      mesh,
%                      labels=false,
%                      number=50,
%                      handler/.style=smooth, 
%                  }, 
%                  draw=gray,
%%                  samples y=8,
%                  samples=20,
%%                  patch type=line,
%                  domain=-10:10, y domain=0:1
%              ] {-(1 - y)*2*exp(-(x - 1.5)^2) - (1 - y)*exp(-(x + 1.5)^2) + (1 - y)*0.02*(x)^2 - y*2.5*exp(-0.2*((x + 0.2)^2) + y*0.02*(x + 0.2)^2};
%          \end{axis}


	    % position the title, subtitle and line
	    \node [anchor=west,xshift=\titlelefttextmargin, yshift=0, inner sep=0] at (0,\titletextposition)
	    {
	      \begin{tikzpicture}[remember picture,overlay]
	      \node [above right, yshift=15pt +3em, text width=\titletextwidth] (0,0) {\color{black}\Huge\setstretch{1.125}\raggedright\textbf{\@title} \\ {\LARGE \@subtitle} \par};
	      \node [above right, yshift=15pt, text width=\titletextwidth] (0,0) {\color{black}\Large\raggedright\@date};
	      \node [below right, yshift=-15pt, text width=\titletextwidth] (0,0) {\centering\color{black}\Large\setstretch{1.125}\begin{tabular}[t]{c}\@author\end{tabular}\par};
	      \end{tikzpicture}
	    };
      \end{tikzpicture}
    };
  \node[yshift=-\titleboxheight -\titleboxtopmargin -\titleabstracttitlemargin,
        xshift=-\titleboxwidth,
        anchor=north west,
        text width=\titleboxwidth - (\paperwidth - \titleboxwidth)] at (current page.north east)
    {
      \begin{center}
      \textbf{\Large\@abstracttitle}
      \end{center}
      \begin{justify}
      \large\@abstract
      \end{justify}
      \par
    };
  \node[yshift=\titlelogobotmargin, xshift=-\titlelogorightmargin, anchor=south east] at (current page.south east)
    {
      \includegraphics[width=\titlerightlogowidth]{\@titlerightlogo}
    };
   \node[yshift=\titlelogobotmargin, xshift=\titlelogoleftmargin, anchor=south west] at (current page.south west)
    {
      \includegraphics[width=\titleleftlogowidth]{\@titleleftlogo}
    };
  \end{tikzpicture}
\end{titlepage}
}
