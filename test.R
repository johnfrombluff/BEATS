source('data-setup.R')
require(rms)
options( contrasts=c('contr.treatment', 'contr.treatment'))
dat.m <- dat[ complete.cases(dat$Include), ]
m.ddist <- datadist(dat.m)
options(datadist='m.ddist')
sink(file='test.txt', append=FALSE)

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(HMcars), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSpsh), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSpunsafe), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSpwalk), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Dparents), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Dparentsenjoy), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(health), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAint), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAnice), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAstim), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAnice), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAhealthy), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAgood), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAuseful), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSAsafe), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCSone), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSexercise), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSchat), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSfsh), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbfri), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbcool), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSf5ws), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSeschool), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbwant), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WStired), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSno), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbstuff), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbsweat), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbplan), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbsched), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSblocker), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Dlikedriven), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F1_esthetics), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F2_trafficped), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F3_landuseaccess), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F4_resdensity), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F5_trafficsafety), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F6_personalsafety), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F7_connectivity), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F8_footpaths), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(F9_hills), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(schoolsize), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbdist), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WStime), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbsafe), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSbfootp), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCSlights), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCStraffic), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCScross), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCSdogs), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCShills), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCSrbor), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TSlike), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(tsdecision), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WScontrol), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSintend), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSwant), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WSconf), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WS2wks), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Icardrive), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Icarown), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(scsib), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(hpeople), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(hadults), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(hsiblings), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(raincoat), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(schwho), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(schiclose), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(WCSdogs), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgCarMy), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgCarOth), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgWalk), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgBike), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgSkateb), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgScooter), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgBusPub), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgTaxi), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgPref), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(TgPrefR), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Dptuse), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Datuse), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Dbadenv), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(Dcarbadenv), x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + NZDepCat, x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + eth3, x=T, y=T, data=dat.m ), dat.m$school))

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + BMI_2cat_Overweight, x=T, y=T, data=dat.m ), dat.m$school))

sink()

print(robcov(lrm(ATS_f ~ Dist2School + gender + Age_at_Survey + as.numeric(HMcars) + as.numeric(WSpsh) + as.numeric(WSpunsafe) + as.numeric(WSpwalk) + as.numeric(WSAint) + as.numeric(WSAnice) + as.numeric(WSAstim) + as.numeric(WSAnice) + as.numeric(WSAgood) + as.numeric(WSAuseful) + as.numeric(WSAsafe) + as.numeric(WCSone) + as.numeric(WSchat) + as.numeric(WSfsh) + as.numeric(WSbfri) + as.numeric(WSf5ws) + as.numeric(WSbwant) + as.numeric(WStired) + as.numeric(WSno) + as.numeric(WSbstuff) + as.numeric(WSbsweat) + as.numeric(WSbplan) + as.numeric(WSbsched) + as.numeric(Dlikedriven) + as.numeric(F3_landuseaccess) + as.numeric(WSbdist) + as.numeric(WStime) + as.numeric(WSbsafe) + as.numeric(WSbfootp) + as.numeric(WCShills) + as.numeric(WCSrbor) + as.numeric(TSlike) + as.numeric(WScontrol) + as.numeric(WSintend) + as.numeric(WSwant) + as.numeric(WSconf) + as.numeric(WS2wks) + as.numeric(Icardrive) + as.numeric(Icarown) + as.numeric(hsiblings) + as.numeric(raincoat) + as.numeric(TgCarOth) + as.numeric(TgWalk) + as.numeric(TgPref) + as.numeric(TgPrefR) + as.numeric(Datuse), x=T, y=T, data=dat.m ), cluster=dat.m$school))
