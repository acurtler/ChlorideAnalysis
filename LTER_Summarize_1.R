

# Package installation and library
install.packages("dplyr")
install.packages("ggplot2")
install.packages("babynames")
install.packages("stringr")
install.packages("lubridate")
install.packages("zoo")
install.packages("dygraphs")
install.packages("gcookbook")
install.packages("trend")
install.packages("lubridate")

library(dplyr)
library(babynames)
library(dplyr)
library(ggplot2)
library(stringr)
library(lubridate)
library(zoo)
library(dygraphs)
library(gcookbook)
library(trend)
library(lubridate)


#Incorporating LTER data and cleaning it up
LTERdata <- read.csv("Cl_all_lakes.csv", header = TRUE) %>%
  mutate(sampleDate = as.POSIXct(sampleDate, format = "%m/%d/%Y")) %>%
  mutate(DOW = as.character(DOW)) %>% 
  mutate(DOW = if_else(str_detect(DOW, "^20"), # find those DOWs that start with a 2 (Anoka County)
                       str_pad(DOW, width = 8, side = "left", pad = "0"),  # add leading zeroes to get it to 8 digits
                       as.character(DOW)))

# list of lakes that we're using and their information
lakelist <- read.csv("LakeChains.csv", header = TRUE)%>%
  mutate(DOW = as.character(DOW)) %>% 
  mutate(DOW = if_else(str_detect(DOW, "^20"), # find those DOWs that start with a 2 (Anoka County)
                       str_pad(DOW, width = 8, side = "left", pad = "0"),  # add leading zeroes to get it to 8 digits
                       as.character(DOW))) 
#adding number that the lake is in the chain by combining lakes of interest and LTER data
LTERdata <- left_join(LTERdata, lakelist)

#Combining precipitation data from TCMA
precip_1980_1989 <- read.csv("precip_1980_1990.csv", header = TRUE) 
precip_1990_1999 <- read.csv("precip_1990_1999.csv", header = TRUE)
precip_2000_2009 <- read.csv("precip_2000_2009.csv", header = TRUE)
precip_2010_2019 <- read.csv("precip_2010_2019.csv", header = TRUE)
precip_2020_present <- read.csv("precip_2020_present.csv", header = TRUE)

#Combining data and formating to be more workable then sorting by year/month
precip_all <- rbind(precip_1980_1989, precip_1990_1999, precip_2000_2009, precip_2010_2019,precip_2020_present) %>%
  mutate(Date = as.POSIXct(Date, format = "%Y-%m-%d"))%>%
  rename(sampleDate = Date, Max_temp = Maximum.Temperature.degrees..F.,
         Min_temp = Minimum.Temperature.degrees..F., 
         Precip_in = Precipitation..inches. ,Snow_in = Snow..inches.,
         Snow_depth_in = Snow.Depth..inches. ) %>%
  mutate_if(is.character, as.numeric)

precip_all_year <- precip_all%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))
p_yearly_sum <- precip_all_year%>%
  group_by(Year)%>%
  summarize(avgP = mean(Precip_in, na.rm = TRUE), totalP = sum(Precip_in, na.rm = TRUE))

s_sum <- precip_all_year%>%
  group_by(Year, Month)%>%
  summarise(avgS = mean(Snow_in, na.rm = TRUE), totalS = sum(Snow_in, na.rm = TRUE))


#adding chloride and LTER data together to allow for further data manipulation
LTERdata <- left_join(precip_all, LTERdata)


#seperate lakes by specific chains
PhalenLakes <- selectedlakes %>%
  dplyr:: filter(DOW %in% c("62000600", "62000700", "62001002", "62001200", "62001300"))
LinoLakes <- selectedlakes %>%
  dplyr::filter(DOW %in% c("02000400", "02000500", "02000700", "02000800", "02001300", "62006702"))
MPRBLakes <- selectedlakes %>%
  dplyr::filter(DOW %in% c("27003800", "27003900", "27004000", "27003100", "27001600", "27001800"))
RileyLakes <- selectedlakes %>%
  dplyr::filter(DOW %in% c("10000700", "10001200", "10001300", "10000100", "10000200"))

Lakes_interest <- rbind(PhalenLakes, RileyLakes, LinoLakes, MPRBLakes)


#Seperate by lake
KOHLMAN <- PhalenLakes %>%
  dplyr::filter(LAKENAME == "KOHLMAN")

#WILLOW <- PhalenLakes %>%
 # dplyr::filter(LAKENAME == "WILLOW")

GERVAIS <- PhalenLakes %>%
  dplyr::filter(LAKENAME == "GERVAIS")

