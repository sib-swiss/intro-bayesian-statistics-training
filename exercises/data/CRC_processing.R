
library(tidyverse)

load("./CRC_Indidence_Data_all.rData")

CRC_Incidence_Data %>% group_by(age, sex, race, registry) %>% 
  summarise(cancers = sum(cancers), noncancers = sum(noncancers), .groups = "drop") %>% 
  mutate(total = cancers + noncancers, age_s = (age - 50)/10) -> CRC_df

save(CRC_df, file = "./CRC_Data.rData") 

