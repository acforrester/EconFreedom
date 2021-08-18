\name{efwpnl}
\alias{efwpnl}
\docType{data}
\title{
Economic Freedom of the World
}
\description{
Data on economic freedom from the Gwartney et al. (2020) Economic Freedom of the World report.
}
\usage{data("efwpnl")}
\format{
  A data frame with 4050 observations on the following 9 variables.
  \describe{
    \item{\code{iso_code}}{a character vector}
    \item{\code{year}}{a numeric vector}
    \item{\code{country_name}}{a character vector}
    \item{\code{efw_index}}{a numeric vector}
    \item{\code{size_of_govt}}{a numeric vector}
    \item{\code{legal_system}}{a numeric vector}
    \item{\code{sound_money}}{a numeric vector}
    \item{\code{trade_freedom}}{a numeric vector}
    \item{\code{regulation}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
  \url{https://www.fraserinstitute.org/studies/economic-freedom}
}
\references{
James Gwartney, Robert Lawson, Joshua Hall, and Ryan Murphy (2020). Economic Freedom of the World: 2020 Edition. Fraser Institute.
}
\examples{
data(efwpnl)
}
\keyword{datasets}
