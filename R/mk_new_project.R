#' mk_new_project
#'
#' Creates a folder structure for a new project according to the template.
#'
#' @name mk_new_project
#' @param path The path to the new project directory.
#' @return Invisible. Used by RStudio to set up a new project using the template.
#' @importFrom usethis use_git
#' @export

mk_new_project <- function(path, ...){
  # collect inputs
  dots <- list(...)
  text <- lapply(seq_along(dots), function(i) {
    key <- names(dots)[[i]]
    val <- dots[[i]]
    paste0(key, ": ", val)
  })


  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # set up folder structure
  setwd(file.path(getwd(), path))
  invisible(lapply(c("code", "data-raw", "data-derived", "design", "figures", "manuscript",
                     "photos"), dir.create, recursive = TRUE, showWarnings = FALSE))

  # create README.md template
  readme <- c(paste('# ', dots[["name"]]),
              '',
              '[add your description of the project here]',
              '',
              '# Folder structure',
              'The folders in this project are arranged as follows:',
              dots[["name"]],
              '├╴ code/                    (analysis script files: .R, .stan, etc.)',
              '├╴ data-derived/            (intermediate/end data products)',
              '├╴ data-raw/                (raw data - READ ONLY!)',
              '├╴ design/                  (experimental design & planning files)',
              '├╴ figures/                 (figures/visualizations of results)',
              '├╴ manuscript/              (manuscript reporting project)',
              '├╴ photos/                  (photos associated with the project)',
              '├╴ acknowledgments.md       (list of people & organizations to acknowledge)',
              '└╴ README.md                (this file, describing the project)',
              '',
              ifelse(dots[["usegit"]], c('A Git repository has been initialized for this project',
                                         ''), '')
  )
  writeLines(paste(readme, sep = '\n'), 'README.md')

  # create acknowledgments.md template
  acknowl <- c('## Funding',
               '- [organization] [grant number]',
               '',
               '## Logistical support',
               '- ',
               '',
               '## Access to field sites',
               '- ',
               '',
               '## Other assistance',
               '- ')
  writeLines(paste(acknowl, sep = '\n'), 'acknowledgments.md')

  # create .gitignore
  if(dots[["usegit"]]) {
    # initialize git repo
    usethis::use_git()

    # create .gitignore
    git_ignore <-
      c(
        '# History files',
        '.Rhistory',
        '.Rapp.history',
        '',
        '# Session Data files',
        '.RData',
        '',
        '# User-specific files',
        '.Ruserdata',
        '',
        '# Example code in package build process',
        '*-Ex.R',
        '',
        '# Output files from R CMD build',
        '/*.tar.gz',
        '',
        '# Output files from R CMD check',
        '/*.Rcheck/',
        '',
        '# RStudio files',
        '.Rproj.user/',
        '',
        '# produced vignettes',
        'vignettes/*.html',
        'vignettes/*.pdf',
        '',
        '# OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3',
        '.httr-oauth',
        '',
        '# knitr and R markdown default cache directories',
        '*_cache/',
        '/cache/',
        '',
        '# Temporary files created by R markdown',
        '*.utf8.md',
        '*.knit.md',
        '',
        '# R Environment Variables',
        '.Renviron',
        '',
        '# pkgdown site',
        'docs/',
        '',
        '# translation temp files',
        'po/*~'
      )
    writeLines(paste(git_ignore, sep = '\n'), '.gitignore')
  }
}
