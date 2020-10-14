%-------------------------------------------------------------------------------
%-- Latex2e Package
%-------------------------------------------------------------------------------
%-- pkg_name:    application
%-- author:      Marcel Arpogaus
%-- date:        05.04.2017
%-------------------------------------------------------------------------------
%-- modern application style inspired by awesome-cv:
%-- https://github.com/posquit0/Awesome-CV
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%   CLASS DEFINITION
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{application}


%-------------------------------------------------------------------------------
%   CLASS OPTIONS
%-------------------------------------------------------------------------------
%-- define key-value-pairs -----------------------------------------------------
\RequirePackage{pgfopts} % to process pgfkeys as packages options
\newif\ifapplication@referencesToToc
\newif\ifapplication@header
\pgfkeys{%
  /application/.cd, % working path for keys
  highlight_color/.store in      = {\application@highlightColor},
  light_color/.store in          = {\application@lightColor},
  default_color/.store in        = {\application@defaultColor},
  style/.store in                = {\application@Style},
  tag_style/.store in            = {\application@skillTagStyle},
  cventry_parsep/.store in       = {\cvEntry@ParSep},
  cventry_sep/.store in          = {\cvEntry@Sep},
  portrait_ratio/.store in       = {\application@portraitRatio},
  portrait_shape/.is choice,
  portrait_shape/circle/.code    = {\def\portrait@Shape{circle}},
  portrait_shape/rectangle/.code = {\def\portrait@Shape{}},
  marginparwidth/.store in       = {\application@marginParWidth},
  references_to_toc/.is if       = {application@referencesToToc},
  header/.is if                  = {application@header},
  highlight_color                = 107896,
  light_color                    = 677073,
  default_color                  = 001E26,
  tag_style                      = skilltag_border,
  cventry_parsep                 = 0.3ex,
  cventry_sep                    = 0pt,
  portrait_shape                 = circle,
  marginparwidth                 = 4.5cm,
  portrait_ratio                 = 0.9,
  header                         = true,
  % filter handler to append any unprocessed options to a macro
  /pgf/key filter handlers/append filtered to/.install key filter handler=\remainingoptions
}
\def\remainingoptions{}

%-- Parsing |key=value| input, given as class option ---------------------------
\ProcessPgfOptions{/application}


%-------------------------------------------------------------------------------
%   BASE CLASS
%-------------------------------------------------------------------------------
\PassOptionsToClass{\remainingoptions}{report}
\LoadClass{report}


%-------------------------------------------------------------------------------
%   REQUIRED PACKAGES
%-------------------------------------------------------------------------------
%-- font encoding --------------------------------------------------------------
\RequirePackage{fontspec}  % advanced font management

%-- load fonts -----------------------------------------------------------------
\RequirePackage[default,opentype]{sourcesanspro}

%-- additional packages --------------------------------------------------------
\RequirePackage{babel} % (multi)language support
\RequirePackage{calc} % advanced calculations with spaces
\RequirePackage{enumitem} % advanced list environment
\RequirePackage{fancyhdr} % manage header & footer
\RequirePackage[fixed]{fontawesome5} % icons
\RequirePackage{ifthen} % advance conditionals
\RequirePackage{lastpage} % get last page number
\RequirePackage{parskip} % no indentions
\RequirePackage{progressbar} % skill bars
\RequirePackage{suffix} % defined starred version of command
\RequirePackage[skins]{tcolorbox} % fill overzoom image
\RequirePackage{tikz} % graphics language
\RequirePackage{titlesec} % Allows customization of titles
\RequirePackage[titles]{tocloft} % customization of table of contents
\RequirePackage{translations} % easy translations for strings
\RequirePackage{xcolor} % manage colors

%-- configure page layout ------------------------------------------------------
\RequirePackage{geometry}

%-- hyperlinks -----------------------------------------------------------------
\RequirePackage[hidelinks,unicode]{hyperref}


%-------------------------------------------------------------------------------
%   MARGINS AND PAGE LAYOUT
%-------------------------------------------------------------------------------
\reversemarginpar % put margin notes to the left
\geometry{%
  twoside=false,%
  left=.5cm,%
  right=1.5cm,%
  top=.5cm,%
  bottom=0.7cm,%
  marginpar=\application@marginParWidth,%
  marginparsep=0.5cm,%
  includemp,%
}
\ifapplication@header%
  \geometry{%
    top=.5cm,%
    headsep=1cm,%
    includeheadfoot%
  }
\else%
  \geometry{%
    top=1.4cm,%
    includefoot%
  }
\fi%

