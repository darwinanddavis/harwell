# src http://www.pacdv.com/sounds/voices-4.html
packages <- c("RCurl","beepr")
if(require(packages)){
  install.packages(packages,dependencies = T)
}
ppp <- lapply(packages,require,character.only=T)
if(any(ppp==F)){cbind(packages,ppp);cat("\n\n\n ---> Check packages are loaded properly <--- \n\n\n")}

# smashmouth 
# https://www.youtube.com/watch?v=xRbNB5VopMM&index=1&list=RDahXQ7e8w7mQ
# https://youtu.be/rlYys58hsCU?list=RDahXQ7e8w7mQ
# https://www.youtube.com/watch?time_continue=24&v=ahXQ7e8w7mQ # windows XP ver

# ******* back end code to call as snab_wavs.R *********** 
# steps
# 1. find wav files online
# 2. save urls to list in R
# 3. Write a function to read list and plat sound file (w vol and repeat options)
# 4. save function to online repo
# 5. pull online file into R
# 6. embed code in R to play sound file 

harwell <- function(sound,vol,reps){
  snab_wavs_list <- list( # 1 = random default pck sound 
    "http://www.pacdv.com/sounds/voices/oh-my-god-1.wav", # omg
    "http://www.pacdv.com/sounds/voices/okay-2.wav", # OK
    "http://www.pacdv.com/sounds/voices/mmm-1.wav", # mmm
    "http://www.pacdv.com/sounds/voices/open-the-goddamn-door.wav", # open the door
    "http://www.pacdv.com/sounds/voices/rrrou-1.wav", # rwar
    "http://www.pacdv.com/sounds/voices/rrrou-2.wav", # rwar2
    "http://www.pacdv.com/sounds/voices/shh-shh.wav", # shh
    "http://www.pacdv.com/sounds/voices/thank-god-its-friday.wav", # friyay
    "http://www.pacdv.com/sounds/voices/that-feels-really-powerful.wav", # powerful
    "http://www.pacdv.com/sounds/voices/thats-okay-1.wav", # that's OK
    "http://www.pacdv.com/sounds/voices/this-is-ridiculous.wav", # ridiculous 
    "http://www.pacdv.com/sounds/voices/who-are-you.wav", # who are you
    "http://www.pacdv.com/sounds/voices/have-a-good-weekend.wav" # weekend
  )
  # sound <- length(snab_wavs_list)
  # vol <- 5 # !!! 5 = loud! 
  # reps <- 1 # no. of times to repeat sound
  if(sound==0){sound <- sample(length(snab_wavs_list),1)}
  if(sound==1){
    play_file <- replicate(reps,{beep(sample(11),1)})#replicate(reps,{beep(rep_len(sample(11,1),1))})
    }else{ 
    play_file <- replicate(reps,{beep(rep(snab_wavs_list[[sound]]),vol)})
    }
} # end function  


# now execute the above file 
# cat("\n\n",rep("-",30),"\nEnter number to represent sound file ( up to ",length(snab_wavs_list),") or '0' to play a random sound
#     \nEnter the volume level (5 is average vol)
#     \nEnter how many times you want the sound repeated\n"
#     ,rep("-",30),
#     "\n\n")
