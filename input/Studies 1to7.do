// STUDIES 1-7 COMPILED DATASET ////////////////////////////////

clear

. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/Studies 1to7.xlsx", sheet("analysis") firstrow


*Study 4 Mechanism Analysis
drop if study ~= 4
reshape long zp zpp zc zcct zcmax, i(subj) j(time) // data to long form
mixed zp zpp c.time c.time#c.time || subj: , dfmethod(repeated) // expected productivity predicts expected creativity
mixed zc zpp c.time c.time#c.time || subj: , dfmethod(repeated) // expected productivity doesn't predict actual creativity

mixed zp zcct c.time c.time#c.time || subj: , dfmethod(repeated) // # of creative ideas does NOT predict expected creativity
mixed zp zcmax c.time c.time#c.time || subj: , dfmethod(repeated) // max creative idea marginally predicts expected creativity

reshape wide zp zpp zc, i(subj) j(time) // data to long form

*Study 4  correlation between university student and AMT worker creativity ratings
drop if study ~= 4
reshape long zc zcAMT, i(subj) j(time)
mixed zc zcAMT c.time || subj:, dfmethod(repeated)
reshape wide zc zcAMT, i(subj) j(time)

*Study 5 correlation between other-rated creativity and self-rated creativity
drop if study ~= 5
reshape long zcsr zc zcAMT, i(subj) j(time) 
pwcorr zcsr zc zcAMT, obs sig
mixed zc zcsr c.time##c.time || subj: , dfmethod(repeated) // SR and 3rdParty creativity are sig. related
mixed zc zcAMT c.time##c.time || subj: , dfmethod(repeated) // AMT and 3rdPart creativity are sig. related
mixed zcAMT zcsr c.time##c.time || subj: , dfmethod(repeated) // AMT and 3rdPart creativity are sig. related
reshape wide zcsr zc zcAMT, i(subj) j(time) 



*Novelty and Usefulness analyses (studies 1-4)
*STUDY 1*
clear
. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/Studies 1to7.xlsx", sheet("analysis") firstrow
drop if study ~= 1
reshape long zp zc zn zu, i(subj) j(time) // data to long form
table time, c(mean zn sd zn mean zu sd zu)
mixed zc zp c.time || subj: , dfmethod(repeated) // creativity
mixed zn zp c.time || subj: , dfmethod(repeated) // novelty
mixed zu zp c.time || subj: , dfmethod(repeated) // usefulness
reshape wide zp zc zn zu, i(subj) j(time) // data to long form

*STUDY 2*
clear
. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/Studies 1to7.xlsx", sheet("analysis") firstrow
drop if study ~= 2
reshape long zp zc zn zu, i(subj) j(time) // data to long form
table time, c(mean zn sd zn mean zu sd zu)
mixed zc zp c.time || subj: , dfmethod(repeated) // creativity
mixed zn zp c.time || subj: , dfmethod(repeated) // novelty
mixed zu zp c.time || subj: , dfmethod(repeated) // usefulness
reshape wide zp zc zn zu, i(subj) j(time) // data to long form

*STUDY 3*
clear
. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/Studies 1to7.xlsx", sheet("analysis") firstrow
drop if study ~= 3
reshape long zp zc zn zu, i(subj) j(time) // data to long form
table time, c(mean zn sd zn mean zu sd zu)
mixed zc zp c.time || subj: , dfmethod(repeated) // creativity
mixed zn zp c.time || subj: , dfmethod(repeated) // novelty
mixed zu zp c.time || subj: , dfmethod(repeated) // usefulness
reshape wide zp zc zn zu, i(subj) j(time) // data to long form

*STUDY 4*
clear
. import excel "/Users/bl679/Dropbox/My Projects Dropbox/@ Research Projects/@Projects/@Collaborators/Loran Nordgren/Persist_Creativ/2 Timecourse of Creativity/Studies/@OSF Files/R1/Studies 1to7.xlsx", sheet("analysis") firstrow
drop if study ~= 4
reshape long zpc zc zn zu, i(subj) j(time) // data to long form
table time, c(mean zn sd zn mean zu sd zu)
mixed zc zpc c.time || subj: , dfmethod(repeated) // creativity
mixed zn zpc c.time || subj: , dfmethod(repeated) // novelty
mixed zu zpc c.time || subj: , dfmethod(repeated) // usefulness
reshape wide zp zc zn zu, i(subj) j(time) // data to long form







