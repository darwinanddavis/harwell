# harwell reward program

# 1. write function to play file every hour
# (most likely from cron or bash hereafter (https://superuser.com/questions/243893/how-to-make-run-cron-on-osx-10-6-2))
# 2. stop sound file when key is pressed (login to comp)
# 3. get time elapsed since play started and any key pressed (+ perhaps random wait time added)
# 4. input time elapsed into vector to make distribution (must be positive integer)
# 5. either a) sample from dist randomly or b) increase frequency of play time based on time elapsed (step 6)
# 6. ### to increase play time frequency. sample number from lower tail end of above dist. 
# if median of dist deviates further from 0 (i.e. lower tail of dist become longer to indicate more time has passed since pressing a key), increase time to replay sound file. this needs to log incremental differences, not absolute, otherwise tail will always be longer.   
# if median of dist remains the same/approaches 0 (indicating quicker response time), decrease time to play sound file.
# if too much time elapses (no one in office/good behaviour reward), turn off sound file
# 7. the above reward system incentivises listening to the song in full for longer time periods. 
# e.g. set.seed(10);plot(density(sample(10)));abline(v=0);set.seed(50);plot(density(sample(50)));abline(v=0)

# to put in target file 
# opt 1 - for naked file
packages <- c("RCurl","beepr"); if(require(packages)){install.packages(packages,dependencies = T)}; ppp <- lapply(packages,require,character.only=T); if(any(ppp==F)){cbind(packages,ppp);cat("\n\n\n ---> Check packages are loaded properly <--- \n\n\n")}
script <- getURL("https://raw.githubusercontent.com/darwinanddavis/harwell/master/snab_wavs.R", ssl.verifypeer = FALSE)
eval(parse(text = script))
# opt 2 - for files with 'packages' scipt at beginning of R file 
packages <- c("RCurl","beepr")
script <- getURL("https://raw.githubusercontent.com/darwinanddavis/harwell/master/snab_wavs.R", ssl.verifypeer = FALSE)
eval(parse(text = script))

# run func
harwell(7,1,2)












# testing space

# smashmouth_hour <- substr(format(Sys.time(), "%X")[1],1,2)
# if(Sys.time()==smashmouth_hour){print("It's SMASH TIME")}
# as.POSIXct(smashmouth_hour)
# 
# format(Sys.time(), "%a %b %d %X %Y")
# substr(format(Sys.time(), "%X")[1],1,2)