ROUND <- PhalenLakes %>%
  dplyr::filter(LAKENAME == "ROUND")

PHALEN <- PhalenLakes %>%
  dplyr::filter(LAKENAME == "PHALEN")


Kohlman_yr <-KOHLMAN%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Kohlman_avgcl = mean(Cl.mg_L, na.rm = TRUE), Kohlman_totalcl = sum(Cl.mg_L, na.rm = TRUE))

Gervais_yr <-GERVAIS%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Gervais_avgcl = mean(Cl.mg_L, na.rm = TRUE), Gervais_totalCl = sum(Cl.mg_L, na.rm = TRUE))
KellerMB <- PhalenLakes %>%
  filter(LAKENAME == "KELLER (MAIN BAY)")
KellerMB_yr <-KellerMB%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(KellerMB_avgcl = mean(Cl.mg_L, na.rm = TRUE), KellerMB_totalcl = sum(Cl.mg_L, na.rm = TRUE))

Round_yr <- ROUND%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Round_avgcl = mean(Cl.mg_L, na.rm = TRUE), Round_totalcl = sum(Cl.mg_L, na.rm = TRUE))

#Willow_yr <-WILLOW%>%
 # mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  #group_by(Year, Month)%>%
  #summarise(Willow_avgcl = mean(Cl.mg_L, na.rm = TRUE), Willow_totalcl = sum(Cl.mg_L, na.rm = TRUE))

Phalen_yr <-PHALEN%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Phalen_avgcl = mean(Cl.mg_L, na.rm = TRUE), Phalen_totalcl = sum(Cl.mg_L, na.rm = TRUE))


#Lino Lakes chain of lakes
PELTIER <- LinoLakes %>%
  dplyr::filter(LAKENAME == "PELTIER")
PELTIER_yr <-PELTIER%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Peltier_avgcl = mean(Cl.mg_L, na.rm = TRUE), Peltier_totalcl = sum(Cl.mg_L, na.rm = TRUE))
GEORGEWATCH <- LinoLakes %>%
  dplyr::filter(LAKENAME == "GEORGE WATCH")
Georgewatch_yr <-GEORGEWATCH%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Georgewatch_avgcl = mean(Cl.mg_L, na.rm = TRUE), Georgewatch_totalcl = sum(Cl.mg_L, na.rm = TRUE))
MARSHAN <- LinoLakes %>%
  dplyr::filter(LAKENAME == "MARSHAN")
Marshan_yr <-MARSHAN%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Marshan_avgcl = mean(Cl.mg_L, na.rm = TRUE), Marshan_totalcl = sum(Cl.mg_L, na.rm = TRUE))
RICE <- LinoLakes %>%
  dplyr::filter(LAKENAME == "RICE")
Rice_yr <-RICE%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Rice_avgcl = mean(Cl.mg_L, na.rm = TRUE), Rice_totalcl = sum(Cl.mg_L, na.rm = TRUE))
BALDWIN <- LinoLakes %>%
  dplyr::filter(LAKENAME == "BALDWIN")
Baldwin_yr <-BALDWIN%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Baldwin_avgcl = mean(Cl.mg_L, na.rm = TRUE), Baldwin_totalcl = sum(Cl.mg_L, na.rm = TRUE))

LONG <- LinoLakes %>%
  dplyr::filter(DOW == 62006702)
Long_yr <- LONG %>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Long_avgcl = mean(Cl.mg_L, na.rm = TRUE), Long_totalcl = sum(Cl.mg_L, na.rm = TRUE))

#didn't include Long lake-data missing
#Riley chain of lakes
LUCY <- RileyLakes %>%
  dplyr::filter(LAKENAME == "LUCY")
Lucy_yr <-LUCY%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Lucy_avgcl = mean(Cl.mg_L, na.rm = TRUE), Lucy_totalcl = sum(Cl.mg_L, na.rm = TRUE))
ANN <- RileyLakes %>%
  dplyr::filter(LAKENAME == "ANN")
Ann_yr <-ANN%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Ann_avgcl = mean(Cl.mg_L, na.rm = TRUE), Ann_totalcl = sum(Cl.mg_L, na.rm = TRUE))
SUSAN <- RileyLakes %>%
  dplyr::filter(LAKENAME == "SUSAN")
Susan_yr <-SUSAN%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Susan_avgcl = mean(Cl.mg_L, na.rm = TRUE), Susan_totalcl = sum(Cl.mg_L, na.rm = TRUE))
RICEMARSH <- RileyLakes %>%
  dplyr::filter(LAKENAME == "RICE MARSH")
