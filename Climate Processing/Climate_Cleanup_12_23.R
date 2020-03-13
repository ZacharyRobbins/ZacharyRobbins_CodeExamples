


Drive<-"F:/Maca_Climate_Files_Sapps/Outputs/12_8/"
Outdir<-"F:/Maca_Climate_Files_Sapps/Cleaned/"



files<-list.files(Drive)#,pattern="/High_Elevation_Dissolve/")
#files
#?gsub
Ecos<-c("High_Elevation_Dissolve","Low_elevation_Dissolved","Mid_El_Montane_Dissolve","North_Montane_Dissolved")


Modellist<-NULL
for(i in files){
  one_file<-i
  Model<-gsub(paste0(Ecos[1],"_"),"",one_file)
  Model<-gsub(paste0(Ecos[2],"_"),"",Model)
  Model<-gsub(paste0(Ecos[3],"_"),"",Model)
  Model<-gsub(paste0(Ecos[4],"_"),"",Model)
  Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
  Model<-gsub("i1p1","",Model)
  
  Modellist<-rbind(Modellist,Model)
  
}

Model_Names<-unique(Modellist)
for(j in Model_Names){
  print(j)
  OneModel<-j
  
  ModelL<-paste0("\\_",OneModel,".*")
 # print(ModelL)
  ###RCP 45  
  sub1<-list.files(Drive,pattern=paste(OneModel))
  if(length(sub1)==24){
  #print(sub1)
  #### Just RCP 45
  sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
  print('45')
  ###Temp Max 
   TMax<-sub2[grepl(sub2,pattern="_2006_2099_CONUS_daily_aggregated.nc" )]
   print('TMax')
   One<-read.csv(paste0(Drive,TMax[1]))[,-1]
   Location<-gsub(ModelL,"",TMax[1]) 
   colnames(One)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Two<-read.csv(paste0(Drive,TMax[2]))[,-1]
   Location<-gsub(ModelL,"",TMax[2]) 
   colnames(Two)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Three<-read.csv(paste0(Drive,TMax[3]))[,-1]
   Location<-gsub(ModelL,"",TMax[3]) 
   colnames(Three)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Four<-read.csv(paste0(Drive,TMax[4]))[,-1]
   Location<-gsub(ModelL,"",TMax[4]) 
   colnames(Four)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   
   M1<-merge(One,Two,by='Date')
   M2<-merge(Three,M1,by='Date')
   M3<-merge(Four,M2,by='Date')
   
   TmaxOut<-M3[,c(1,2,5,8,11,3,6,9,12,4,7,10,13)]
   
   
   ###Tmin
   
   TMin<-sub2[grepl(sub2,pattern="rcp45RCP45air_" )]
   print('TMin')
   One<-read.csv(paste0(Drive,TMin[1]))[,-1]
   Location<-gsub(ModelL,"",TMin[1]) 
   colnames(One)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Two<-read.csv(paste0(Drive,TMin[2]))[,-1]
   Location<-gsub(ModelL,"",TMin[2]) 
   colnames(Two)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Three<-read.csv(paste0(Drive,TMin[3]))[,-1]
   Location<-gsub(ModelL,"",TMin[3]) 
   colnames(Three)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Four<-read.csv(paste0(Drive,TMin[4]))[,-1]
   Location<-gsub(ModelL,"",TMin[4]) 
   colnames(Four)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   
   M1<-merge(One,Two,by='Date')
   M2<-merge(Three,M1,by='Date')
   M3<-merge(Four,M2,by='Date')
   
   TMinOut<-M3[,c(1,2,5,8,11,3,6,9,12,4,7,10,13)]
   
   ###PPT
   
   PPT<-sub2[grepl(sub2,pattern="precipitation" )]
   print('PPT')
   One<-read.csv(paste0(Drive,PPT[1]))[,-1]
   Location<-gsub(ModelL,"",PPT[1]) 
   colnames(One)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Two<-read.csv(paste0(Drive,PPT[2]))[,-1]
   Location<-gsub(ModelL,"",PPT[2]) 
   colnames(Two)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Three<-read.csv(paste0(Drive,PPT[3]))[,-1]
   Location<-gsub(ModelL,"",PPT[3]) 
   colnames(Three)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Four<-read.csv(paste0(Drive,PPT[4]))[,-1]
   Location<-gsub(ModelL,"",PPT[4]) 
   colnames(Four)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   
   M1<-merge(One,Two,by='Date')
   M2<-merge(Three,M1,by='Date')
   M3<-merge(Four,M2,by='Date')
   
   PPTOut<-M3[,c(1,2,5,8,11,3,6,9,12,4,7,10,13)]
   
   Output45<-rbind(PPTOut,TmaxOut,TMinOut)
   write.csv(Output45,paste0(Outdir,OneModel,"_RCP45.csv"))
   
   ###### Just RCP 85
   
   sub2<-sub1[grepl(sub1,pattern=('RCP85'))]
   print('RCP 85')
   #print(sub2)
   ###Temp Max 
   TMax<-sub2[grepl(sub2,pattern="r1RCP85|r6RCP85" )]
   print('TMax')
   One<-read.csv(paste0(Drive,TMax[1]))[,-1]
   Location<-gsub(ModelL,"",TMax[1]) 
   colnames(One)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Two<-read.csv(paste0(Drive,TMax[2]))[,-1]
   Location<-gsub(ModelL,"",TMax[2]) 
   colnames(Two)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Three<-read.csv(paste0(Drive,TMax[3]))[,-1]
   Location<-gsub(ModelL,"",TMax[3]) 
   colnames(Three)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Four<-read.csv(paste0(Drive,TMax[4]))[,-1]
   Location<-gsub(ModelL,"",TMax[4]) 
   colnames(Four)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   
   M1<-merge(One,Two,by='Date')
   M2<-merge(Three,M1,by='Date')
   M3<-merge(Four,M2,by='Date')
   
   TmaxOut<-M3[,c(1,2,5,8,11,3,6,9,12,4,7,10,13)]
   
   
   ###Tmin
   
   TMin<-sub2[grepl(sub2,pattern="rcp85RCP85air_" )]
   print('TMin')
   One<-read.csv(paste0(Drive,TMin[1]))[,-1]
   Location<-gsub(ModelL,"",TMin[1]) 
   colnames(One)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Two<-read.csv(paste0(Drive,TMin[2]))[,-1]
   Location<-gsub(ModelL,"",TMin[2]) 
   colnames(Two)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Three<-read.csv(paste0(Drive,TMin[3]))[,-1]
   Location<-gsub(ModelL,"",TMin[3]) 
   colnames(Three)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Four<-read.csv(paste0(Drive,TMin[4]))[,-1]
   Location<-gsub(ModelL,"",TMin[4]) 
   colnames(Four)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   
   M1<-merge(One,Two,by='Date')
   M2<-merge(Three,M1,by='Date')
   M3<-merge(Four,M2,by='Date')
   
   TMinOut<-M3[,c(1,2,5,8,11,3,6,9,12,4,7,10,13)]
   
   ###PPT
   
   PPT<-sub2[grepl(sub2,pattern="precipitation" )]
   print('PPT')
   One<-read.csv(paste0(Drive,PPT[1]))[,-1]
   Location<-gsub(ModelL,"",PPT[1]) 
   colnames(One)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Two<-read.csv(paste0(Drive,PPT[2]))[,-1]
   Location<-gsub(ModelL,"",PPT[2]) 
   colnames(Two)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Three<-read.csv(paste0(Drive,PPT[3]))[,-1]
   Location<-gsub(ModelL,"",PPT[3]) 
   colnames(Three)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   Four<-read.csv(paste0(Drive,PPT[4]))[,-1]
   Location<-gsub(ModelL,"",PPT[4]) 
   colnames(Four)<-c("Date",paste0(Location,"Mean"),paste0(Location,"VAR"),paste0(Location,"STD"))
   
   M1<-merge(One,Two,by='Date')
   M2<-merge(Three,M1,by='Date')
   M3<-merge(Four,M2,by='Date')
   
   PPTOut<-M3[,c(1,2,5,8,11,3,6,9,12,4,7,10,13)]
   
   Output85<-rbind(PPTOut,TmaxOut,TMinOut)
   write.csv(Output85,paste0(Outdir,OneModel,"_RCP85.csv"))
  } 
 }
 
