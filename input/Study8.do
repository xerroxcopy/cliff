clear

. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/Study8.xlsx", sheet("analysis") firstrow


sum subj // N = 91

/* variables:
dcb = declining creativity beliefs 
tp = task persistence 
count = number of ideas generated (i.e., productivity)
creatavgtop25 = number of ideas generated rated in the top 25% of all ideas
creatavg = average creativity 
win = desire to win
training = years of training in comedy 
experience = years of experience in the comedy industry
*/

*GENERATE these variables for analysis 
egen dcb = rowmean(creatbelief_1 creatbelief_2 creatbelief_3) // declining creativity beliefs 
alpha creatbelief_1 creatbelief_2 creatbelief_3 // alpha = .84
gen tp = time / 60 // task persistence (in minutes) 

*demographics
sum age training experience 
tab gender

*MAIN TEXT ANALYSES 

* Table 1. Correlations
sum dcb tp count creatavgtop25 creatavg 
pwcorr dcb tp count creatavgtop25 creatavg, obs sig // M's and SD's for Table 1

*Simple Path Models
regress tp dcb // creativity belief -> task persistence
regress tp dcb, beta

regress count tp dcb // DV = productivity 
regress count tp dcb, beta
regress creativity_top25 tp dcb // DV = highly creative ideas 
regress creativity_top25 tp dcb, beta
regress creativity tp dcb // DV = average creativity 
regress creativity tp dcb, beta

*Correlated Performance Outcomes
regress count tp dcb creativity_top25 creativity // DV = productivity 
regress count tp dcb creativity_top25 creativity, beta
regress creativity_top25 tp dcb count creativity // DV = highly creative ideas 
regress creativity_top25 tp dcb count creativity, beta
regress creativity tp dcb count creativity_top25 // DV = average creativity 
regress creativity tp dcb count creativity_top25, beta



*SUPPLEMENTAL ANALYSES

*Controlling for desire to win, training, experience (Table S1, S2)
sum win training experience
pwcorr dcb tp count creatavgtop25 creatavg win training experience, obs sig 
regress tp dcb 
regress tp dcb win
regress tp dcb training 
regress tp dcb experience
regress tp dcb win training experience
regress count tp dcb 
regress count tp dcb win
regress count tp dcb training 
regress count tp dcb experience
regress count tp dcb win training experience
regress creatavgtop25 tp dcb 
regress creatavgtop25 tp dcb win 
regress creatavgtop25 tp dcb training
regress creatavgtop25 tp dcb experience
regress creatavgtop25 tp dcb training experience 
regress creatavg tp dcb 
regress creatavg tp dcb win 
regress creatavg tp dcb training
regress creatavg tp dcb experience
regress creatavg tp dcb win training experience 

*Main analyses with presentation order moderator (SI "Study 8: Presentation order moderation analyses")  
regress tp c.dcb##i.cond // n.s. moderation (but main effect of tp gets stronger)
regress tp c.dcb##i.cond, beta
regress count c.tp##i.cond dcb // n.s. moderation
regress count c.tp##i.cond dcb, beta
regress creatavgtop25 c.tp##i.cond dcb // n.s. moderation
regress creatavgtop25 c.tp##i.cond, beta
regress creatavg c.tp##i.cond dcb // n.s. moderation (but the main effect of tp gets stronger) 
regress creatavg c.tp##i.cond dcb, beta
regress count c.tp##i.cond dcb creatavgtop25 creatavg // n.s. moderation 
regress count c.tp##i.cond dcb creatavgtop25 creatavg, beta
regress creatavgtop25 c.tp##i.cond dcb count creatavg // n.s. moderation 
regress creatavgtop25 c.tp##i.cond dcb count creatavg, beta 
regress creatavg c.tp##i.cond dcb count creatavgtop25 // n.s. moderation  
regress creatavg c.tp##i.cond dcb count creatavgtop25, beta
regress creatavg tp dcb count creatavgtop25 if cond == 1 
regress creatavg tp dcb count creatavgtop25 if cond == 1, beta
regress creatavg tp dcb count creatavgtop25 if cond == 2 
regress creatavg tp dcb count creatavgtop25 if cond == 2, beta