Ricemarsh_yr <-RICEMARSH%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Ricemarsh_avgcl = mean(Cl.mg_L, na.rm = TRUE), Ricemarsh_totalcl = sum(Cl.mg_L, na.rm = TRUE))
RILEY <- RileyLakes %>%
  dplyr::filter(LAKENAME == "RILEY")
Riley_yr <-RILEY%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Riley_avgcl = mean(Cl.mg_L, na.rm = TRUE), Riley_totalcl = sum(Cl.mg_L, na.rm = TRUE))
#Didn't include Grass because lack of data
#MPRB chain of lakes
BROWNIE <- MPRBLakes %>%
  dplyr::filter(LAKENAME == "BROWNIE")
BROWNIE_yr <-BROWNIE%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Brownie_avgcl = mean(Cl.mg_L, na.rm = TRUE), Brownie_totalcl = sum(Cl.mg_L, na.rm = TRUE))
CEDAR <- MPRBLakes %>%
  dplyr::filter(LAKENAME == "CEDAR")
CEDAR_yr <-CEDAR%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Cedar_avgcl = mean(Cl.mg_L, na.rm = TRUE), Cedar_totalcl = sum(Cl.mg_L, na.rm = TRUE))
LAKEOFTHEISLES <- MPRBLakes %>%
  dplyr::filter(LAKENAME == "LAKE OF THE ISLES")
LOI_yr <-LAKEOFTHEISLES%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(LOI_avgcl = mean(Cl.mg_L, na.rm = TRUE), LOI_totalcl = sum(Cl.mg_L, na.rm = TRUE))
BDEMAKASKA <- MPRBLakes %>%
  dplyr::filter(LAKENAME == "BDE MAKA SKA")
BDEMAKASKA_yr <-BDEMAKASKA%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(BDEMAKASKA_avgcl = mean(Cl.mg_L, na.rm = TRUE), BDEMAKASKA_totalcl = sum(Cl.mg_L, na.rm = TRUE))
HARRIET <- MPRBLakes %>%
  dplyr::filter(LAKENAME == "HARRIET")
HARRIET_yr <-HARRIET%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Harriet_avgcl = mean(Cl.mg_L, na.rm = TRUE), Harriet_totalcl = sum(Cl.mg_L, na.rm = TRUE))
HIAWATHA <- MPRBLakes %>%
  dplyr::filter(LAKENAME == "HIAWATHA")
HIAWATHA_yr <-HIAWATHA%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))%>%
  group_by(Year, Month)%>%
  summarise(Hiawatha_avgcl = mean(Cl.mg_L, na.rm = TRUE), Hiawatha_totalcl = sum(Cl.mg_L, na.rm = TRUE))

#Creation of time series
Kohlman_ts <- zoo(KOHLMAN$Cl.mg_L, order.by = KOHLMAN$sampleDate, frequency = NULL)
GERVAIS_ts <- zoo(GERVAIS$Cl.mg_L, order.by = GERVAIS$sampleDate, frequency = NULL)
KellerMB_ts <- zoo(KellerMB$Cl.mg_L, order.by = KellerMB$sampleDate, frequency = NULL)
Round_ts <- zoo(ROUND$Cl.mg_L, order.by = ROUND$sampleDate, frequency = NULL)
Phalen_ts <- zoo(PHALEN$Cl.mg_L, order.by = PHALEN$sampleDate, frequency = NULL)

PELTIER_ts <- zoo(PELTIER$Cl.mg_L, order.by = PELTIER$sampleDate, frequency = NULL)
GEORGEWATCH_ts <- zoo(GEORGEWATCH$Cl.mg_L, order.by = GEORGEWATCH$sampleDate, frequency = NULL)
MARSHAN_ts <- zoo(MARSHAN$Cl.mg_L, order.by = MARSHAN$sampleDate, frequency = NULL)
RICE_ts <- zoo(RICE$Cl.mg_L, order.by = RICE$sampleDate, frequency = NULL)
BALDWIN_ts <- zoo(BALDWIN$Cl.mg_L, order.by = BALDWIN$sampleDate, frequency = NULL)
LONG_ts <- zoo(LONG$Cl.mg_L, order.by = LONG$sampleDate, frequency = NULL)

LUCY_ts <- zoo(LUCY$Cl.mg_L, order.by = LUCY$sampleDate, frequency = NULL)
ANN_ts <- zoo(ANN$Cl.mg_L, order.by = ANN$sampleDate, frequency = NULL)
SUSAN_ts <- zoo(SUSAN$Cl.mg_L, order.by = SUSAN$sampleDate, frequency = NULL)
RICEMARSH_ts <- zoo(RICEMARSH$Cl.mg_L, order.by = RICEMARSH$sampleDate, frequency = NULL)
RILEY_ts <- zoo(RILEY$Cl.mg_L, order.by = RILEY$sampleDate, frequency = NULL)
GRASS_ts <- zoo(GRASS$Cl.mg_L, order.by = GRASS$sampleDate, frequency = NULL)

