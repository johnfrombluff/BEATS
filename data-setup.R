require( car )
#dat$ATS_n      <- recode( as.numeric(dat$ATS_wMulti_2c), "1=0; 2=1")
#dat$ATS_n <- dat$ATS_wMulti_2c
dat$ATS_n <- dat$ATSvsMT
dat$whodecides <- recode(dat$tsdecision, "'My parents'='Other(s)'; 'School'='Other(s)'")
dat$BMI_f <- ordered(recode(dat$BMI_4cat,
                            "'Normal weight'='Normal'; 'Underweight'='Normal'"),
                     levels=c('Normal', "Overweight", "Obese"))
dat$cars3 <- ordered(recode( dat$HMcars,"'Two'='Two or more'; 'Three'='Two or more'; 'Four or more'='Two or more'" ) )
#dat$BMI_f <- factor(dat$BMI_2cat, labels=c("Healthy", "Unhealthy") )
detach(package:car)
require(rms)
label(dat$cars3) <- "Number of cars at home"
#dat$ATS_f        <- factor( dat$ATS_n, labels=c("Don't walk", "Walk") )
dat$NZDepCat3    <- ordered(dat$NZDepCat3, labels=c("High", "Med", "Low") )

# Transform rating scale variables to numeric
# Attitudes
dat$interesting   <- as.numeric(dat$WSAint);     label(dat$interesting) <- "Walking to school is interesting"
dat$pleasant      <- as.numeric(dat$WSAnice);    label(dat$pleasant)    <- "Walking to school is pleasant"
dat$boring        <- as.numeric(dat$WSAstim);    label(dat$boring)      <- "Walking to school is boring"
dat$healthy       <- as.numeric(dat$WSAhealthy); label(dat$healthy)     <- "Walking to school is healthy"
dat$useful        <- as.numeric(dat$WSAuseful);  label(dat$useful)      <- "Walking to school is useful"
dat$safe          <- as.numeric(dat$WSAsafe);    label(dat$safe)        <- "Walking to school is safe"

# Motivations
dat$exercise      <- as.numeric(dat$WSexercise); label(dat$exercise)    <- "Walking is a way to get exercise"
dat$chat          <- as.numeric(dat$WSchat);     label(dat$chat    )    <- "I can chat to friends walking"

# Barriers
dat$onway         <- as.numeric(dat$WCSone);     label(dat$onway   )    <- "School is on the way to somewhere"
dat$time          <- as.numeric(dat$WStime);     label(dat$time    )    <- "Walking takes too much time"
dat$stuff         <- as.numeric(dat$WSbstuff);   label(dat$stuff   )    <- "I have too much stuff"
dat$sched         <- as.numeric(dat$WSbsched);   label(dat$sched   )    <- "After-school schedule"
dat$planning      <- as.numeric(dat$WSbplan);    label(dat$planning)    <- "Takes too much planning"
dat$sweaty        <- as.numeric(dat$WSbsweat);   label(dat$sweaty  )    <- "Makes me sweat"
dat$unsafe        <- as.numeric(dat$WSbsafe);    label(dat$unsafe  )    <- "Not safe"
dat$tired         <- as.numeric(dat$WStired);    label(dat$tired   )    <- "Often too tired"
dat$desire        <- as.numeric(dat$WSbwant);    label(dat$desire  )    <- "I want to walk to school"

# Control
dat$confd         <- as.numeric(dat$WSconf);     label(dat$confd      )  <- "I am confident I can walk"
dat$control       <- as.numeric(dat$WScontrol);  label(dat$control    )  <- "I am in control of travel mode"
dat$intention     <- as.numeric(dat$WSintend);   label(dat$intention)    <- "I intend to walk to school"

# Family
dat$adults        <- as.numeric(dat$hadults);    label(dat$adults     )  <- "Number of adults at home"
dat$siblings      <- as.numeric(dat$hsiblings);  label(dat$siblings    ) <- "Number of siblings at home"
dat$n_cars        <- as.numeric(dat$HMcars);     label(dat$n_cars     )  <- "Number of cars at home"
dat$parents_walk  <- as.numeric(dat$WSpwalk);    label(dat$parents_walk) <- "My parents walk regularly"
dat$parents_safe  <- as.numeric(dat$WSpunsafe);  label(dat$parents_safe) <- "My parents think its not safe"

