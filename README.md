# template

This package works with RStudio to set up a template folder structure for a new project. The 
package functions are not directly called by users, but instead work as an add-on to RStudio.

## Installation

You can install the development version of template like so:

``` r
# install.packages("remotes")
remotes::install_github("DICELab-NCSU/template")
```

## Using the project template
RStudio will recognize the template automatically once the package has been installed. When creating an RStudio project in a new 
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

## Mix your own project template
I followed the [RStudio Project Templates guide](https://rstudio.github.io/rstudio-extensions/rstudio_project_templates.html) to set this up. As a quick cheatsheet, here's how you change the parts of this template:

#### list of folders that are created
`R/mk_new_project.R`

Add/edit/delete the folder names you want to create in the `invisible(lapply(c(...` section.

#### default README contents
`R/mk_new_project.R`

Add/edit/delete text from the `readme <- c(paste(...` section.

#### change the icon
`inst/rstudio/templates/project`

The current file is `dice.png`. It's gotta be a (small) .png file. If you rename it, you'll need to update the file name in `mk_new_project.dcf` in that same folder.

#### add/edit/delete options in the project set-up dialog box
`inst/rstudio/templates/project/mk_new_project.dcf`

This is a bit more advanced. Have a read up on the documentation for the types of user input you can solicit, and have a look at how to access the user input via `...` arguments in `R/mk_new_project.R`.
