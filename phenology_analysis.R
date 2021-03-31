#### load packages ####

library(lme4)
library(tidyverse)

#### load the data ####

load("phenology_data.RData")

####
#### colony trends ####
####

# median hatch dates
hmod.w <- lm(MedianHatch ~ BookYear, data = colony.data, weights = log(nHatched))
summary(hmod.w)
confint(hmod.w)

# median fledge dates
fmod.w <- lm(MedianFledge ~ BookYear, data = colony.data, weights = log(nFledged))
summary(fmod.w)
confint(fmod.w)

# nestling duration
nmod.w <- lm(MedianNestlingDur ~ BookYear, data = colony.data, weights = log(nHatched))
summary(nmod.w)
confint(nmod.w) 

####
#### fledgling morphology ####
####

# mass
ms.x <- lmer(Weightkg ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.nox <- lmer(Weightkg ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.age <- lmer(Weightkg ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.yr <- lmer(Weightkg ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ms.null <- lmer(Weightkg ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(ms.x,ms.nox,ms.age,ms.yr,ms.null)
summary(ms.x)

# bill length
bl.x <- lmer(BillLength ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.nox <- lmer(BillLength ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.age <- lmer(BillLength ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.yr <- lmer(BillLength ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bl.null <- lmer(BillLength ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(bl.x,bl.nox,bl.age,bl.yr,bl.null)
summary(bl.nox)

# bill depth
bd.x <- lmer(BillDepth ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.nox <- lmer(BillDepth ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.age <- lmer(BillDepth ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.yr <- lmer(BillDepth ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
bd.null <- lmer(BillDepth ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(bd.x,bd.nox,bd.age,bd.yr,bd.null)
summary(bd.age)

# flipper
fl.x <- lmer(Flipper ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.nox <- lmer(Flipper ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.age <- lmer(Flipper ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.yr <- lmer(Flipper ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
fl.null <- lmer(Flipper ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(fl.x, fl.nox, fl.age, fl.yr, fl.null)

# foot
ft.x <- lmer(Foot ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.nox <- lmer(Foot ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.age <- lmer(Foot ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.yr <- lmer(Foot ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
ft.null <- lmer(Foot ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(ft.x, ft.nox, ft.age, ft.yr, ft.null)
summary(ft.x)

# scaled mass index
sm.x <- lmer(smi ~ AgeLastMeas*c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.nox <- lmer(smi ~ AgeLastMeas + c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.age <- lmer(smi ~ AgeLastMeas + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.yr <- lmer(smi ~ c(BookYear-1900) + (1|NestSummSeq), data = flg.morph.data, REML=F)
sm.null <- lmer(smi ~ 1 + (1|NestSummSeq), data = flg.morph.data, REML=F)

AIC(sm.x, sm.nox, sm.age, sm.yr, sm.null)
summary(sm.x)

# down cover
dw.x <- glmer(cbind(Down, 4-Down) ~ AgeLastMeas*c(BookYear-2000) + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(Down)), family = 'binomial')
dw.nox <- glmer(cbind(Down, 4-Down) ~ AgeLastMeas + c(BookYear-2000) + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(Down)), family = 'binomial')
dw.age <- glmer(cbind(Down,4-Down) ~ AgeLastMeas + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(Down)), family = 'binomial') 
dw.yr <- glmer(cbind(Down, 4-Down) ~ c(BookYear-2000) + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(Down)), family = 'binomial')
dw.null <- glmer(cbind(Down, 4-Down) ~ 1 + (1|NestSummSeq), 
             data = filter(flg.morph.data, !is.na(Down)), family = 'binomial')

AIC(dw.x,dw.nox,dw.age,dw.yr,dw.null)
summary(dw.age)

####
#### fledgling survival ####
####

# mass
msr <- glmer(RecruitYN ~ Weightkg + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(msr)
confint(msr)

# bill length
blr <- glmer(RecruitYN ~ BillLength + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(blr)
confint(blr)

# bill depth
bdr <- glmer(RecruitYN ~ BillDepth + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(bdr)
confint(bdr)

# flipper
flr <- glmer(RecruitYN ~ Flipper + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(flr)
confint(flr)

# foot
ftr <- glmer(RecruitYN ~ Foot + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(ftr)
confint(ftr)

# scaled mass index
smr <- glmer(RecruitYN ~ smi + (1|BookYear), data=flg.recruit.data, family='binomial')
summary(smr)
confint(smr)

# compare morphometric models
arrange(AIC(msr,blr,bdr,flr,ftr,smr), AIC) %>% 
  mutate(deltaAIC = AIC-min(AIC))

# down cover
dwr <- glmer(RecruitYN ~ Down + (1|BookYear), 
             data=filter(flg.recruit.data, !is.na(Down)),
             family='binomial')
summary(dwr)
confint(dwr)

# fledge date
dater <- glmer(RecruitYN ~ FlgDate + (1|BookYear), 
                      data = flg.recruit.data, family='binomial')
summary(dater) 
confint(dater)

# fledge age
ager <- glmer(RecruitYN ~ FlgAge + (1|BookYear), 
                data = flg.recruit.data, family = 'binomial')
summary(ager)
confint(ager)
