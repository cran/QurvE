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

## ----navbar, dpi=100, echo = F, fig.cap = "\\label{fig:navbar} The QurvE navigation bar."----
knitr::include_graphics("https://i.imgur.com/8iVuDk7.png", dpi=100, error = F)

## ----custom-layout, dpi=100, echo = F, fig.cap = "\\label{fig:custom-layout} Figure 1: QurvE custom data layout."----
knitr::include_graphics("https://i.imgur.com/T7LkFDi.png", dpi=100, error = F)

## ----mapping-layout, echo = F, dpi=100, fig.cap = "\\label{fig:mapping-layout} Figure 2: The [Parse Raw Data] window enables loading raw data exported from a plate reader/bioreactor software. The right panel illustrates the layout of the additional mapping file with metadata that must be supplemented to analyze establish relationships between conditions and replicates."----
knitr::include_graphics("https://i.imgur.com/e5W2GHP.png", dpi=100, error = F)

## ----import-data, echo = F, dpi=100, fig.cap = "\\label{fig:import-data} Figure 3: The figure illustrates the [Data Import] window, which enables the user to load previously exported QurvE data files."----
knitr::include_graphics("https://i.imgur.com/u1DJ6y1.png", dpi=100, error = F)

## ----computation, echo = F, dpi=100, fig.cap = "\\label{fig:computation} Figure 4: The [Computation] window enables the user to define parameters for data processing and fitting. Growth data and fluorescence data must be processed separately."----
knitr::include_graphics("https://i.imgur.com/8pvJ00n.png", dpi=100, error = F)

## ----linear, echo = F, dpi=100, fig.cap = "\\label{fig:linear} Figure 5: Example of a fitted growth curve in the [Validation] window. On the right panel, the figure visualizes the performed fit. In this case, the red dots and dashed line represent the linear regression model used to calculate the maximum growth rate and lag time."----
knitr::include_graphics("https://i.imgur.com/oQpLemI.png", dpi=100, error = F)

## ----results, echo = F, dpi=100, fig.cap = "\\label{fig:results} Figure 6: The [Results] window gives a tabular overview of all computed parameters for each applied fit method as well as the results dose-response analyses."----
knitr::include_graphics("https://i.imgur.com/20tFagJ.png", dpi=100, error = F)