brownie_2000 <- filter(BROWNIE, sampleDate >= as.POSIXct("2000-01-01"))
BROWNIE_ts <- zoo(BROWNIE$Cl.mg_L, order.by = BROWNIE$sampleDate, frequency = NULL)
CEDAR_ts <- zoo(CEDAR$Cl.mg_L, order.by = CEDAR$sampleDate, frequency = NULL)
LAKEOFTHEISLES_ts <- zoo(LAKEOFTHEISLES$Cl.mg_L, order.by = LAKEOFTHEISLES$sampleDate, frequency = NULL)
BDEMAKASKA_ts <- zoo(BDEMAKASKA$Cl.mg_L, order.by = BDEMAKASKA$sampleDate, frequency = NULL)
HARRIET_ts <- zoo(HARRIET$Cl.mg_L, order.by = HARRIET$sampleDate, frequency = NULL)
HIAWATHA_ts <- zoo(HIAWATHA$Cl.mg_L, order.by = HIAWATHA$sampleDate, frequency = NULL)


#Chains Sorted by yearly averages

Phalenlakes_yearly <- PhalenLakes%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))
Phalenlakes_yearly_avg <- Phalenlakes_yearly%>%
  group_by(LAKENAME, Year)%>%
  summarize(avg_cl = mean(Cl.mg_L, na.rm = TRUE))


MPRBlakes_yearly <- MPRBLakes%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))
MPRBlakes_yearly_avg <- MPRBlakes_yearly%>%
  group_by(LAKENAME, Year)%>%
  summarize(avg_cl = mean(Cl.mg_L, na.rm = TRUE))


Linolakes_yearly <- LinoLakes%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))
Linolakes_yearly_avg <- Linolakes_yearly%>%
  group_by(LAKENAME, Year)%>%
  summarize(avg_cl = mean(Cl.mg_L, na.rm = TRUE))

Rileylakes_yearly <- RileyLakes%>%
  mutate(Year = year(sampleDate), Month = month(sampleDate))
Rileylakes_yearly_avg <- Rileylakes_yearly%>%
  group_by(LAKENAME, Year)%>%
  summarize(avg_cl = mean(Cl.mg_L, na.rm = TRUE))


ggplot(Rileylakes_yearly_avg,aes(x=Year,y=avg_cl,color=LAKENAME))+
  geom_point()+
  ggtitle("Yearly Average for Riley Chain of Lakes" ) + xlab("Year") + ylab("Average [Cl]")+
  geom_hline(yintercept = 250, color = "red")+
  geom_hline(yintercept = 120, color = "blue")+
  geom_line()

ggplot(Phalenlakes_yearly_avg,aes(x=Year,y=avg_cl,color=LAKENAME))+
  geom_point()+
  ggtitle("Yearly Average for Phalen Chain of Lakes" ) + xlab("Year") + ylab("Average [Cl]")+
  geom_hline(yintercept = 250, color = "red")+
  geom_hline(yintercept = 120, color = "blue")+
  geom_line()

ggplot(Linolakes_yearly_avg,aes(x=Year,y=avg_cl,color=LAKENAME))+
  geom_point()+
  ggtitle("Yearly Average for Lino Chain of Lakes" ) + xlab("Year") + ylab("Average [Cl]")+
  geom_hline(yintercept = 250, color = "red")+
  geom_hline(yintercept = 120, color = "blue")+
  geom_line()+
  scale_color_discrete(labels = c("SOUTH LONG" = "LONG"))

ggplot(MPRBlakes_yearly_avg,aes(x=Year,y=avg_cl,color=LAKENAME))+
  geom_point()+
  ggtitle("Yearly Average for MPRB Chain of Lakes" ) + xlab("Year") + ylab("Average [Cl]")+
  geom_hline(yintercept = 250, color = "red")+
  geom_hline(yintercept = 120, color = "blue")+
  geom_line()


boxplot(Cl.mg_L~LAKENAME,
        data = PhalenLakes,
        main = "Phalen Lakes")

boxplot(Cl.mg_L~LAKENAME,
        data = MPRBLakes,
        main = "MPRB Lakes")

boxplot(Cl.mg_L~LAKENAME,
        data = RileyLakes,
        main = "Riley Lakes")

boxplot(Cl.mg_L~LAKENAME,
        data = LinoLakes,
        main = "Lino Lakes")