Outdir<-"F:/Maca_Climate_Files_Sapps/Cleaned/"
seeessvees<-list.files(Outdir,pattern=".csv")
for(j in seeessvees){
   j
   onecsv<-read.csv(paste0(Outdir,j))
   colnames(onecsv)
   colcorrect<-onecsv[,c(5,4,6,3,9,8,10,7,13,12,14,11)]
   write.csv(colcorrect,paste0(Outdir,j))
}







#### For Variable Comparison.  
VarComDrive<-"F:/Maca_Climate_Files_Sapps/v/" 
Dates<-as.data.frame(as.matrix(read.csv(paste0(Drive,files[1]))[,c(-1,-3,-4,-5)]))
colnames(Dates)<-"Dates"

sub1<-list.files(Drive,pattern="precipitation")
 



getwd()
  


### This is for the entire region. 
#### For Variable Comparison.  
VarComDrive<-"F:/Maca_Climate_Files_Sapps/Variable_Comparison/"

Drive<-"F:/Maca_Climate_Files_Sapps/Outputs/"


sub1<-list.files(Drive,pattern="precipitation")
Dates<-as.data.frame(as.matrix(read.csv(paste0(Drive,sub1[1]))[,c(-1,-3,-4,-5)]))
colnames(Dates)<-"Dates"
#print(sub1)


