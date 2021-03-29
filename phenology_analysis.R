#### load packages ####

library(lme4)
library(tidyverse)

#### load the data ####

#setwd('C:/Users/Penguin/Dropbox/r-projects/compressed phenology/')

colony.data <- readRDS("colony.data.Rds")
flg.morph.data <- readRDS("flg.morph.data.Rds")
colnames(flg.morph.data)[3] <- "AgeLastMeas"
flg.recruit.data <- readRDS("flg.recruit.data.Rds")

#write.csv(colony.data, "colony.data.csv", row.names = FALSE)
#write.csv(flg.morph.data, "flg.morph.data.csv", row.names = FALSE)
#write.csv(flg.recruit.data, "flg.recruit.data.csv", row.names = FALSE)


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
nmod.w2 <- lm(MedianNestlingDur ~ BookYear,
              data = colony.data,
              weights = log(nFledged))
summary(nmod.w)
summary(nmod.w2)
confint(nmod.w) 
confint(nmod.w2)

####
#### fledgling morphology ####
####

# mass
ms.x <- lmer(WT ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.nox <- lmer(WT ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.age <- lmer(WT ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.yr <- lmer(WT ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.null <- lmer(WT ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(ms.x,ms.nox,ms.age,ms.yr,ms.null)
summary(ms.x)

# bill length
bl.x <- lmer(BL ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.nox <- lmer(BL ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.age <- lmer(BL ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.yr <- lmer(BL ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.null <- lmer(BL ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(bl.x,bl.nox,bl.age,bl.yr,bl.null)
summary(bl.nox)

# bill depth
bd.x <- lmer(BD ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.nox <- lmer(BD ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.age <- lmer(BD ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.yr <- lmer(BD ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.null <- lmer(BD ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(bd.x,bd.nox,bd.age,bd.yr,bd.null)
summary(bd.age)

# flipper
fl.x <- lmer(FL ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.nox <- lmer(FL ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.age <- lmer(FL ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.yr <- lmer(FL ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.null <- lmer(FL ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(fl.x, fl.nox, fl.age, fl.yr, fl.null)


# foot
ft.x <- lmer(FT ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.nox <- lmer(FT ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.age <- lmer(FT ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.yr <- lmer(FT ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.null <- lmer(FT ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(ft.x, ft.nox, ft.age, ft.yr, ft.null)
summary(ft.x)

# smi
sm.x <- lmer(smi ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.nox <- lmer(smi ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.age <- lmer(smi ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.yr <- lmer(smi ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.null <- lmer(smi ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(sm.x, sm.nox, sm.age, sm.yr, sm.null)
summary(sm.x)

# down

test <- na.omit(flg.morph.data)

dw.x <- glmer(cbind(DWN, 4-DWN) ~ AgeLastMeas*c(BookYear-2000) + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(DWN)), family = 'binomial')
dw.nox <- glmer(cbind(DWN, 4-DWN) ~ AgeLastMeas + c(BookYear-2000) + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(DWN)), family = 'binomial')
dw.age <- glmer(cbind(DWN,4-DWN) ~ AgeLastMeas + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(DWN)), family = 'binomial') 
dw.yr <- glmer(cbind(DWN, 4-DWN) ~ c(BookYear-2000) + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(DWN)), family = 'binomial')
dw.null <- glmer(cbind(DWN, 4-DWN) ~ 1 + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(DWN)), family = 'binomial')

AIC(dw.x,dw.nox,dw.age,dw.yr,dw.null)
summary(dw.age)

head(flg.morph.data)

####
#### fledgling survival ####
####

wtr <- glmer(RecruitYN ~ WT + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(wtr)
confint(wtr)

blr <- glmer(RecruitYN ~ BL + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(blr)
confint(blr)

bdr <- glmer(RecruitYN ~ BD + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(bdr)
confint(bdr)

flr <- glmer(RecruitYN ~ FL + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(flr)
confint(flr)

ftr <- glmer(RecruitYN ~ FT + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(ftr)
confint(ftr)

smr <- glmer(RecruitYN ~ smi + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(smr)
confint(smr)

dwr <- glmer(RecruitYN ~ DWN + (1|BookYear), data=filter(flg.recruit.data, !is.na(DWN)),
             family='binomial')
summary(dwr)
confint(dwr)

arrange(AIC(wtr,blr,bdr,flr,ftr,smr), AIC) %>% 
  mutate(deltaAIC = AIC-min(AIC))

flgN1.mix.f5 <- glmer(RecruitYN ~ FlgDate + (1|BookYear), data = flg.recruit.data, family='binomial')
summary(flgN1.mix.f5) # p = 0.17
confint(flgN1.mix.f5)

flgAge <- glmer(RecruitYN ~ FlgAge + (1|BookYear), ## THIS IS WHAT IS IN THE ECOLOGY PAPER REVISIONS JAN 2021, FLG5
                data = flg.recruit.data, family = 'binomial')
summary(flgAge)
confint(flgAge)
