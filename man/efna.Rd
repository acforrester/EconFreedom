\name{efna}
\alias{efna}
\docType{data}
\title{Economic Freedom of North America}
\description{
Data on economic freedom for the 50 US states from the Stansel et al. (2020) Economic Freedom of North America report.
}
\usage{data("efna")}
\format{
  A data frame with 1900 observations on the following 8 variables.
  \describe{
    \item{\code{stfips}}{a character vector}
    \item{\code{usps}}{a character vector}
    \item{\code{state_name}}{a character vector}
    \item{\code{year}}{a numeric vector}
    \item{\code{efna_index}}{a numeric vector}
    \item{\code{efna_spending}}{a numeric vector}
    \item{\code{efna_taxation}}{a numeric vector}
    \item{\code{efna_lab_mkt}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
  \url{https://www.fraserinstitute.org/studies/economic-freedom}
}
\references{
  Dean Stansel, Jose Torra, and Fred McMahon (2020). Economic Freedom of North America 2020. Fraser Institute.
}
\examples{
data(efna)
}
\keyword{datasets}