# Encouragement and role-modelling
dat$parents_say   <- as.numeric(dat$WSpsh);      label(dat$parents_say)  <- "My parents enourage me to walk"
dat$friends_say   <- as.numeric(dat$WSfsh);      label(dat$friends_say)  <- "My friends enourage me to walk"
dat$school_says   <- as.numeric(dat$WSeschool);  label(dat$school_says)  <- "My school enourages me to walk"
dat$cool          <- as.numeric(dat$WSbcool);    label(dat$cool    )     <- "It's not cool to walk"
dat$friends_dont  <- as.numeric(dat$WSbfri);     label(dat$friends_dont) <- "My friends don't walk"

# Physical environment
dat$weather       <- as.numeric(dat$WSbweather); label(dat$weather )     <- "The weather is to bad"
dat$boring_r      <- as.numeric(dat$WCSrbor);    label(dat$boring_r)     <- "The route to school is boring"
dat$hills         <- as.numeric(dat$WCShills);   label(dat$hills   )     <- "There are too many hills on the route"

# Lifestyle
dat$regwalk          <- as.numeric(dat$TgWalk) ; label(dat$regwalk)      <- "Walking for general mobility"

# Other
label(dat$schiclose) <- "I initially enrolled at the closest school"
#dat$closest          <- as.numeric(dat$schs5close); label(dat$closest)   <- "My school is the closest to my home"

# create ordered factors and drop unused levels in the process
dat$school_decile   <- ordered(   dat$ScDecile)
dat$school_decile_n <- as.numeric(dat$school_decile)

# Make more print-friendly levels
levels(dat$HMcars)[5] <- "Four or more"
levels(dat$PAGuideQ)  <-c("No", "Yes")
levels(dat$ScrGuide)  <-c("No", "Yes")

# Demographics and other variables not used for models
label(dat$Age_at_Survey)         <- "Age in years"
label(dat$gender)          <- "Sex"
label(dat$BMI_2cat)        <- "BMI"
label(dat$HMbike)          <- "Number of bikes at home"
label(dat$HMcars)          <- "Number of cars at home"
label(dat$tsdecision)      <- "Who decides how you travel to school?"
label(dat$NZDepCat3)       <- "NZ Deprivation Category"
label(dat$PAGuideQ)        <- "Meets physical activity guidelines"
label(dat$ScrGuide)        <- "Meets screen time guidelines"
label(dat$hsiblings )      <- "Number of siblings at home"
label(dat$whodecides)      <- "Who decides how you travel"
label(dat$school_decile_n) <- "School decile"
label(dat$NEStConnect)     <- "Connectivity"
label(dat$NGEsthetics)     <- "Aesthetics"

label(dat$ATS_f)           <- "Mode of travel to school"
label(dat$Dist2School)     <- "Distance to school from home"
label(dat$BMI_f)           <- "BMI"
label(dat$BMI_4cat)        <- "Body Mass Index"
label(dat$eth3)            <- "Ethnic category"

dat$ID <- as.numeric(as.character(dat$studyID1))
dat$school <- factor(dat$school,
                     labels=c("Bayfield", "Columba", "John McGlashan",
                              "Kaikorai", "Kavanagh", "Kings", "Logan Park",
                              "Otago Boys", "Otago Girls", "Queens",
                              "St. Hilda's", "Taeri"))
label(dat$school) <- "School"

ats.vars <- c("ID", "school", "ATS_f", "gender",
              "BMI_f", "BMI_2cat",
              "HMcars", "NZDepCat3", "PAGuideQ",
              "ScrGuide", "whodecides",
              "schiclose",
              "Dist2School",
              "siblings", "Age_at_Survey", "school_decile_n",
              "interesting", "pleasant", "boring",
              "healthy", "useful", "safe", "exercise", "onway", "time",
              "stuff", "sched", "planning", "sweaty", "unsafe", "tired",
              "desire", "confd", "control", "intention", "adults", "n_cars",
              "parents_walk", "parents_safe","parents_say", "friends_say",
              "school_says", "cool", "friends_dont", "weather", "boring_r",
              "hills", "regwalk",
              "NEStConnect", "NGEsthetics",
              "eth3",
              "TscWalk", "TscCarOth", "TscCarMy", "TscBusPub", "TscBusSc",
              "TSlike", "ATS", "BMI_4cat", "cars3", "tsdecision")

w2s_env <- c( "NEStConnect", "NGEsthetics")

#outs <- dat$Dist2School > 8000 & dat$ATS_f =="Walk" # Remove implausible values
#dat  <- dat[!outs, ]

# Subset the data object to contain only the variables of interest
dat.ats <- dat[, ats.vars]

dat.full <- dat[complete.cases(dat$Dist2School, dat$ATS_f),
                c("Dist2School", "ATS_f") ]
#cutoff <- 4800
cutoff <- 8000

#dat.ats <- dat.ats[ dat.ats$Dist2School <= cutoff, ]

