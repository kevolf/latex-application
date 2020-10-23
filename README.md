<!--
Based on the README Tamplate from: https://github.com/othneildrew/Best-README-Template
-->

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

## Table of Contents

<!-- MarkdownTOC autolink="true" levels="2,3" -->

- [About The Project](#about-the-project)
	- [Preview](#preview)
- [Getting Started](#getting-started)
	- [Prerequisites](#prerequisites)
	- [Installation](#installation)
	- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

<!-- /MarkdownTOC -->

## About The Project

This is a LaTex class for modern job applications.
It has been inspired by [Awesome CV][awesome-cv].

It includes convenient macros to typeset your *cover letter* and *CV* and manage the corresponding *references* in a single document.

Additionally, separating pages for each chapter and a modern title page are handled automatically.

### Preview

|                Titlepage                 |                  Cover Letter                   |  Curriculum Vitae   |
|:----------------------------------------:|:-----------------------------------------------:|:-------------------:|
| [![titlepage][titelpage]][titlepage-pdf] | [![Cover Letter][coverletter]][coverletter-pdf] | [![CV][cv]][cv-pdf] |

## Getting Started

### Prerequisites

The following LaTeX packages are used.
They should be shipped with every major TeX distribution.

 * `pgfopts` -- to process key value pairs as packages and macro options
 * `fontspec` -- advanced font management
 * `sourcesanspro` -- used font
 * `babel` -- (multi)language support
 * `calc` -- advanced calculations with spaces
 * `enumitem` -- advanced list environment
 * `fancyhdr` -- manage header and footer
 * `fontawesome5` -- use font awesome icons
 * `ifthen` -- advance conditionals
 * `lastpage` -- get last page number
 * `parskip` -- no indentions
 * `progressbar` -- skill bars
 * `suffix` -- defined starred version of command
 * `tcolorbox` -- use `fill overzoom image` to typeset portrait
 * `tikz` -- vector graphics language
 * `titlesec` -- customization of titles
 * `tocloft` -- customization of table of contents
 * `translations` -- easy translations for strings
 * `xcolor` -- manage colors
 * `geometry` -- document geometry
 * `hyperref` -- advanced links

In order to use the provided `Makefile` ensure [`latexmk`][latexmk] is in your PATH.

### Installation

1. Clone the repo
```sh
git clone https://github.com/kevolf/latex-application.git
```

### Usage

A minimal example can be found in the `example` folder.
Use this as a starting point, by either editing it right in place or coping to to a directory more convenient to you.

**Note:** Ensure that the relative paths used in the `Makefile` are correct, if the working directory is changed.

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]


[contributors-shield]: https://img.shields.io/github/contributors/kevolf/latex-application.svg?style=flat-square
[contributors-url]: https://github.com/kevolf/latex-application/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/kevolf/latex-application.svg?style=flat-square
[forks-url]: https://github.com/kevolf/latex-application/network/members
[stars-shield]: https://img.shields.io/github/stars/kevolf/latex-application.svg?style=flat-square
[stars-url]: https://github.com/kevolf/latex-application/stargazers
[issues-shield]: https://img.shields.io/github/issues/kevolf/latex-application.svg?style=flat-square
[issues-url]: https://github.com/kevolf/latex-application/issues
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[awesome-cv]: https://github.com/posquit0/Awesome-CV
[titelpage]: svg/titlepage.svg
[titlepage-pdf]: https://raw.githubusercontent.com/kevolf/latex-application/main/example/out/main.pdf#page=1
[coverletter]: svg/cover_letter.svg
[coverletter-pdf]: https://raw.githubusercontent.com/kevolf/latex-application/main/example/out/main.pdf#page=4
[cv]: svg/cv.svg
[cv-pdf]: https://raw.githubusercontent.com/kevolf/latex-application/main/example/out/main.pdf#page=6
[latexmk]: https://ctan.org/pkg/latexmk?lang=en
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
