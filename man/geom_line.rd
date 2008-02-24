\name{GeomLine}
\alias{geom_line}
\alias{GeomLine}
\title{geom_line}
\description{Connect observations, in ordered by x value}
\details{
This page describes \code{\link{geom_line}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_line.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_line(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_line(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_path}}: Connect observations, in original order
  \item \code{\link{geom_segment}}: Line segments
  \item \code{\link{geom_ribbon}}: Fill between line and x-axis
  \item \url{http://had.co.nz/ggplot/geom_line.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Summarise number of movie ratings by year of movie
    mry <- do.call(rbind, by(movies, round(movies$rating), function(df) { 
      nums <- tapply(df$length, df$year, length)
      data.frame(rating=round(df$rating[1]), year = as.numeric(names(nums)), number=as.vector(nums))
    }))

    p <- ggplot(mry, aes(x=year, y=number, group=rating))
    p + geom_line()

    # Add aesthetic mappings
    p + geom_line(aes(size = rating))
    p + geom_line(aes(colour = rating))

    # Change scale
    p + geom_line(aes(colour = rating)) + scale_colour_gradient(low="red")
    
    # Set aesthetics to fixed value
    p + geom_line(colour = "red", size = 1)

    # Use qplot instead
    qplot(year, number, data=mry, group=rating, geom="line")
    qplot(year, number, data=mry, group=rating, geom="path", statistic="sortx")
    
    # Using a time series
    qplot(date, pop, data=economics, geom="line")
    qplot(date, pop, data=economics, geom="line", log="y")
    qplot(date, pop, data=subset(economics, date > as.Date("2006-1-1")), geom="line")
    qplot(date, pop, data=economics, size=unemploy/pop, geom="line")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}