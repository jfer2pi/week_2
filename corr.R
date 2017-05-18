corr <- function(directory, threshold = 0) {
    setwd(directory)
    source('~/Dropbox/Coursera DS/complete.R')
    obs <- complete(directory)
    obs.wanted <- subset(obs, nobs > threshold)$id
    

    
    if (length(obs.wanted) == 0)
    {
        holder <- vector("numeric", 0)
    }
    else{
        files <- list.files()
        files.wanted <- files[obs.wanted]
        
        relevant.data <- lapply(files.wanted, read.csv, header = TRUE)
        
        holder <- vector("numeric", length(relevant.data))
        length.relevant <- length(relevant.data)
        
        for (i in 1:length.relevant) {
            holder[i] <-
                cor(relevant.data[[i]]$sulfate,
                    relevant.data[[i]]$nitrate,
                    "complete.obs")
        }
        
        holder
    }
    
}