\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LMUhomework}[2017/12/23 LMU homework template]

\LoadClass[a4paper, 10pt, onecolumn, unknownkeysallowed]{article}

\RequirePackage[left=0.65in, right=0.65in, head=80pt, foot=20pt, bottom=1.0in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage[off]{svg-extract}
\svgsetup{clean=true}
\RequirePackage{lmodern}
\RequirePackage{kpfonts}
\RequirePackage{color}
\RequirePackage{hyperref}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{mdframed}
\RequirePackage{adjustbox}
\RequirePackage{xifthen}


\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\lecture}[1]{\def\@lecture{#1}}
\newcommand{\semester}[1]{\def\@semester{#1}}
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\group}[1]{\def\@group{#1}}
\newcommand{\headtitle}[1]{\def\@headtitle{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}

\renewcommand{\maketitle}{
    \begin{center}
        {\LARGE\textbf{\@title}}\\
    \end{center}
}

\newcommand{\makelayout}{
    \numberwithin{equation}{section}
    \numberwithin{figure}{section}
    \numberwithin{table}{section}

    \pagestyle{fancy}
    \setlength{\headheight}{90pt}
    \fancyhf{}
    \lhead{}
    \chead{
        \centerline{
            \colorbox{white}{
                \makebox(600,120){
                    \hspace{1mm}
                    \begin{minipage}{55.5mm}
                        \includesvg[width=54mm]{img/lmu-logo}
                    \end{minipage}
                    \begin{minipage}{79mm}
                        \setlength{\fboxrule}{0.7pt}
                        \fbox{
                            \parbox[l][22.1mm][b]{73mm}{
                                \ifthenelse{\isundefined{\@faculty}}{}{\@faculty\phantom{g}}
                                \ifthenelse{\isundefined{\@lecture}}{}{\\\textbf{\@lecture}\phantom{g}}
                                \ifthenelse{\isundefined{\@semester}}{}{\\\@semester\phantom{g}}
                                \ifthenelse{\isundefined{\@name}}{}{%
                                    \\\@name%
                                    \ifthenelse{\isundefined{\@group}}{\phantom{g}}{, }%                        
                                }%
                                \ifthenelse{\isundefined{\@group}}{}{\@group\phantom{g}}
                                \ifthenelse{\isundefined{\@headtitle}}{}{\\\textbf{\@headtitle}\phantom{g}}
                            }
                        }
                    \end{minipage}
                    \begin{minipage}{45mm}
                        \setlength{\fboxrule}{0.7pt}
                        \fbox{
                            \parbox[c][23mm][c]{40mm}{
                                \adjustbox{trim={-1.42cm} {2.1mm} {3mm} {2.1mm},clip}{
                                    \includesvg[width=2.9cm]{img/lmu-seal}
                                }
                            }
                        }
                    \end{minipage}
                }
            }
        }
        \vspace{-1.8cm}
    }
    \rhead{}
    \lfoot{}
    \cfoot{\thepage/\pageref*{LastPage}}
    \rfoot{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.4pt}
}

\newcommand{\exercise}[1]{
    \section*{#1}
    \addtocounter{section}{1}
    \setcounter{equation}{0}
}

\newcommand{\subtask}[1]{
    \subsection*{#1}
}
