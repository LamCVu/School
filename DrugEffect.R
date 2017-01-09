drugeffect=read.table("drugEffect_dataset.txt",header=TRUE)
ID=drugeffect$ID
Part=drugeffect$Part
RatID=drugeffect$RatID
InitRate=drugeffect$InitRate
Dose=drugeffect$Dose
Obs=drugeffect$Obs
PressRate=drugeffect$PressRate
Part=factor(Part)
InitRate=factor(InitRate)
Dose=factor(Dose)
Q1
mm1=by(PressRate ,Dose,mean)
barplot(mm1, main="BarPlot", xlab="Dose", ylab="Press Rate")
D1 = mean(PressRate[Dose==1])
D2 = mean(PressRate[Dose==2])
D3 = mean(PressRate[Dose==3])
D4 = mean(PressRate[Dose==4])
Diff1 = D1-D2
Diff2 = D1-D3
Diff3 = D1-D4
Diff4 = D2-D3
Diff5 = D2-D4
Diff6 = D3-D4
alpha=0.05
n=192
g=6
r=4
B=qt(1-alpha/(2*g),n-r)
T=qtukey(1-alpha,g,n-r)/sqrt(2)
S=sqrt((r-1)*qf(1-alpha,r-1,n-r))
MSE=0.441
ni=48
se=sqrt(MSE/ni)
#Diff1CI
Diff1-B*se
Diff1+B*se
#Diff2CI
Diff2-B*se
Diff2+B*se
#Diff3CI
Diff3-B*se
Diff3+B*se
#Diff4CI
Diff4-B*se
Diff4+B*se
#Diff5CI
Diff5-B*se
Diff5+B*se 
#Diff6CI	
Diff6-B*se
Diff6+B*se

Q2
mm=by(PressRate,Part,mean)
barplot(mm, main="BarPlot", xlab="Part", ylab="Press Rate")
D1 = mean(PressRate[Part==1])
D2 = mean(PressRate[Part==2])
Diff1 = D2-D1
alpha=0.05
n=192
g=1
r=2
B=qt(1-alpha/(2*g),n-r)
MSE=0.26
ni=96
se=sqrt(MSE/ni)
#Diff1CI
Diff1-B*se
Diff1+B*se

#Question 3 and 4
interaction.plot(
  x.factor=InitRate,
  trace.factor=Part,  
  response=PressRate,main="Interaction Plot",
  ylab="Lever Press Rate divide by seconds",
  type="b",pch=c(15,19),col=c(1,2,3),
  trace.label="Factor A",xlab="Factor B (InitRate)"  
)
aovfit=aov(PressRate~InitRate*Part,data=drugeffect)
summary(aovfit)
g1p1=mean(PressRate[InitRate==1 & Part==1])
g1p2=mean(PressRate[InitRate==1 & Part==2])
g3p1=mean(PressRate[InitRate==3 & Part==1])
g3p2=mean(PressRate[InitRate==3 & Part==2])
D1=g1p1-g1p2
D2=g3p1-g3p2
alpha=0.05
g=3
n=192
B=qt(1-alpha/(2*g),n-3)
MSE=0.22 
D1se=sqrt(MSE*((1/24)+(1/24)))
D2se=sqrt(MSE*((1/24)+(1/24)))
L1se=sqrt(MSE*((1/24)+(4/24)+(1/24)))
D1-B*D1se        
D1+B*D1se
D2-B*D2se
D2+B*D2se
L1=D1-D2
L1-B*L1se
L1+B*L1se