#### All Ecos indvideua;l
Ecoregion<-Ecos[1]

#### Percipitation 

for(Ecoregion in Ecos){
   RCP45<-Dates
   sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
   sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
   ##Loopingthrough Ecoregion and Scenario
   for(subnum in sub3){
      EcoSce<-subnum
      One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
      Model<-gsub(paste0(Ecoregion,"_"),"",EcoSce)
      Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
      Model<-gsub("i1p1","",Model)
      
      colnames(One)<-c("Dates",Model)
      RCP45<-merge(One,RCP45,by="Dates")
   }
   #paste0(Ecoregion,"_RCP_45_PPT.csv")
   write.csv(RCP45,paste0(Ecoregion,"_RCP_45_PPT.csv"))
   ## RCP 85
   
   sub2<-sub1[grepl(sub1,pattern=('RCP85'))]
   sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
   ##Loopingthrough Ecoregion and Scenario
   RCP85<-Dates
   for(subnum in sub3){
      EcoSce<-subnum
      One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
      Model<-gsub(paste0(Ecoregion,"_"),"",EcoSce)
      Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
      Model<-gsub("i1p1","",Model)
      colnames(One)<-c("Dates",Model)
      RCP85<-merge(One,RCP85,by="Dates")
   }
   write.csv(RCP85,paste0(Ecoregion,"_RCP_85_PPT.csv"))
}

#### Tmax
sub1<-list.files(Drive,pattern="_2006_2099_CONUS_daily_aggregated.nc|r1RCP85|r6RCP85")

for(Ecoregion in Ecos){
   RCP45<-Dates
   sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
   sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
   ##Loopingthrough Ecoregion and Scenario
   for(subnum in sub3){
      EcoSce<-subnum
      One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
      Model<-gsub(paste0(Ecoregion,"_"),"",EcoSce)
      Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
      Model<-gsub("i1p1","",Model)
      
      colnames(One)<-c("Dates",Model)
      RCP45<-merge(One,RCP45,by="Dates")
   }
   #paste0(Ecoregion,"_RCP_45_PPT.csv")
   write.csv(RCP45,paste0(Ecoregion,"_RCP_45_Tmax.csv"))
   ## RCP 85
   
   sub2<-sub1[grepl(sub1,pattern=('RCP85'))]
   print(sub2)
   sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
   ##Loopingthrough Ecoregion and Scenario
   RCP85<-Dates
   for(subnum in sub3){
      EcoSce<-subnum
      One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
      Model<-gsub(paste0(Ecoregion,"_"),"",EcoSce)
      Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
      Model<-gsub("i1p1","",Model)
      colnames(One)<-c("Dates",Model)
      RCP85<-merge(One,RCP85,by="Dates")
   }
   write.csv(RCP85,paste0(Ecoregion,"_RCP_85_Tmax.csv"))
}


#### Tmax
sub1<-list.files(Drive,pattern="rcp45RCP45air_|rcp85RCP85air_")

for(Ecoregion in Ecos){
   RCP45<-Dates
   sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
   sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
   ##Loopingthrough Ecoregion and Scenario
   for(subnum in sub3){
      EcoSce<-subnum
      One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
      Model<-gsub(paste0(Ecoregion,"_"),"",EcoSce)
      Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
      Model<-gsub("i1p1","",Model)
      
      colnames(One)<-c("Dates",Model)
      RCP45<-merge(One,RCP45,by="Dates")
   }
   #paste0(Ecoregion,"_RCP_45_PPT.csv")
   write.csv(RCP45,paste0(Ecoregion,"_RCP_45_Tmin.csv"))
   ## RCP 85
   
   sub2<-sub1[grepl(sub1,pattern=('RCP85'))]
   sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
   ##Loopingthrough Ecoregion and Scenario
   RCP85<-Dates
   for(subnum in sub3){
      EcoSce<-subnum
      One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
      Model<-gsub(paste0(Ecoregion,"_"),"",EcoSce)
      Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
      Model<-gsub("i1p1","",Model)
      colnames(One)<-c("Dates",Model)
      RCP85<-merge(One,RCP85,by="Dates")
   }
   write.csv(RCP85,paste0(Ecoregion,"_RCP_85_Tmin.csv"))
}




#### Just One AOI 


