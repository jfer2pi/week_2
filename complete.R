complete <- function(directory, id = 1:332) {
    setwd(directory)
    files <- list.files()
    relevant.files <- files[id]
    relevant.data <- lapply(relevant.files, read.csv, header = TRUE)
    
    data.frames <- lapply(relevant.data, data.frame)
    comp.cases <- lapply(data.frames, complete.cases)
    nobs <- sapply(comp.cases, sum)
    data.frame(id,nobs)
    
}