%-------------------------------------------------------------------------------
%   COLORS AND LENGTHS
%-------------------------------------------------------------------------------
%-- colors ---------------------------------------------------------------------
\definecolor{highlight_color}{HTML}{\application@highlightColor}
\definecolor{light_color}{HTML}{\application@lightColor}
\definecolor{default_color}{HTML}{\application@defaultColor}
\colorlet{skill_tag_color}{light_color}
\colorlet{skill_bar_color}{light_color!80}
\color{default_color}

%-- lengths --------------------------------------------------------------------
\newlength{\iconSep}
\setlength{\iconSep}{1ex}
\newlength{\portrait@width}
\setlength{\portrait@width}{\application@portraitRatio\marginparwidth}
\newlength{\sideBarWidth}
\setlength{\sideBarWidth}{\marginparwidth + \leftmargin}


%-------------------------------------------------------------------------------
%   STYLES
%-------------------------------------------------------------------------------
%-- titlepage ------------------------------------------------------------------
\newcommand{\cvTitlepageFirstNameStyle}[1]{#1}
\newcommand{\cvTitlepageLastNameStyle}[1]{#1}
\newcommand{\cvTitlepageTitleStyle}[1]{#1}
\newcommand{\cvTitlepagePosition}[1]{#1}
\newcommand{\cvTitlepageSubtitleStyle}[1]{#1}

%-- title styles ---------------------------------------------------------------
\newcommand{\chapterStyle}[1]{#1}
\newcommand{\sectionStyle}[1]{#1}
\newcommand{\subsectionStyle}[1]{#1}
\newcommand{\sectionRule}{\titlerule[1pt]\\[\cvEntry@Sep]}

%-- toc styles -----------------------------------------------------------------
\newcommand{\TocChaperStyle}{}
\newcommand{\TocChaperPageStyle}{}
\newcommand{\TocSectionStyle}{}
\newcommand{\TocSectionPageStyle}{}

%-- fancy header / footer ------------------------------------------------------
\newcommand{\fancyHeadNameStyle}[2]{#1~#2}
\newcommand{\fancyFootNameStyle}[2]{#1~#2}
\newcommand{\fancyHeadContactTextStyle}[1]{#1}
\newcommand{\fancyHeadContactIconStyle}[1]{#1}
\newcommand{\fancyHeadContactSepStyle}[1]{#1}
\newcommand{\fancyFootLeftStyle}[1]{#1}
\newcommand{\fancyFootSocialTextStyle}[1]{#1}
\newcommand{\fancyFootSocialIconStyle}[1]{#1}
\newcommand{\fancyFootSocialSepStyle}[1]{#1}
\newcommand{\fancyFootPageStyle}[2]{#1/#2}

%-- header ---------------------------------------------------------------------
\newcommand{\headerFirstNameStyle}[1]{#1}
\newcommand{\headerLastNameStyle}[1]{#1}
\newcommand{\headerPosition}[1]{#1}

%-- cv entry elements ----------------------------------------------------------
\newcommand{\cvEntryPositionStyle}[1]{#1}
\newcommand{\cvEntryInstitutionStyle}[1]{#1}
\newcommand{\cvEntryDateStyle}[1]{#1}
\newcommand{\cvEntryLocationStyle}[1]{#1}
\newcommand{\cvEntryMarginNoteStyle}[1]{#1}
\newcommand{\cvEntryDescriptionStyle}[1]{#1}
\newcommand{\cvEntryShortDescriptionStyle}[1]{#1}

%-- reference elements ---------------------------------------------------------
\newcommand{\referencePositionStyle}[1]{#1}
\newcommand{\referenceInstitutionStyle}[1]{#1}
\newcommand{\referenceDateStyle}[1]{#1}
\newcommand{\referenceLocationStyle}[1]{#1}
\newcommand{\referenceDescriptionStyle}[1]{#1}

%-- other ----------------------------------------------------------------------
\newcommand{\skillTagTextStyle}{}
\newcommand{\faIconStyle}[2][regular]{\small\faIcon[#1]{#2}}


%-------------------------------------------------------------------------------
%   TITLE PAGE
%-------------------------------------------------------------------------------
\newcommand{\subtitle}[1]{%
  \def\@subtitle{#1}
}

\DeclareTranslationFallback{contact}{Contact}
\DeclareTranslation{German}{contact}{Kontakt}
\DeclareTranslation{English}{contact}{Contact}
\DeclareTranslation{Spanish}{contact}{Contacto}

\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \begin{titlepage}
    \begin{tikzpicture}[remember picture, overlay]
      \node[
        minimum width  = \sideBarWidth,
        minimum height = \paperheight,
        anchor         = south west,
        fill           = highlight_color
      ] (side bar) at (current page.south west) {};
      \ifdefined\application@portrait%
        \node[
          title portrait with shadow,
          xshift=0.75\sideBarWidth,
          yshift=-0.75\sideBarWidth
        ] (portrait) at (current page.north west) {};%
      \fi
      \node[%
        below      = 1.5\sideBarWidth of side bar.north,
        anchor     = north,
        align      = right,
        inner sep  = 0pt,
        text width = \sideBarWidth-\marginparsep,
        font       = \color{white}
      ] (name) {
        \cvTitlepageFirstNameStyle{\application@firstName}\\
        \cvTitlepageLastNameStyle{\application@lastName}
      };
      \node[%
        above      = 0.25\sideBarWidth of side bar.south,
        anchor     = south,
        align      = right,
        inner sep  = 0pt,
        text width = \sideBarWidth-\marginparsep,
        font       = \color{white}
      ] (contact) {%
        \begin{minipage}{\marginparwidth}
          \sectionStyle{\GetTranslation{contact}}\par\bigskip
          \ifdefined\application@contact%
            \rightBoxedContactInfo
          \fi
        \end{minipage}
      };
      \node[%
        right     = \marginparsep of name,
        anchor    = west,
        align     = left,
        inner sep = 0pt,
        font      = \color{highlight_color}
      ] (title) {
        \cvTitlepageTitleStyle{\@title}
      };
      \ifdefined\application@position
        \node[%
          below      = 1.5ex,
          anchor     = north east,
          align      = right,
          inner sep  = 0pt,
          text width = \sideBarWidth-\marginparsep,
          font       = \color{white}
        ] (position) at (name.east |- title.south west){
          \ifdefined\application@positionShort
            \cvTitlepagePosition{\application@positionShort}
          \else
            \cvTitlepagePosition{\application@position}
          \fi
        };
      \fi
      \ifdefined\@subtitle
        \node[%
          below     = 1.5ex of title.south west,
          anchor    = north west,
          align     = left,
          inner sep = 0pt,
          font      = \color{highlight_color}
        ] (subtitle) {
          \cvTitlepageSubtitleStyle{\@subtitle}
        };
      \fi
    \end{tikzpicture}
  \end{titlepage}
}

%-------------------------------------------------------------------------------
%   TITLES FORMAT AND SPACING
%-------------------------------------------------------------------------------
%-- chapter --------------------------------------------------------------------
%\titleformat
\gdef\chapterlabel{}
\titleformat
{% command
  \chapter%
}
[% shape
  hang%
]
{% format
}
{% label
  \gdef\chapterlabel{\thechapter}
}
{% sep
  0pt
}
{% before-code
  \thispagestyle{chapter}
  \chapterStyle
}
[% after-code
  \ifnum\thechapter>0
    \clearpage%
  \else
  \fi
]

%-- section --------------------------------------------------------------------
\titleformat
{% command
  \section%
}
[% shape
  margin%
]
{% format
}
{% label
}
{% sep
  0pt
}
{% before-code
  \sectionStyle%
}
[% after-code
  \sectionRule%
]

%-- subsection -----------------------------------------------------------------
\titleformat
{% command
  \subsection%
}
[% shape
  margin%
]
{% format
}
{% label
}
{% sep
  0pt%
}
{% before-code
  \subsectionStyle%
}

%-- spacing --------------------------------------------------------------------
%titlespacing{〈command〉}{〈left〉}{〈before-sep〉}{〈after-sep〉}[〈right-sep〉]
\titlespacing{\chapter}{0pt}{1em plus 0.5em minus 0.5em}{0pt}
\titlespacing{\section}{\marginparwidth}{1.5em plus 0.5em minus 0.5em}{\marginparsep}
\titlespacing{\subsection}{\marginparwidth}{0pt}{\marginparsep}


%-------------------------------------------------------------------------------
%  TOC
%-------------------------------------------------------------------------------
\setcounter{tocdepth}{1}
\cftsetindents{chapter}{2em}{1.5em}
\renewcommand{\cftchapfont}{\TocChaperStyle}
\renewcommand{\cftchapnumwidth}{2em}
\renewcommand{\cftchappagefont}{\TocChaperPageStyle}
\renewcommand{\cftchapafterpnum}{\par\bigskip}

\cftsetindents{section}{4em}{1.5em}
\renewcommand{\cftsecfont}{\TocSectionStyle}
\renewcommand{\cftsecpagefont}{\TocSectionPageStyle}
\renewcommand{\cftsecafterpnum}{\par\smallskip}
\renewcommand{\cftsecdotsep}{\cftnodots}

%-------------------------------------------------------------------------------
%   HEADER AND FOOTER
%-------------------------------------------------------------------------------
\fancypagestyle{default}{%
  \fancyhf{} % alle Kopf- und Fußzeilenfelder bereinigen
  \ifapplication@header%
    \fancyhead[L]{%
      \begin{minipage}[b]{\marginparwidth}%
        \raggedleft%
        \fancyHeadNameStyle{\application@firstName}{\application@lastName}
      \end{minipage} %
      \ifdefined\application@contact%
        \hspace{0.5\marginparsep}%
        \socialIcons[%
          text style=\fancyHeadContactTextStyle,
          icon style=\fancyHeadContactIconStyle,
          sep style=\fancyHeadContactSepStyle
        ]{%
          \application@contact%
        }
      \fi%
    }
  \fi

  \fancyfoot[L]{%
    \begin{minipage}[b]{\marginparwidth}%
      \raggedleft%
      \fancyFootLeftStyle{\leftmark}
    \end{minipage}
    \hspace{0.5\marginparsep}%
    \ifdefined\application@social
      \socialIcons[%
        text style=\fancyFootSocialTextStyle,
        icon style=\fancyFootSocialIconStyle,
        sep style=\fancyFootSocialSepStyle
      ]{%
        \application@social%
      }
    \fi
  }

  \fancyfoot[R]{%
    \fancyFootPageStyle{\thepage}{\pageref*{LastPage}}%
  }
}
\fancypagestyle{chapter}{%
  \fancyhf{} % alle Kopf- und Fußzeilenfelder bereinigen

  \fancyfoot[R]{%
    \fancyFootPageStyle{\thepage}{\pageref*{LastPage}}%
  }
}
\fancypagestyle{nohead}{%
  \fancyhf{} % alle Kopf- und Fußzeilenfelder bereinigen
  \fancyfoot[L]{%
    \begin{minipage}[b]{\marginparwidth}%
      \raggedleft%
      \fancyFootLeftStyle{\leftmark}
    \end{minipage}
    \hspace{0.5\marginparsep}%
    \ifdefined\application@social
      \socialIcons[%
        text style=\fancyFootSocialTextStyle,
        icon style=\fancyFootSocialIconStyle,
        sep style=\fancyFootSocialSepStyle
      ]{%
        \application@social%
      }
    \fi
  }

  \fancyfoot[R]{%
    \fancyFootPageStyle{\thepage}{\pageref*{LastPage}}%
  }
}

\renewcommand{\headrule}{} % obere Trennlinie entfernen
\fancyhfoffset[L]{\marginparwidth + \marginparsep}
\pagestyle{default} % default to fancy page styles
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}


%-------------------------------------------------------------------------------
%   TIKZ STYLES AND LIBRARIES
%-------------------------------------------------------------------------------
%-- tikz libraries -------------------------------------------------------------
\usetikzlibrary{shadows.blur}
\usetikzlibrary{positioning}

%-- tikz styles ----------------------------------------------------------------
\tikzset{
  skilltag_filled/.style = {
    text=white,%
    fill=skill_tag_color
  },
  skilltag_border/.style = {
    text=skill_tag_color,%
    draw=skill_tag_color,%
    line width=.6pt
  },
  cv portrait/.style={
    \portrait@Shape,
    minimum width=\portrait@width,
    minimum height=\portrait@width,
    draw=light_color,%
    fill=white,%
    line width=0.5pt,%
    fill overzoom image*={\portrait@options}{\application@portrait}
  },
  cv portrait with shadow/.style={
    cv portrait,
    blur shadow={%
      shadow scale=1.03,
      shadow xshift=0pt,
      shadow yshift=0pt,
      opacity=.25,
      fill=lightgray,
      shadow blur steps=5
    }
  },
  title portrait/.style={
    \portrait@Shape,
    minimum width=\sideBarWidth,
    minimum height=\sideBarWidth,
    draw=light_color,%
    fill=white,%
    line width=0.5pt,%
    fill overzoom image*={\portrait@options}{\application@portrait}
  },
  title portrait with shadow/.style={
    title portrait,
    blur shadow={%
      shadow scale=1.03,
      shadow xshift=0pt,
      shadow yshift=0pt,
      opacity=.25,
      fill=lightgray,
      shadow blur steps=5
    }
  },
  reference file/.style={
    draw,
    overlay,
    anchor=north west,
    align=center,
    fill=white,
    inner sep=0
  }
}


%-------------------------------------------------------------------------------
%   MAKRO DEFINITIONS
%-------------------------------------------------------------------------------
%-- personal information -------------------------------------------------------
\newcommand{\name}[2]{\def\application@firstName{#1}\def\application@lastName{#2}}
\newcommand{\position}[2][]{%
  \isEmpty{#1}{}{%
    \def\application@positionShort{#1}
  }
  \def\application@position{#2}}
\newcommand{\contact}[1]{\def\application@contact{#1}}
\newcommand{\social}[1]{\def\application@social{#1}}
\newcommand{\portrait}[2][]{%
  \def\portrait@options{#1}
  \def\application@portrait{#2}
}

%-- utility commands------------------------------------------------------------
\newcommand{\centpipe}{\texttt{\raisebox{0em}{|}}}
\newcommand{\centplus}{\texttt{\raisebox{0.0em}{+}}}
\newcommand{\centminus}{\texttt{\raisebox{0.0em}{-}}}

\newcommand{\isEmpty}[3]{%
  \def\temp{#1}\ifx\temp\empty
    #2
  \else
    #3
  \fi
}

% Fix to preserve the same parskip in minipage
% ref.: https://tex.stackexchange.com/questions/43002/how-to-preserve-the-same-parskip-in-minipage
\newlength{\oldparskip}
\setlength{\oldparskip}{\parskip}
\newcommand{\@minipagerestore}{\setlength{\parskip}{\oldparskip}}
\newcommand{\marginParagraph}[3][t]{%
  \parbox[#1]{\textwidth}{#3}%
  \marginpar{%
    \parbox[#1]{\marginparwidth}{#2}%
  }%
}

\pgfkeys{%
  /two columns/.is family,
  /two columns/.cd,
  % define keys
  left width/.store in=\twoColumns@leftWidth,
  right width/.store in=\twoColumns@rightWidth,
  ratio/.store in=\twoColumns@ratio,
  align/.store in=\twoColumns@align
  % set default values
}
\newcommand{\twoColumns}[3][]{%
  \pgfkeys{%
    /two columns,%
    ratio=0.5,%
    align=t,%
    left width=\twoColumns@ratio\textwidth,
    right width=\textwidth-\twoColumns@leftWidth,
    #1
  }
  {%
    \begin{minipage}[\twoColumns@align]{\twoColumns@leftWidth - 2mm}%
      #2%
    \end{minipage}%
    \hfill%
    \begin{minipage}[\twoColumns@align]{\twoColumns@rightWidth - 2mm}%
      #3%
    \end{minipage}%
  }%
}

\newcommand{\rightBoxed}[3][\textwidth]{%
  \begin{minipage}[c]{#1}%
    \parbox[t]{#1 - 6mm - \iconSep}{%
      \raggedleft%
      #2%
    }%
    \hfill%
    \parbox[t]{6mm}{%
      \centering%
      #3%
    }%
  \end{minipage}%
}
\newcommand{\leftBoxed}[3][\textwidth]{%
  \begin{minipage}[c]{#1}%
    \parbox[t]{6mm}{%
      \centering%
      #2%
    }%
    \hfill%
    \parbox[t]{#1 - 6mm - \iconSep}{%
      #3%
    }%
  \end{minipage}%
}
\newcommand{\subsectionWithIcon}[2]{
  \subsection{\rightBoxed[\marginparwidth]{#1}{\faIconStyle{#2}}}
}

%-- print contact information --------------------------------------------------
\newcommand{\rightBoxedContactInfo}[1][]{%
  \rightBoxedIcons[#1]{%
    \application@contact%
  }%
}
\newcommand{\rightleftBoxedContactInfo}[1][]{%
  \leftBoxedIcons[#1]{%
    \application@contact%
  }%
}

%-- print social information ---------------------------------------------------
\newcommand{\rightBoxedSocialIcons}[1][]{%
  \rightBoxedIcons[#1]{%
    \application@social%
  }%
}
\newcommand{\rightleftBoxedSocialIcons}[1][]{%
  \leftBoxedIcons[#1]{%
    \application@social%
  }%
}


%-- fontawesome icons ----------------------------------------------------------
\pgfkeys{%
  /social icon/.is family,
  /social icon/.cd,
  % define keys
  text style/.store in=\socialIcon@textStyle,%
  icon style/.store in=\socialIcon@iconStyle,%
}
\newcommand{\socialIcon}[3][]{%
  \pgfkeys{%
    /social icon,%
    text style={#1},%
    icon style={#1},%
    #1%
  }%
  {%
    \socialIcon@iconStyle{\faIconStyle{#2}}%
    \hspace{\iconSep}%
    \socialIcon@textStyle{#3}%
  }%
}
\pgfkeys{%
  /social icons/.is family,
  /social icons/.cd,
  % define keys
  text style/.store in=\socialIcons@textStyle,%
  icon style/.store in=\socialIcons@iconStyle,%
  sep style/.store in=\socialIcons@sepStyle,%
  sep/.store in=\socialIcons@sep%
  % set default values
}

\newcommand{\socialIcons}[2][]{%
  \pgfkeys{%
    /social icons,%
    text style={},%
    icon style={},%
    sep style={},
    sep=\centpipe,
    #1%
  }%
  \foreach \i / \s / \h [count=\c] in #2{%
    \ifnum \c > 1%
      \hspace{1.5\iconSep}\socialIcons@sepStyle{\socialIcons@sep}\hspace{1.5\iconSep}%
    \fi%
    \ifx\s\h%
      \socialIcon[%
        text style = \socialIcons@textStyle,
        icon style = \socialIcons@iconStyle
      ]{\i}{\s}
    \else%
      \href{\h}{%
        \socialIcon[%
          text style = \socialIcons@textStyle,
          icon style = \socialIcons@iconStyle
        ]{\i}{\s}
      }%
    \fi%
  }%
}

\pgfkeys{%
  /boxed icons/.is family,
  /boxed icons/.cd,
  % define keys
  width/.store in=\boxedIcons@width,%
  text style/.store in=\boxedIcons@textStyle,%
  icon style/.store in=\boxedIcons@iconStyle%
}
\newcommand{\rightBoxedIcons}[2][]{%
  \pgfkeys{%
    /boxed icons,%
    width=\textwidth,%
    text style={},%
    icon style={},%
    #1%
  }%
  \foreach [count=\c] \i / \d / \h in #2{%
    \ifnum\c>1
      \\
    \fi
    \ifx\d\h%
      \rightBoxed[\boxedIcons@width]%
        {\boxedIcons@textStyle{\d}}%
        {\boxedIcons@iconStyle{\faIconStyle{\i}}}%
    \else%
      \href{\h}{%
        \rightBoxed[\boxedIcons@width]%
          {\boxedIcons@textStyle{\d}}%
          {\boxedIcons@iconStyle{\faIconStyle{\i}}}%
      }%
    \fi%
  }
}
\newcommand{\leftBoxedIcons}[2][]{%
  \pgfkeys{%
    /boxed icons,%
    width=\textwidth,%
    text style={},%
    icon style={},%
    #1%
  }%
  \foreach [count=\c] \i / \d / \h in #2{%
    \ifnum\c>1
      \\
    \fi
    \ifx\d\h%
      \leftBoxed[\boxedIcons@width]%
        {\boxedIcons@iconStyle{\faIconStyle{\i}}}%
        {\boxedIcons@textStyle{\d}}%
    \else%
      \href{\h}{%
        \leftBoxed[\boxedIcons@width]%
          {\boxedIcons@iconStyle{\faIconStyle{\i}}}%
          {\boxedIcons@textStyle{\d}}%
      }%
    \fi%
  }
}

%-- cv elements ----------------------------------------------------------------
\newcommand{\header}[1][0.6]{%
  \thispagestyle{nohead}
  \vspace*{-\headsep}
  \marginParagraph{%
    \raggedleft%
    \ifdefined\application@portrait%
      \begin{tikzpicture}%
        \node[
          cv portrait with shadow,
          overlay,
          anchor=east,
          baseline=-\headsep
        ]{};%
      \end{tikzpicture}
    \fi
  }{%
    \begin{minipage}[c][\portrait@width]{\textwidth}%
      \twoColumns[align=c,ratio=#1]{%
        \hspace{-0.5mm}%
        \headerFirstNameStyle{\application@firstName}\quad\headerLastNameStyle{\application@lastName}%
        \ifdefined\application@position%
          \\[0.5\parsep]%
          \headerPosition{\application@position}%
        \fi
      }
      {%
        \ifdefined\application@contact%
          \textcolor{light_color}{%
            \leftBoxedIcons{%
              \application@contact%
            }%
          }%
        \fi
      }%
    \end{minipage}
  }
  \bigskip\\
}
\WithSuffix\newcommand\header*{%
  \thispagestyle{nohead}
  \vspace*{-\headsep}
  \marginParagraph{%
    \raggedleft%
    \ifdefined\application@portrait%
      \begin{tikzpicture}%
        \node[
          cv portrait with shadow,
          overlay,
          anchor=east,
          baseline=-\headsep
        ]{};%
      \end{tikzpicture}
    \fi
  }{%
    \begin{minipage}[c][\portrait@width]{\textwidth}%
      \hspace{-0.5mm}%
      \headerFirstNameStyle{\application@firstName}\quad\headerLastNameStyle{\application@lastName}%
      \ifdefined\application@position%
        \\[0.5\parsep]%
        \headerPosition{\application@position}%
      \fi
    \end{minipage}
  }
  \bigskip\\
}

\newcommand{\skillTag}[1]{%
    \tikz[baseline]%
    \node[rounded corners=1pt,%
          inner sep=2pt,%
          anchor=base,
          minimum height=1.2em,%
          \application@skillTagStyle,
          font=\skillTagTextStyle]{\vphantom{ABCEDEFGHIJKLMNOPQRSTUVWXYZabcedefghijklmnopqrstuvwxyz}#1};%
}

\newcommand{\skillTags}[1]{%
  \foreach \t in {#1}{%
    \skillTag{\t}\,%
  }%
}

%-- cv entry -------------------------------------------------------------------
\newcommand{\reference}[8]{%
  % Desc: Typeset a refference file
  % Useage: \reference{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}
  % #1 -> position
  % #2 -> institition
  % #3 -> date
  % #4 -> location
  % #5 -> description
  % #6 -> file
  % #7 -> pages
  % #8 -> options
  \ifapplication@referencesToToc
    \addcontentsline{toc}{section}{#1 -- #2}
  \fi
  \foreach [count=\c] \p in {#7}{%
    \marginParagraph{%
      \ifnum\c=1
        \referencePositionStyle{#1}\par%
        \referenceInstitutionStyle{#2}\par\bigskip
        \referenceDateStyle{#3}%
        \isEmpty{#4}{}{%
          \par%
          \referenceLocationStyle{#4}%
        }%
        \isEmpty{#5}{}{%
          \par\bigskip%
          \referenceDescriptionStyle{#5}%
        }%
      \fi
    }{%
      \tikz[baseline=-1em]\node[%
       reference file
      ]{%
       \includegraphics[%
          width=\textwidth,
          page=\p,
          #8%
        ]{#6}
      };
    }
    \clearpage
  }
}
\def\cvEntry@references{}
\newcommand{\addReference}[4][]{%
  % Desc: Append a refference to the refference list
  % Useage: \appendReference{#1}{#2}{#3}
  % #1 -> options
  % #2 -> file
  % #3 -> pages
  % #4 -> description
  \listeadd{\cvEntry@references}{%
    \noexpand%
    \reference{\cvEntry@position}
              {\cvEntry@institution}
              {\cvEntry@date}
              {\cvEntry@location}
              {#4}
              {#2}
              {#3}
              {#1}
  }
}

\newif\ifcvEntry@useTags
\pgfkeys{%
  /cv entry/.is family,
  /cv entry/.cd,
  % define keys
  use tags/.is if=cvEntry@useTags,
  margin note/.store in=\cvEntry@marginNote,
  reference/.store in=\cvEntry@reference,
  reference options/.store in=\cvEntry@referenceOptions,
  reference pages/.estore in=\cvEntry@referencePages,
  reference description/.store in=\cvEntry@referenceDescription,
  %reference/.code={\addReference[#1]{#1}{\cvEntry@referenceDescription}},
}

\newcommand{\cvEntry}[7][]{%
  % parse pgfkeys
  \def\cvEntry@position{#2}
  \def\cvEntry@institution{#3}
  \def\cvEntry@date{#4}
  \def\cvEntry@location{#5}
  \def\cvEntry@description{#6}
  \def\cvEntry@referenceOptions{}
  \def\cvEntry@referenceDescription{}
  \def\cvEntry@referencePages{{1}}
  \undef\cvEntry@reference
  \pgfkeys{/cv entry, use tags=true, #1}%

  \ifdefined\cvEntry@reference
    \addReference[\cvEntry@referenceOptions]
                 {\cvEntry@reference}
                 {\cvEntry@referencePages}
                 {\cvEntry@referenceDescription}
  \fi

  \marginParagraph{%
    \cvEntryDateStyle{\cvEntry@date}%
    \isEmpty{#5}{}{%
      \\[\cvEntry@ParSep]%
      \cvEntryLocationStyle{\cvEntry@location}%
    }%
    \ifdefined\cvEntry@marginNote%
      \\[\cvEntry@ParSep]%
      \cvEntryMarginNoteStyle{\cvEntry@marginNote}%
    \fi%
  }{%
    \cvEntryPositionStyle{\cvEntry@position}~~\cvEntryInstitutionStyle{\cvEntry@institution}%
    \isEmpty{#6}{}{%
      \\[\cvEntry@ParSep]%
      \ifcvEntry@useTags%
        \skillTags{#6}
      \else%
        \cvEntryShortDescriptionStyle{#6}
      \fi%
    }%
    \isEmpty{#7}{}{%
      \\[\cvEntry@ParSep]%
      \begin{minipage}{\textwidth}%
        \setlength{\parskip}{0pt}
        \cvEntryDescriptionStyle{\cvEntry@description}%
      \end{minipage}%
    }%
  }%
  \\[\cvEntry@Sep]%
}
\newcommand{\printreferences}{\dolistloop{\cvEntry@references}}

%-- skill bars -----------------------------------------------------------------
\newcommand{\skillBar}[2][]{%
\progressbar[%
  roundnessr=0.1,
  width=\textwidth,
  heighta=1ex,
  filledcolor=skill_bar_color,
  linecolor=skill_bar_color,
  subdivisions=1,
  emptycolor=white,
  #1]{#2}
}
\newcommand{\skillBars}[2][ratio=0.25]{%
  \foreach \s / \p in {#2}{%
    \twoColumns[#1]{%
      \raggedleft%
      \s%
    }{%
      \skillBar{\p}%
    }%
  }%
}

%-------------------------------------------------------------------------------
%   ENVIRONMENTS
%-------------------------------------------------------------------------------
\newenvironment{cvitems}{%
  \begin{itemize}[%
    leftmargin=1em,%
    noitemsep,
    topsep=0pt,
    partopsep=0px
  ]%
}{%
  \end{itemize}%
}

\pgfkeys{%
  /cover letter/.is family,
  /cover letter/.cd,
  % define keys
  recipient contact/.store in=\coverLetter@recipientContact,
  header/.store in=\coverLetter@useHeader,
  ending/.store in=\coverLetter@ending,
  signature/.store in=\coverLetter@signature,
  signature height/.store in=\coverLetter@signatureHeight,
  % set default values
  header=true,
  ending=Yours,
  signature height=3.5em
}
\newenvironment{coverletter}[2][]{%
  \pgfkeys{/cover letter, #1}
  \ifdefined\coverLetter@useHeader
    \def\tmpTrue{true}
    \def\tmpFalse{false}
    \ifx\coverLetter@useHeader\tmpTrue
      \header
    \else\ifx\coverLetter@useHeader\tmpFalse
    \else
      \header[\coverLetter@useHeader]
    \else
    \fi
  \fi
  \begin{minipage}[t]{\textwidth}%
    \textbf{#2}\par\bigskip
}{%
    \par
    \coverLetter@ending,\par
    \ifdefined\coverLetter@signature
      \includegraphics[height=\coverLetter@signatureHeight]{\coverLetter@signature}\\
    \fi
    \application@firstName~\application@lastName
  \end{minipage}%
  \marginpar{%
    \begin{minipage}[t]{\marginparwidth}%
      \rightBoxedIcons[%
        width=\marginparwidth,%
        icon style=\textcolor{light_color},%
        text style=\slshape\textcolor{light_color}
      ]{%
        {%
          {calendar-alt}/{\today}%
        }
      }
      \ifdefined\coverLetter@recipientContact%
        \par
        \rightBoxedIcons[%
          width=\marginparwidth,%
          icon style=\textcolor{light_color},%
          text style=\textcolor{light_color}
        ]{%
          \coverLetter@recipientContact
        }
      \fi
    \end{minipage}%
  }%
}
\newenvironment{coverletter*}[2][]{%
  \pgfkeys{/cover letter, #1}
  \ifdefined\coverLetter@useHeader
    \header*
  \fi
  \begin{minipage}[t]{\textwidth}%
    \textbf{#2}\par\bigskip
}{%
    \par
    \coverLetter@ending,\par
    \ifdefined\coverLetter@signature
      \includegraphics[height=\coverLetter@signatureHeight]{\coverLetter@signature}\\
    \fi
    \application@firstName~\application@lastName
  \end{minipage}%
  \marginpar{%
    \begin{minipage}[t]{\marginparwidth}%
      \rightBoxedIcons[%
        width=\marginparwidth,%
        icon style=\textcolor{light_color},%
        text style=\slshape\textcolor{light_color}
      ]{%
        {%
          {calendar-alt}/{\today}%
        }
      }
      \ifdefined\coverLetter@recipientContact%
        \par
        \rightBoxedIcons[%
          width=\marginparwidth,%
          icon style=\textcolor{light_color},%
          text style=\textcolor{light_color}
        ]{%
          \coverLetter@recipientContact
        }
      \fi
    \end{minipage}%
  }%
}

%-------------------------------------------------------------------------------
%   LOAD STYLE
%-------------------------------------------------------------------------------
\ifdefined\application@Style
  \RequirePackage{application_style_\application@Style}
\fi
