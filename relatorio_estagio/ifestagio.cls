\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifestagio}[2017/01/26 v2.0 Classe IF para relatório de estágio por Marcos Roberto Ribeiro]

% Repassa demais opções a abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax

% ===============================================
% Herança da classe `abntex2' e inclusão das opções padrões
% ===============================================
\LoadClass[12pt,a4paper]{abntex2}

% ===============================================
% Pacotes Usados
% ===============================================
\RequirePackage[T1]{fontenc}          % Seleção de códigos de fonte
\RequirePackage[utf8]{inputenc}       % Codificação automática de caracteres especiais
\RequirePackage{morewrites}           % Resolve o erro “No room for a new \write”
\RequirePackage[lighttt]{lmodern}     % Usa a fonte Latin Modern
\RequirePackage{lastpage}             % Contagem de páginas
\RequirePackage{indentfirst}          % Indenta primeiro parágrafo de cada seção
\RequirePackage{color, xcolor}        % Controle das cores
\RequirePackage{graphicx}             % Inclusão de gráficos
\RequirePackage{caption}              % Pacote para definição dos captions
\RequirePackage{microtype}            % Melhorias de justificação
\RequirePackage{pdfpages}             % inclusão de arquivos PDF
\RequirePackage{hyphenat}             % Retira hifenização do Preâmbulo
\RequirePackage{amsmath,amsfonts}     % Pacotes matemáticos
\RequirePackage{amssymb,amsthm}       % Pacotes matemáticos
\RequirePackage{url}                  % Tratamento correto de URL
\RequirePackage{enumerate}            % Listas numerados personalizadas
\RequirePackage{cleveref}             % Correção de links para sub-equações
\RequirePackage{float}                % Ambientes flutuantes personalizados

\RequirePackage{tikz}                 % Pacote para desenho
\usetikzlibrary{shapes,arrows,matrix,positioning,backgrounds,calc,trees,fit}%
\RequirePackage{adjustbox}            % Pacote para reduzir/ampliar

% Preserva comando \bibcite alterado pelo pacote abntex2cite
\let\oldbibcite\bibcite%
\RequirePackage[alf,abnt-repeated-author-omit=yes,abnt-etal-list=0
]{abntex2cite}    % Citações ABNT
\let\bibcite\oldbibcite%

% -----------------------------------------------
% Configurações
% -----------------------------------------------


% Empresa
\providecommand{\imprimirempresa}{Empresa}%
\newcommand{\empresa}[1]{%
  \renewcommand{\imprimirempresa}{#1}%
}%

% Horas
\providecommand{\imprimirhoras}{1512}%
\newcommand{\horas}[1]{%
  \renewcommand{\imprimirhoras}{#1}%
}%


% Curso e Título obtido
\providecommand{\imprimircurso}{}%
\providecommand{\imprimirtitulocurso}{}%
\newcommand{\curso}[2]{%
  \renewcommand{\imprimirtitulocurso}{#1}%
  \renewcommand{\imprimircurso}{#2}%
}%

% Redefinição do comando de data
\renewcommand{\data}[3]{%
  \date{#1}{#2}{#3}%
}%

% Redefinição do comando \date do Latex
\renewcommand{\date}[3]{%
  \gdef\@day{#1}%
  \gdef\@month{#2}%
  \gdef\@year{#3}%
  \gdef\@date{\@day~de~\@month~de~\@year}%
}%

% Define a data
\date{\number\day}{\monthname}{\number\year}%

% Redefinição de Orientador
\renewcommand{\orientador}[2][do Professor]%
  {\renewcommand{\imprimirorientador}{#2}%
   \renewcommand{\imprimirorientadorRotulo}{#1}}%

% Preâmbulo
\preambulo{%
  Relatório de Estágio Supervisionado do Curso de {\imprimirtitulocurso} em {\imprimircurso} da Pontifícia Universidade Católica do Rio de Janeiro {\imprimirunidade}, sob a coordenação de
  {\imprimirorientadorRotulo}
  {\imprimirorientador}.
  O Estágio foi realizado na instituição {\imprimirempresa} e teve a duração de {\imprimirhoras} horas.%
}%

% Citações explícitas
\newcommand{\citet}{\citeonline}%

% -----------------------------------------------
% Fonte padrão section, subsection e subsubsection
% -----------------------------------------------
\renewcommand{\ABNTEXchapterfont}{\LARGE\bfseries}%

% -----------------------------------------------
% Definições de comprimento
% -----------------------------------------------
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}%
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}%
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}%
\setlength{\parindent}{1.25cm}%

% -----------------------------------------------
% Contadores
% -----------------------------------------------
% Equações com numeração contínua
\counterwithout{equation}{chapter}%
% Numerar sub-sub-seções
\setsecnumdepth{subsubsection}%
% Sumário contém apenas até as subseções
\settocdepth{subsection}%
% Figuras com numeração reiniciao nos capítulos
\newsubfloat{figure}%

% -----------------------------------------------
% Quadros
% -----------------------------------------------
% Cria o ambiente para quadros
\newcommand{\quadronome}{Quadro}%
\newcommand{\listquadronome}{Lista de Quadro}%
\newlistof{listofquadros}{loq}{\listquadronome}%
\newfloat{quadro}{loq}{\quadronome}%
\newlistentry{quadro}{loq}{0}%
\renewcommand{\cftquadroname}{\quadronome\space}%
\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}%

% Mudança de estilo
\floatstyle{ruled}%
\captionsetup[quadro]{labelsep=endash}%

% -----------------------------------------------
% Logos do IF
% -----------------------------------------------
% Definição de formas
\definecolor{ifverde}{RGB}{50,160,65}
\definecolor{ifvermelho}{RGB}{200,25,30}
\tikzstyle{circulo}=[circle, fill={ifvermelho}, minimum size=11mm, node distance=1.5mm]%
\tikzstyle{quadrado}=[rounded corners=1mm, fill={ifverde}, minimum size=10mm]%
\tikzstyle{texto}=[inner sep=0,outer sep=0,text depth=0pt, node distance=17mm]%


% -----------------------------------------------
% Ajuste de cabeçalho e rodapé
% -----------------------------------------------
\makepagestyle{eescchaplast}%
\makeevenhead{eescchaplast}%
{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}%
\makeoddhead{eescchaplast}%
{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}%
\makeheadrule{eescchaplast}{\textwidth}{\normalrulethickness}%
\makepagestyle{eescpartlast}%
\makeoddhead{eescpartlast}{}{}{\ABNTEXfontereduzida\thepage}%
\makeevenhead{eescpartlast}{\ABNTEXfontereduzida\thepage}{}{}%

% -----------------------------------------------
% Configuração de Páginas
% -----------------------------------------------
% Configuração de páginas pré-textuais
\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}%
  \pagestyle{empty}%
  \aliaspagestyle{cleared}{empty}%
  \aliaspagestyle{part}{empty}%
}%
\renewcommand{\frontmatter}{\pretextual} %

% Configuração de páginas textuais
\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}%
  \aliaspagestyle{cleared}{eescchaplast}%
  \aliaspagestyle{part}{eescchaplast}%
  \nouppercaseheads%
}%

% Configuração de páginas pós-textuais
\renewcommand{\postextual}{%
  \pagestyle{abntheadings}%
  \aliaspagestyle{chapter}{abntchapfirst}%
  \aliaspagestyle{cleared}{eescchaplast}%
  \aliaspagestyle{part}{eescpartlast}%
  \aliaspagestyle{afterpart}{eescpartlast}%
}%
\renewcommand{\backmatter}{\postextual}%

% ===============================================
% Elementos Pré-Textuais
% ===============================================

% -----------------------------------------------
% Capa
% -----------------------------------------------
\renewcommand{\imprimircapa}{%
  \pdfbookmark[0]{Capa}{}%
  \thispagestyle{empty}%
  \noindent%
  \begin{center}
    {\adjustbox{scale=0.45}{\iffull}}%
    {\large\bfseries%
    \par%
    \vspace*{\baselineskip}%
    \MakeUppercase{{\imprimirtitulocurso} em {\imprimircurso}}%
    \par%
    \vspace*{2\baselineskip}%
    {\large\textbf{\imprimirautor}}%
    }%
    \vfill%
    {\Large{\textbf{RELATÓRIO DE ESTÁGIO SUPERVISIONADO}}}%
    \vfill%
    \textbf{\imprimirlocal}\par%%
    \textbf{\@year}%
    \cleardoublepage%
  \end{center}
}

% -----------------------------------------------
% Folha de Rosto
% -----------------------------------------------
\renewcommand{\folhaderostocontent}{%
  \setcounter{page}{1}%
  \begin{center}%
    \vfill%
    {\large\textbf{\imprimirautor}}%
    \vfill%
    {\Large{\textbf{RELATÓRIO DE ESTÁGIO SUPERVISIONADO}}}%
    \vfill%
    \hspace{.45\textwidth}%
    \begin{minipage}{.5\textwidth}%
        \imprimirpreambulo%
    \end{minipage}%
    \vfill%
    \textbf{\imprimirlocal}\par%%
    \textbf{\@year}%
  \end{center}%
}%

\newcommand{\gerafolharosto}{%
  \imprimirfolhaderosto{}%
}%

% -----------------------------------------------
% Dedicatória
% -----------------------------------------------
\newcommand{\inserirdedicatoria}[1]{%
  \newcommand{\textodedicatoria}{#1}%
}

\newcommand{\geradedicatoria}{%
  \ifthenelse{\isundefined{\textodedicatoria}}
  {}{%
        \begin{dedicatoria}%
        \vspace*{\fill}%
        \centering%
        \noindent%
        \textit{\textodedicatoria}%
        \vspace*{\fill}%
    \end{dedicatoria}%
  }%
}%

% -----------------------------------------------
% Agradecimentos
% -----------------------------------------------
\newcommand{\inseriragradecimentos}[1]{%
  \newcommand{\textoagradecimentos}{#1}%
}

\newcommand{\geraagradecimentos}{%
  \ifthenelse{\isundefined{\textoagradecimentos}}
  {}{%
    \begin{agradecimentos}%
      \textoagradecimentos%
    \end{agradecimentos}%
  }%
}%

% -----------------------------------------------
% Epígrafe
% -----------------------------------------------
\newcommand{\inserirepigrafe}[1]{%
  \newcommand{\textoepigrafe}{#1}%
}

\newcommand{\geraepigrafe}{%
\ifthenelse{\isundefined{\textoepigrafe}}
  {}{%
    \begin{epigrafe}%
      \vspace*{\fill}%
      \begin{flushright}%
        \textit{\textoepigrafe}%
      \end{flushright}%
    \end{epigrafe}%
  }%
}%

% ===============================================
% Listas e Sumário
% ===============================================

% -----------------------------------------------
% Lista de ilustrações
% -----------------------------------------------
\newcommand{\incluirlistailustracoes}{FALSE}%
\newcommand{\inserirlistafiguras}{%
  \renewcommand{\incluirlistailustracoes}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listfigurename}%
    {Lista de Figuras}%
}

\newcommand{\geralistailustracoes}{%
  \ifthenelse{\equal{\incluirlistailustracoes}{TRUE}}{%
    \pretextualchapter{\listfigurename}
    \@starttoc{lof}
    \cleardoublepage%
   }{}%
}%



% -----------------------------------------------
% Sumário
% -----------------------------------------------
\newcommand{\sumario}{%
  \pretextualchapter{\contentsname}
  \thispagestyle{empty}
  \pagestyle{empty}
  \@starttoc{toc}
  \cleardoublepage
}

% ===============================================
% Redefinição do \maketitle
% ===============================================
\renewcommand{\maketitle}{%
  \pretextual
  % Capa
  \imprimircapa

  % Folha de rosto
  \gerafolharosto

  % Dedicatória
  \geradedicatoria

  % Agradecimentos
  \geraagradecimentos

  % Epígrafe
  \geraepigrafe

  % Lista de ilustrações
  \geralistailustracoes

  % Lista de quadros
  \geralistaquadros

  % Lista de tabelas
  \geralistatabelas

  % Sumário
  \sumario

  % Formatação de páginas textuais
  \mainmatter
}

% -----------------------------------------------
% Configurações de aparência do PDF final
% -----------------------------------------------
\AtBeginDocument{%
\makeatletter%
\hypersetup{%
    pdftitle={Relatório de Estágio Supervisionado},%
    pdfauthor={\@author},%
    pdfsubject={\imprimirpreambulo},%
    pdfcreator={\@author},%
    bookmarksdepth=4,%
    breaklinks=true%
}%
\makeatother%
}%

% -----------------------------------------------
% Ambiente baseados em teoremas
% -----------------------------------------------
\theoremstyle{definition}%
\newtheorem{corolario}{Corolário}%
\newtheorem{definicao}{Definição}%
\newtheorem{exemplo}{Exemplo}%
\newtheorem{lema}{Lema}%
\newtheorem{observacao}{Observação}%
\newtheorem{proposicao}{Proposição}%
\newtheorem{teorema}{Teorema}%
\newenvironment{demonstracao}{\begin{proof}[Demonstração]}{\end{proof}}%

% -----------------------------------------------
% Evita violação de margens
% -----------------------------------------------
\sloppy%