#### Percipitation 
sub1<-list.files(Drive,pattern="precipitation")
RCP45<-Dates
sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
##Loopingthrough Ecoregion and Scenario
for(subnum in sub2){
   EcoSce<-subnum
   One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
   Model<-gsub(paste0("Complete_"),"",EcoSce)
   Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
   Model<-gsub("i1p1","",Model)
   
   colnames(One)<-c("Dates",Model)
   RCP45<-merge(One,RCP45,by="Dates")
}
#paste0(Ecoregion,"_RCP_45_PPT.csv")
write.csv(RCP45,paste0(VarComDrive,"AOI_RCP_45_PPT.csv"))
## RCP 85

sub2<-sub1[grepl(sub1,pattern=('RCP85'))]
#sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
##Loopingthrough Ecoregion and Scenario
RCP85<-Dates
for(subnum in sub2){
   EcoSce<-subnum
   One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
   Model<-gsub(paste0("Complete_"),"",EcoSce)
   Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
   Model<-gsub("i1p1","",Model)
   colnames(One)<-c("Dates",Model)
   RCP85<-merge(One,RCP85,by="Dates")
}
write.csv(RCP85,paste0(VarComDrive,"AOI_RCP_85_PPT.csv"))


#### Tmax
sub1<-list.files(Drive,pattern="tasmax")
sub1

RCP45<-Dates
sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
##Loopingthrough Ecoregion and Scenario
for(subnum in sub2){
   EcoSce<-subnum
   One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
   Model<-gsub(paste0("Complete_"),"",EcoSce)
   Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
   Model<-gsub("i1p1","",Model)
   
   colnames(One)<-c("Dates",Model)
   RCP45<-merge(One,RCP45,by="Dates")
}
#paste0(Ecoregion,"_RCP_45_PPT.csv")
write.csv(RCP45,paste0(VarComDrive,"AOI_RCP_45_Tmax.csv"))
## RCP 85

sub2<-sub1[grepl(sub1,pattern=('RCP85'))]
print(sub2)
#sub3<-sub2[grepl(sub2,pattern=Ecoregion)]
##Loopingthrough Ecoregion and Scenario
RCP85<-Dates
for(subnum in sub2){
   EcoSce<-subnum
   One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
   Model<-gsub(paste0("Complete_"),"",EcoSce)
   Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
   Model<-gsub("i1p1","",Model)
   colnames(One)<-c("Dates",Model)
   RCP85<-merge(One,RCP85,by="Dates")
}
write.csv(RCP85,paste0(VarComDrive,"AOI_RCP_85_Tmax.csv"))


#### Tmin
sub1<-list.files(Drive,pattern="rcp45RCP45air_|rcp85RCP85air_")


RCP45<-Dates
sub2<-sub1[grepl(sub1,pattern=('rcp45'))]
##Loopingthrough Ecoregion and Scenario
for(subnum in sub2){
   EcoSce<-subnum
   One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
   Model<-gsub(paste0("Complete_"),"",EcoSce)
   Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
   Model<-gsub("i1p1","",Model)
   
   colnames(One)<-c("Dates",Model)
   RCP45<-merge(One,RCP45,by="Dates")
}
#paste0(Ecoregion,"_RCP_45_PPT.csv")
write.csv(RCP45,paste0(VarComDrive,"AOI_RCP_45_Tmin.csv"))
## RCP 85

sub2<-sub1[grepl(sub1,pattern=('RCP85'))]

##Loopingthrough Ecoregion and Scenario
RCP85<-Dates

for(subnum in sub2){
   EcoSce<-subnum
   One<-read.csv(paste0(Drive,EcoSce))[,c(-1,-4,-5)]
   Model<-gsub(paste0("Complete_"),"",EcoSce)
   Model<-gsub("\\_rcp45.*|\\_rcp85.*|\\RCP85.*","",Model)
   Model<-gsub("i1p1","",Model)
   colnames(One)<-c("Dates",Model)
   RCP85<-merge(One,RCP85,by="Dates")
}
write.csv(RCP85,paste0(VarComDrive,"AOI_RCP_85_Tmin.csv"))


LANDISR_Dir<-'F:/Maca_Climate_Files_Sapps/LANDIS_Ready/'


Template<-read.csv(paste0(LANDISR_Dir,"RCP45_Climate_Wind.csv"),stringsAsFactors=FALSE)
Files<-list.files("F:/Maca_Climate_Files_Sapps/Cleaned/Project_A")


for(filename in Files){
InNameOnly<-gsub(".csv","",filename)


NewFile<-read.csv(paste0("F:/Maca_Climate_Files_Sapps/Cleaned/Project_A/",filename),stringsAsFactors = FALSE)
#Tmax_New
Template[3:34334,2:13]<-NewFile[34333:68664,2:13]
##Tmin
Template[34339:68670,2:13]<-NewFile[68665:102996,2:13]
#PPT
Template[68675:102996,2:13]<-NewFile[1:34332,2:13]

write.csv(Template,paste0(LANDISR_Dir,InNameOnly,"_LANDIS.csv"))
}






