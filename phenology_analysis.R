#### load packages ####

library(lme4); library(lme4)

#### load the data ####

setwd('C:/Users/Penguin/Dropbox/r-projects/compressed phenology/')

colony.data <- readRDS("colony.data.Rds")
flg.morph.data <- readRDS("flg.morph.data.Rds")
flg.recruit.data <- readRDS("flg.recruit.data.Rds")

####
#### colony trends ####
####

# median hatch dates
hmod.w <- lm(MedianHatch ~ BookYear,
             data = colony.data,
             weights = log(nHatched))
summary(hmod.w)
confint(hmod.w)

# median fledge dates
fmod.w <- lm(MedianFledge ~ BookYear,
             data = colony.data,
             weights = log(nFledged))
summary(fmod.w)
confint(fmod.w)

# nestling duration
nmod.w <- lm(MedianNestlingDur ~ BookYear,
             data = colony.data,
             weights = log(nHatched))
summary(nmod.w)
confint(nmod.w) 

####
#### fledgling morphology ####
####

# mass
wtx <- lmer(WT ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.raw, REML=F)
wtx.nox <- lmer(WT ~ AgeLastMeas + BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
wtx.age <- lmer(WT ~ AgeLastMeas + (1|NestSummSeq), data = flg.raw, REML=F)
wtx.yr <- lmer(WT ~ BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
wtx.null <- lmer(WT ~ 1 + (1|NestSummSeq), data = flg.raw, REML=F)

AIC()
summary()

# bill depth
bdx <- lmer(BD ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.raw, REML=F)
bdx.nox <- lmer(BD ~ AgeLastMeas + BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
bdx.age <- lmer(BD ~ AgeLastMeas + (1|NestSummSeq), data = flg.raw, REML=F)
bdx.yr <- lmer(BD ~ BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
bdx.null <- lmer(BD ~ 1 + (1|NestSummSeq), data = flg.raw, REML=F)

AIC()
summary()

# bill length
blx <- lmer(BL ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.raw, REML=F)
blx.nox <- lmer(BL ~ AgeLastMeas + BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
blx.age <- lmer(BL ~ AgeLastMeas + (1|NestSummSeq), data = flg.raw, REML=F)
blx.yr <- lmer(BL ~ BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
blx.null <- lmer(BL ~ 1 + (1|NestSummSeq), data = flg.raw, REML=F)

AIC()
summary()

# flipper
flx <- lmer(FL ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.raw, REML=F)
flx.nox <- lmer(FL ~ AgeLastMeas + BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
flx.age <- lmer(FL ~ AgeLastMeas + (1|NestSummSeq), data = flg.raw, REML=F)
flx.yr <- lmer(FL ~ BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
flx.null <- lmer(FL ~ 1 + (1|NestSummSeq), data = flg.raw, REML=F)

AIC()
summary()

# foot
ftx <- lmer(FT ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.raw, REML=F)
ftx.nox <- lmer(FT ~ AgeLastMeas + BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
ftx.age <- lmer(FT ~ AgeLastMeas + (1|NestSummSeq), data = flg.raw, REML=F)
ftx.yr <- lmer(FT ~ BookYear + (1|NestSummSeq), data = flg.raw, REML=F)
ftx.null <- lmer(FT ~ 1 + (1|NestSummSeq), data = flg.raw, REML=F)

AIC()
summary()

# smi
smx <- lmer(smi ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg, REML=F)
smx.nox <- lmer(smi ~ AgeLastMeas + BookYear + (1|NestSummSeq), data = flg, REML=F)
smx.age <- lmer(smi ~ AgeLastMeas + (1|NestSummSeq), data = flg, REML=F)
smx.yr <- lmer(smi ~ BookYear + (1|NestSummSeq), data = flg, REML=F)
smx.null <- lmer(smi ~ 1 + (1|NestSummSeq), data = flg, REML=F)

AIC()
summary()

# down

dwx <- glmer(cbind(DWN, 4-DWN) ~ AgeLastMeas*c(BookYear-2000) + (1|NestSummSeq), 
             data = down, family = 'binomial')
dwx.nox <- glmer(cbind(DWN, 4-DWN) ~ AgeLastMeas + c(BookYear-2000) + (1|NestSummSeq), 
             data = down, family = 'binomial')
dwx.age <- glmer(cbind(DWN,4-DWN) ~ AgeLastMeas + (1|NestSummSeq), 
             data = down, family = 'binomial') 
dwx.yr <- glmer(cbind(DWN, 4-DWN) ~ c(BookYear-2000) + (1|NestSummSeq), 
             data = down, family = 'binomial')
dwx.null <- glmer(cbind(DWN, 4-DWN) ~ 1 + (1|NestSummSeq), 
             data = down, family = 'binomial')

AIC()
summary()

####
#### fledgling survival ####
####

wtr <- glmer(RecruitYN ~ WT + (1|BookYear), data=morph, family='binomial')
summary(wtr); confint(wtr)

blr <- glmer(RecruitYN ~ BL + (1|BookYear), data=morph, family='binomial')
summary(blr); confint(blr)

bdr <- glmer(RecruitYN ~ BD + (1|BookYear), data=morph, family='binomial')
summary(bdr); confint(bdr)

flr <- glmer(RecruitYN ~ FL + (1|BookYear), data=morph, family='binomial')
summary(flr); confint(flr)

ftr <- glmer(RecruitYN ~ FT + (1|BookYear), data=morph, family='binomial')
summary(ftr); confint(ftr)

smr <- glmer(RecruitYN ~ smi + (1|BookYear), data=morph, family='binomial')
summary(smr); confint(smr)

dwr <- glmer(RecruitYN ~ DWN + (1|BookYear), data=down.comp, family='binomial')
summary(dwr); confint(dwr)

AIC(wtr,blr,bdr,flr,ftr,smr)

flgN1.mix.f5 <- glmer(RecruitYN ~ DateChickAQIN1 + (1|BookYear), data = flg5, family='binomial')
summary(flgN1.mix.f5) # p = 0.17
confint(flgN1.mix.f5)

flgAge <- glmer(RecruitYN ~ AgeLastAQI + (1|BookYear), ## THIS IS WHAT IS IN THE ECOLOGY PAPER REVISIONS JAN 2021, FLG5
                data = flg5, family = 'binomial')
summary(flgAge)
confint(flgAge)
