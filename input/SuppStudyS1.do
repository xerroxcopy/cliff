clear

. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/SuppStudyS1.xlsx", sheet("analysis") firstrow


drop if attention_TEXT  != 3
sum subj // N=303, n=279

sum age
tab gender

// CONDS: 0 = other-prediction, 1 = self-prediction

reshape long p, i(subj) j(time)
egen zp = std(p) // standardize predictions

table condself time, c(mean zp sd zp n zp) // means table
regress zp c.time, cluster(subj) // linear slope
regress zp c.time##c.time, cluster(subj) // quadratic slope
regress zp c.time##condself, cluster(subj) // n.s. interaction 
regress zp c.time##c.time##condself, cluster(subj) // n.s. interaction 





