

#ggplots of Cl over time
ggplot(Lakes_interest, aes(x =sampleDate, y = Cl.mg_L, color = LakeChainName ))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  ggtitle("Lakes of Interest [Cl] over time")+ xlab("Year") + ylab("[Cl] (mg/L)")
ggplot(MPRBlakes, aes(x =sampleDate, y = Cl.mg_L, color = LAKENAME ))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  ggtitle("MPRB Chain of Lakes")+ xlab("Year") + ylab("[Cl] (mg/L)")
ggplot(Linolakes, aes(x =sampleDate, y = Cl.mg_L, color = LAKENAME ))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  ggtitle("Lino Chain of Lakes")+ xlab("Year") + ylab("[Cl] (mg/L)")
ggplot(Rileylakes, aes(x =sampleDate, y = Cl.mg_L, color = LAKENAME ))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  ggtitle("Riley Chain of Lakes")+ xlab("Year") + ylab("[Cl] (mg/L)")
ggplot(Phalenlakes, aes(x =sampleDate, y = Cl.mg_L, color = LAKENAME ))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  ggtitle("Phalen Chain of Lakes")+ xlab("Year") + ylab("[Cl] (mg/L)")

#Plots of these avg_cl vs tot_s
ggplot(MPRBlakes_yearly_avg, aes(x =totalS, y = avg_cl, color = avg_cl ))+
  geom_point()+
  ggtitle("MPRB Chain of Lakes yearly snow and [Cl]")+ xlab("total snow") + ylab("avg [Cl] (mg/L)")

ggplot(Phalenlakes_yearly_avg, aes(x =totalS, y = avg_cl, color = avg_cl ))+
  geom_point()+
  ggtitle("Phalen Chain of Lakes yearly snow and [Cl]")+ xlab("total snow") + ylab("avg [Cl] (mg/L)")

ggplot(Linolakes_yearly_avg, aes(x =totalS, y = avg_cl, color = avg_cl ))+
  geom_point()+
  ggtitle("Lino Chain of Lakes yearly snow and [Cl]")+ xlab("total snow") + ylab("avg [Cl] (mg/L)")

ggplot(Rileylakes_yearly_avg, aes(x =totalS, y = avg_cl, color = avg_cl ))+
  geom_point()+
  ggtitle("Riley Chain of Lakes yearly snow and [Cl]")+ xlab("total snow") + ylab("avg [Cl] (mg/L)")



#Scatterplots of individual lakes [Cl] vs date
plot(x = Kohlman_yr$Year, y = Kohlman_yr$Kohlman_avgcl, main = "Kohlman Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Gervais_yr$Year, y = Gervais_yr$Gervais_avgcl, main = "Gervais Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = KellerMB_yr$Year, y = KellerMB_yr$KellerMB_avgcl, main = "Keller Main Bay Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Round_yr$Year, y = Round_yr$Round_avgcl, main = "Round Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Willow_yr$Year, y = Willow_yr$Willow_avgcl, main = "Willow Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Phalen_yr$Year, y = Phalen_yr$Phalen_avgcl, main = "Phalen Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = PELTIER_yr$Year, y = PELTIER_yr$Peltier_avgcl, main = "Peltier Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Georgewatch_yr$Year, y = Georgewatch_yr$Georgewatch_avgcl, main = "Georgewatch Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Marshan_yr$Year, y = Marshan_yr$Marshan_avgcl, main = "Marshan Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Rice_yr$Year, y = Rice_yr$Rice_avgcl, main = "Rice Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Baldwin_yr$Year, y = Baldwin_yr$Baldwin_avgcl, main = "Baldwin Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Lucy_yr$Year, y = Lucy_yr$Lucy_avgcl, main = "Lucy Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Ann_yr$Year, y = Ann_yr$Ann_avgcl, main = "Ann Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Susan_yr$Year, y = Susan_yr$Susan_avgcl, main = "Susan Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Ricemarsh_yr$Year, y = Ricemarsh_yr$Ricemarsh_avgcl, main = "Rice Marsh Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = Riley_yr$Year, y = Riley_yr$Riley_avgcl, main = "Riley Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = BROWNIE_yr$Year, y = BROWNIE_yr$Brownie_avgcl, main = "Brownie Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = CEDAR_yr$Year, y = CEDAR_yr$Cedar_avgcl, main = "Cedar Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = LOI_yr$Year, y = LOI_yr$LOI_avgcl, main = "Lake of the Isles Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = BDEMAKASKA_yr$Year, y = BDEMAKASKA_yr$BDEMAKASKA_avgcl, main = "Bde Maka Ska Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = HARRIET_yr$Year, y = HARRIET_yr$Harriet_avgcl, main = "Harriet Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")
plot(x = HIAWATHA_yr$Year, y = HIAWATHA_yr$Hiawatha_avgcl, main = "Hiawatha Lake Average Yearly [Cl]", xlab = "Year", ylab = "[Cl] (mg/L)")
abline(h = 250, col = "blue")
abline(h = 120, col = "red")

