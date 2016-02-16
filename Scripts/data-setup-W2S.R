getLab <- function(dat, var) {require(stringr); str_trim(attributes(dat)$variable.labels[grepl(paste0("^",var,"$"), attributes(dat)$names)]) }

dat$ATS_f <- dat$ATvsOther; levels(dat$ATS_f) <-c("Don't walk", "Walk")
attributes(dat)$variable.labels[length(attributes(dat)$variable.labels)+1] <- "Walking vs. any other mode"

require( car )
dat$whodecides <- recode(  dat$tsdecision, "'My parents'='Other(s)'; 'School'='Other(s)'")
#dat$BMI_f      <- ordered( recode(dat$BMI_4cat, "1=0;2=1;3=2"), labels=c("Normal", "Overweightl", "Obese") )
dat$BMI_f      <- ordered( recode(dat$BMI_4cat, " 'Underweight'='Normal Weight' ") )
dat$cars3 <- ordered(recode( dat$HMcars,"'Two'='Two or more'; 'Three'='Two or more'; 'Four or more'='Two or more'" ) )
dat$BMI_f <- factor(dat$BMI_2cat, labels=c("Healthy", "Unhealthy") )
detach(package:car)

require( rms )

label(dat$cars3) <- "Number of cars at home"
levels(dat$NZDepCat3) <- c("High", "Med", "Low")

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
dat$weather       <- as.numeric(dat$WSbweather); label(dat$weather )     <- "The weather is too bad"
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
levels(dat$PAGuideQ)  <-c("No", "Yes")
levels(dat$ScrGuide)  <-c("No", "Yes")

# Demographics and other variables not used for mo1els
label(dat$WSno)            <- "I often can't be bothered to walk to school"
label(dat$WCSrbor)         <- "The route is boring along the way"
label(dat$WSintend)        <- "How often do you intend to walk to school?"
label(dat$WS2wks)          <- "Number of times walked to school in the last two weeks"


label(dat$Age_at_Survey)   <- "Age in years"
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
label(dat$Dist2School_GoogleMaps)     <- "Distance to school (GM)"
label(dat$Dist2School_GIS)     <- "Distance to school (GIS)"
label(dat$BMI_f)           <- "BMI"
label(dat$BMI_4cat)        <- "Body Mass Index"
label(dat$eth3)            <- "Ethnic category"
label(dat$TscWalk)             <- "Travel to School: Walk"
label(dat$TscCarOth)           <- "Travel to School: Car (others)"
label(dat$TscCarMy)            <- "Travel to School: Car (mine)"
label(dat$TscBusPub)           <- "Travel to School: Bus (public)"
label(dat$TscBusSc)            <- "Travel to School: Bus (school"
label(dat$TSlike)              <- "Do you like the way you usually travel to school?"
label(dat$BMI_4cat)            <- "BMI (4 categories)"
label(dat$cars3)               <- "Cars at home (3 categories)"
dat$ID <- as.numeric(as.character(dat$studyID1))
dat$school <- factor(dat$school,
                     labels=c("Bayfield", "Columba", "John McGlashan",
                              "Kaikorai", "Kavanagh", "Kings", "Logan Park",
                              "Otago Boys", "Otago Girls", "Queens",
                              "St. Hilda's", "Taeri"))
label(dat$school) <- "School"

ats_vars <- c( 'school', 'ATS_f', 'ATvsOther', 'Dist2School_GIS', 'gender', 'Age_at_Survey', 'HMcars', 'WSpsh', 'WSpunsafe', 'WSAint', 'WSAstim', 'WSAgood', 'WSAuseful', 'WSAsafe', 'WCSone', 'WSchat', 'WSfsh', 'WSbfri', 'WSf5ws', 'WSbwant', 'WStired', 'WSno', 'WSbstuff', 'WSbsweat', 'WSbplan', 'WSbsched', 'F3_landuseaccess', 'WSbdist', 'WStime', 'WSbfootp', 'WCShills', 'TSlike', 'WSpwalk', 'WSAnice', 'WSexercise', 'WSbsafe', 'WCStraffic', 'WCScross', 'WCSrbor', 'WSbweather', 'WCSlights', 'WSbcool')

# Subset the data object to contain only the variables of interest
#dat.ats <- dat[ dat$boarder2 == "Not a boarder", ats.vars]
cutoff <- 8000

# Remove implausible cases
outs <- dat$Dist2School > cutoff & dat$ATS_f =="Walk"
#dat  <- dat[!outs, ]

#dat.ats <- dat[ dat$boarder == 1, ]
#dat.full <- dat[complete.cases(dat$Dist2School, dat$ATS_f),
#                c("Dist2School", "ATS_f") ]

dat.ats <- dat[ , ats_vars]


#rm(dat.ats, dat.full, dat, cutoff, outs, ats.vars)

#dat.ats <- dat.ats[ dat.ats$Dist2School <= cutoff, ]
#dat.ats <- dat.ats[ complete.cases(dat.ats$W2S, dat.ats$Dist, dat.ats$School
    #, dat.ats$parents_safe, dat.ats$parents_say, dat.ats$NEStConnect
    #, dat.ats$NGEsthetics
#    ), ]

rm(cutoff, outs)
