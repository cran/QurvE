## ----setup, include = FALSE---------------------------------------------------
colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
     sprintf("\\textcolor{%s}{%s}", color, x)
   } else {
    sprintf("<span style='color: %s;'>%s</span>", color,
            x)
   }
}
colorize_code <- function(x, color) {
    if (knitr::is_latex_output()) {
         sprintf("\\texttt{\\textcolor{%s}{%s}}", color, x)
    } else if (knitr::is_html_output()) {
        sprintf("<span style='color: %s;'>`%s`</span>", color,
                x)
    }
}

