# tombo-phenology

Data and code from Cappello and Boersma 2021 Ecology

Cappello, C. D., and Boersma, P. D. 2021. Consequences of phenological shifts and a compressed breeding period in Magellanic penguins. Ecology. 

Contact for questions about this dataset:  
Caroline Cappello  
Email: ccappell@uw.edu  
ORCID: https://orcid.org/0000-0002-2687-4019  
Alternative contact: pengasst@uw.edu

### abstract

Phenological shifts may ameliorate negative effects of climate change or create carry-over effects and mismatches that decrease fitness. Identifying how phenological shifts affect performance is critical for understanding how individuals and populations will respond to climate change, but requires long-term, longitudinal data. Using 34 years of data from the Magellanic penguin (Spheniscus magellanicus) colony at Punta Tombo, Argentina, we examined the consequences of the delayed onset of breeding (i.e. arrival and egg-laying dates) that has occurred at the colony since 1983. To understand how the delay propagates through the rest of the reproductive cycle, we identified phenological trends in hatch and fledge dates. Median hatch dates were 0.29 days later each year, amounting to a 10-day shift over the course of the study. Median fledge dates did not shift over the 34-year period however, thus shortening the median nestling period duration by 14%. We tested several predictions regarding performance outcomes of the compressed nestling period, finding that later-hatched chicks fledged significantly younger than earlier-hatched chicks, and that younger fledglings left the colony with smaller bills and with more chick down. Interestingly, although younger chicks fledged significantly lighter and in worse body condition than older fledglings early in the study, this trend reversed over time, with younger chicks actually fledging heavier and in better body condition in more recent years. Smaller and lighter fledglings were less likely to recruit to the colony as adults. We find that delayed breeding has significantly compressed nestling periods at Punta Tombo, influencing chick growth and fledgling condition. These findings highlight the importance of studying phenology across multiple life events to fully understand the consequences of phenological shifts for organismal fitness.  

### description of the data tables

These tables are a subset of data collected during the long-term study at Punta Tombo, 
Chubut, Argentina, beginning in 1983.

#### colony.data

BookYear = The starting year of a breeding season. Breeding seasons span from September 1st to August 31st of the following year  
MedianHatch = Median hatch date, presented as days since November 1st  
nHatch = Number of chicks used for median hatch date  
MedianFledge = Median fledge date (date at which 50% of chicks had fledged), presented as days since November 1st  
nFledged = Number of chicks used for median fledge date  
MedianNestlingDur = Median nestling duration  


#### flg.morph.data

BookYear = The starting year of a breeding season. Breeding seasons span from September 1st to August 31st of the following year   
ChickSummSeq = Individual chick ID  
AgeLastMeas = Age when fledgling was last measured  
Weightkg = Mass kg of chick at last measure  
BillLength = Bill length cm (length of exposed culmen) at last measure      
BillDepth = Bill depth cm (vertical thickness, measured at the nares) at last measure  
Flipper = Flipper length cm (elbow joint to tip of flipper) at last measure    
Foot = Foot length cm (heel to tip of middle toe) at last measure  
smi = Scaled mass index is a body condition score derived from flipper length and mass. See manuscript for equation  
Down = Down cover at last measure (0 = no down, 1 = 1/4 of body with down, 2 = 2/4 
of body with down, 3 = 3/4 of body with down, 4 = fully covered w/ down)   
NestSummSeq = Individual nest ID  

#### flg.morph.data

BookYear = The starting year of a breeding season. Breeding seasons span from September 1st to August 31st of the following year  
ChickSummSeq = individual chick ID  
RecruitYN = Was the fledgling seen again at Punta Tombo as a juvenile or adult? (yes=1, no=0)  
FlgDate = Date fledgling was last seen in its nest, presented as days since November 1st  
FlgAge = Age of fledgling when it was last seen in its nest    
Weightkg = Mass kg of chick at last measure  
BillLength = Bill length cm (length of exposed culmen) at last measure      
BillDepth = Bill depth cm (vertical thickness, measured at the nares) at last measure  
Flipper = Flipper length cm (elbow joint to tip of flipper) at last measure    
Foot = Foot length cm (heel to tip of middle toe) at last measure  
smi = Scaled mass index is a body condition score derived from flipper length and mass. See manuscript for equation  
Down = Down cover at last measure (0 = no down, 1 = 1/4 of body with down, 2 = 2/4
of body with down, 3 = 3/4 of body with down, 4 = fully covered w/ down)   

