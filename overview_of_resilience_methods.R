library(tidyverse)
library(sf)
library(tmap)
library(scales)

file.path <- choose.files()

## Making a map

resilience_indicators_sf <- st_read(file.path)

everyday_sf <- resilience_indicators_sf %>% 
  filter(resilience_type == 'Everyday')

tm_shape(everyday_sf)+
    tm_fill('dist', palette = '-viridis', n = 20)
    


resilience_indicators_tibble <- 
    resilience_indicators_sf %>% 
    as_tibble()






resilience_indicators_tibble %>% 
    ggplot(aes(dist, StdAreaKm2))+
    geom_point(aes(color = resilience_type))+
    geom_smooth()+
    scale_y_log10(labels = comma)+
    scale_y_log10(labels = comma)+
    theme_minimal()+
    labs(x = 'Mean distance to resilience indicator', 
         y = 'Datazone size in square kilometres', 
         title = 'Clear differences in resilience type and distance from populations', 
         color = 'Resilience Type')
    






# Rural-Urban Scotland ----------------------------------------------------

## datafiles are found here

browseURL('https://data.gov.uk/dataset/f00387c5-7858-4d75-977b-bfdb35300e7f/scottish-government-urban-rural-classification')



# unzip files

unzip('/Users/emeador/AppData/Local/Microsoft/Windows/INetCache/IE/8KL139ZD/SG_UrbanRural_2016.zip')




sg_urban_rural_2016 <- read_sf('C:/Users/emeador/Downloads/SG_UrbanRural_2016 (1)/SG_UrbanRural_2016.shp')





tm_shape(everyday_sf)+
    tm_fill('dist', palette = '-viridis', n = 20)+
tm_shape(sg_urban_rural_2016)+
    tm_borders()









sg_urban_rural_2016


























