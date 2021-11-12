# template

This package works with RStudio to set up a template folder structure for a new project. The 
package functions are not directly called by users, but instead work as an add-on to RStudio.

## Installation

You can install the development version of template like so:

``` r
# install.packages("remotes")
remotes::install_github("DICELab-NCSU/template")
```

RStudio will recognize the template automatically. When creating an RStudio project in a new 
directory, scroll down the list of creation options to 'DICE Lab Template'.

`New Project...` > `New Directory` > `🎲 DICE Project Template`

This will set up the file structure
```
Project Name
   ├╴code
   ├╴data-derived
   ├╴data-raw
   ├╴design
   ├╴figures
   ├╴manuscript
   ├╴photos
   ├╴acknowledgements.md
   └╴README.md
```
in whichever directory you choose and with the `Project Name` you provide.
