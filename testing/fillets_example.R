# Testing for exercises in L3

fish_fillets <- read_csv('datasets/fish_fillets.csv')

fish_fillets %>% group_by(species) %>% summarize(hardness=  mean(hardness, na.rm = TRUE), thickness = mean(thickness, na.rm = TRUE))
