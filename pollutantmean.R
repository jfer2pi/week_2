# Week 2 assignment on specdata

# Set working directory in Coursera DS folder 

# The dataset is made up of many individual sensor files, each of which contains three
# variables, the date, the sulfate level, and the nitrate levels as measured on these
# dates.  The units are micrograms/m^3 for botth sensor readings.

# We are asked to write a function named pollutantmean that calculates the mean of a
# pollutant, with three arguments, directory, pollutant, and ID of the sensors to 
# consider

pollutantmean <- function(directory, pollutant, id = 1:332) {
    files <- list.files(directory)
    #wanted.source <- lapply(files, read.csv, header = TRUE)
    
    wanted.content <- data.frame()
    
    
    for(i in id) {
        wanted.content <- rbind(wanted.content, read.csv(files[i], header = TRUE))
    
    #mean(wanted.content$pollutant[complete.cases(wanted.content)], na.rm = TRUE)
    #nonas <- complete.cases(wanted.content)
    #mean(wanted.content[nonas, pollutant])
    }
    mean(wanted.content[complete.cases(wanted.content), pollutant])
}


