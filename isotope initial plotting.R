library(ggplot2)
library(viridis)


# reading in the csv data
mus<-read.csv('https://raw.githubusercontent.com/jakehosen/mussel_isotopes/refs/heads/main/IDNR_Mussel_Isotope_Data_Compiled_Edited.csv')


# to look at your data
names(mus)
head(mus)
tail(mus)

mus$species_material<-mus$Mussel.Species
mus$species_material[mus$species_material==""]<-mus$Material[mus$species_material==""]



ggplot(mus,aes(x=δ13C.VPDB,y=δ15N.At..Air,color=species_material,shape=Material))+
geom_point(size=5)+
scale_color_viridis(discrete=TRUE)+
theme_classic()



ggplot(mus,aes(x=δ13C.VPDB,y=δ15N.At..Air,color=species_material,shape=Material))+
geom_point(size=5)+
scale_color_viridis(discrete=TRUE)+
theme_classic()+
xlim(-37,2)+
ylim(-8,18)



ggplot(mus,aes(x=δ13C.VPDB,y=δ15N.At..Air,color=Material_Ag,shape=Material))+
geom_point(size=2)+
scale_color_viridis(discrete=TRUE)+
theme_classic()+
xlim(-37,2)+
ylim(-8,18)



ggplot(mus,aes(x=δ13C.VPDB,y=δ15N.At..Air,color=Site.ID,shape=Material))+
geom_point(size=2)+
scale_color_viridis(discrete=TRUE)+
theme_classic()+
xlim(-37,2)+
ylim(-8,18)


mus_endmember<-subset(mus,(Material=="Biofilm" & Treatment=="acid-fumed") | (Material=="Leaf Litter" & Treatment=="none") | (Material=="Riparian Vegetation" & Treatment=="none") | (Material=="POM" & Treatment=="acid-fumed") | (Material=="Sediment" & Treatment=="acid-fumed"))

mus_endmember$C_mass_mg<-mus_endmember$Weight..mg. * (mus_endmember$X.C/100)

ggplot(mus_endmember,aes(x=Material,y=δ13C.VPDB,color=Site.ID,group=Site.ID))+
  geom_point(size=2.5,position = position_dodge(width = 0.5))


ggplot(mus_endmember,aes(x=Material,y=C_mass_mg,color=Site.ID,group=Site.ID))+
  geom_point(size=2.5,position = position_dodge(width = 0.5))

ggplot(mus_endmember,aes(x=Material,y=X.C,color=Site.ID,group=Site.ID))+
  geom_point(size=2.5,position = position_dodge(width = 0.5))+
  ylab("Percent Carbon in Sample")



ggplot(mus_endmember,aes(x=Material,y=δ13C.VPDB,color=Site.ID,group=Site.ID))+
  geom_point(size=2.5,position = position_dodge(width = 0.5))+
  facet_wrap(.~Season)



