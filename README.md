# tombo-phenology

Data and code from Cappello and Boersma 2021 Ecology

This repository mirrors the Zenodo archive ()

Cappello, C. D., and Boersma, P. D. 2021. Consequences of phenological shifts and a compressed breeding period in Magellanic penguins. Ecology. 

_Contact for questions about this dataset:_  
Caroline D. Cappello  
Email: ccappell@uw.edu  
ORCID: https://orcid.org/0000-0002-2687-4019  

_Alternative contact:_   
pengasst@uw.edu

### abstract

Phenological shifts may ameliorate negative effects of climate change or create carry-over effects and mismatches that decrease fitness. Identifying how phenological shifts affect performance is critical for understanding how individuals and populations will respond to climate change, but requires long-term, longitudinal data. Using 34 years of data from the Magellanic penguin (Spheniscus magellanicus) colony at Punta Tombo, Argentina, we examined the consequences of the delayed onset of breeding (i.e. arrival and egg-laying dates) that has occurred at the colony since 1983. To understand how the delay propagates through the rest of the reproductive cycle, we identified phenological trends in hatch and fledge dates. Median hatch dates were 0.29 days later each year, amounting to a 10-day shift over the course of the study. Median fledge dates did not shift over the 34-year period however, thus shortening the median nestling period duration by 14%. We tested several predictions regarding performance outcomes of the compressed nestling period, finding that later-hatched chicks fledged significantly younger than earlier-hatched chicks, and that younger fledglings left the colony with smaller bills and with more chick down. Interestingly, although younger chicks fledged significantly lighter and in worse body condition than older fledglings early in the study, this trend reversed over time, with younger chicks actually fledging heavier and in better body condition in more recent years. Smaller and lighter fledglings were less likely to recruit to the colony as adults. We find that delayed breeding has significantly compressed nestling periods at Punta Tombo, influencing chick growth and fledgling condition. These findings highlight the importance of studying phenology across multiple life events to fully understand the consequences of phenological shifts for organismal fitness.  

### description of the data tables

#### colony.data

BookYear = year at the beginning of the breeding season  
MedianHatch = Median hatch date, presented as days since November 1st  
nHatch = Number of chicks used for median hatch date  
MedianFledge = Median fledge date (date at which 50% of chicks had fledged), presented as days since November 1st  
nFledged = Number of chicks used for median fledge date  
MedianNestlingDur = Median nestling duration  


#### flg.morph.data

BookYear = year at the beginning of the breeding season  
ChickSummSeq = individual chick identifier  
AgeLastMeas = age when fledgling was last measured  
MS = Mass (kg) of chick at last measure  
BL = Bill length (cm) at last measure  
BD = Bill depth (cm) at last measure  
FL = Flipper length (cm) at last measure   
FT = Foot length (cm) at last measure  
smi = scaled mass index of flipper length on mass, see manuscript for equation  
DWN = Down cover at last measure (no down = 0, one-quarter covered = 1, two-quarters covered = 2, three-quarters covered = 3, completely covered = 4)  
NestSummSeq = individual nest identifier  

#### flg.morph.data

BookYear = year at the beginning of the breeding season  
ChickSummSeq = individual chick identifier  
RecruitYN = was the fledgling seen again at Punta Tombo as a juvenile or adult (yes=1, no=0)  
FlgDate = date fledgling was last seen in its nest, presented as days since November 1st  
FlgAge = age of fledgling when it was last seen in its nest    
MS = Mass (kg) of chick at last measure  
BL = Bill length (cm) at last measure  
BD = Bill depth (cm) at last measure  
FL = Flipper length (cm) at last measure   
FT = Foot length (cm) at last measure  
smi = scaled mass index of flipper length on mass, see manuscript for equation    
DWN = Down cover at last measure (no down = 0, one-quarter covered = 1, two-quarters covered = 2, three-quarters covered = 3, completely covered=4)  


_end_