#Plotting time series w/ zoo plots

plot.zoo(Kohlman_ts, main = "Kohlman Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(GERVAIS_ts, main = "Gervais Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(KellerMB_ts, main = "Keller (Main Bay) Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(Round_ts, main = "Round Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(Willow_ts, main = "Willow Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(Phalen_ts, main = "Phalen Lake", xlab = "date", ylab = "[Cl] (mg/L)" )

plot.zoo(PELTIER_ts, main = "Peltier Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(GEORGEWATCH_ts, main = "George Watch Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(MARSHAN_ts, main = "Marshan Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(RICE_ts, main = "Rice Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(BALDWIN_ts, main = "Baldwin Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(LONG_ts, main = "Long Lake", xlab = "date", ylab = "[Cl] (mg/L)" )

plot.zoo(LUCY_ts, main = "Lucy Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(ANN_ts, main = "Ann Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(SUSAN_ts, main = "Susan Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(RICEMARSH_ts, main = "RiceMarsh Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(RILEY_ts, main = "Riley Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(GRASS_ts, main = "Grass Lake", xlab = "date", ylab = "[Cl] (mg/L)" )

plot.zoo(BROWNIE_ts, main = "Brownie Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(CEDAR_ts, main = "Cedar Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(LAKEOFTHEISLES_ts, main = "Lake of the Isles", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(BDEMAKASKA_ts, main = "Bde Maka Ska Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(HARRIET_ts, main = "Harriet Lake", xlab = "date", ylab = "[Cl] (mg/L)" )
plot.zoo(HIAWATHA_ts, main = "Hiawatha Lake", xlab = "date", ylab = "[Cl] (mg/L)" )

#movable dygraphs
dygraph(Kohlman_ts) %>%
  dyRangeSelector(height = 20)
dygraph(GERVAIS_ts) %>%
  dyRangeSelector(height = 20)
dygraph(KellerMB_ts) %>%
  dyRangeSelector(height = 20)
dygraph(Round_ts) %>%
  dyRangeSelector(height = 20)
dygraph(Willow_ts) %>%
  dyRangeSelector(height = 20)

dygraph(PELTIER_ts) %>%
  dyRangeSelector(height = 20)
dygraph(GEORGEWATCH_ts) %>%
  dyRangeSelector(height = 20)
dygraph(MARSHAN_ts) %>%
  dyRangeSelector(height = 20)
dygraph(RICE_ts) %>%
  dyRangeSelector(height = 20)
dygraph(BALDWIN_ts) %>%
  dyRangeSelector(height = 20)
dygraph(LONG_ts) %>%
  dyRangeSelector(height = 20)

dygraph(LUCY_ts) %>%
  dyRangeSelector(height = 20)
dygraph(ANN_ts) %>%
  dyRangeSelector(height = 20)
dygraph(SUSAN_ts) %>%
  dyRangeSelector(height = 20)
dygraph(RICEMARSH_ts) %>%
  dyRangeSelector(height = 20)
dygraph(RILEY_ts) %>%
  dyRangeSelector(height = 20)
dygraph(GRASS_ts) %>%
  dyRangeSelector(height = 20)

dygraph(BROWNIE_ts, main = "BROWNIE") %>%
  dyRangeSelector(height = 20)
dygraph(CEDAR_ts, main = "CEDAR") %>%
  dyRangeSelector(height = 20)
dygraph(LAKEOFTHEISLES_ts, main = "LAKE OF THE ISLES") %>%
  dyRangeSelector(height = 20)
dygraph(BDEMAKASKA_ts, main = "BDE MAKA SKA") %>%
  dyRangeSelector(height = 20)
dygraph(HARRIET_ts, main = "HARRIET") %>%
  dyRangeSelector(height = 20)
dygraph(HIAWATHA_ts, main = "HIAWATHA") %>%
  dyRangeSelector(height = 20)
