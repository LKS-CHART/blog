# Script to get daily counts of labs in silent test data

folders <- "/mnt/research/LKS-CHART/Projects/gim_ews_project/deployment/archive/"

i <- 1
all_eletrolyte_results <- list()
for (folder in list.files(folders, pattern = "input", full.names = TRUE)) {
    if (length(list.files(folder)) > 0 & "lab_results.Rda" %in% list.files(folder)) {

        if (file.info(file.path(folder, "lab_results.Rda"))$size > 0) {
            load(file.path(folder, "lab_results.Rda"))  
            
            curr_date <- stringr::str_extract(folder, pattern = "[0-9]{4}_[0-9]+") %>% as.Date(format = "%Y_%m%d")
            electrolyte_lab_results <- lab_results %>%
                filter(as.Date(OBSERATIONDATETIME) == curr_date) %>%
                filter(FINDINGABBREVIATION %in% c("NA", "K", "CL", "CA", "GLPOC"))
            all_eletrolyte_results[[i]] <- electrolyte_lab_results
            i <- i + 1
        }
        
    }
}


electrolyte_results <- do.call(rbind, all_eletrolyte_results)

daily_counts <- electrolyte_results %>%
    mutate(date = as.Date(RESULTDATETIME)) %>%
    select(ENCOUNTER_NUM, RESULTDATETIME, FINDINGABBREVIATION, date) %>%
    unique() %>%
    count(date, FINDINGABBREVIATION) %>%
    tidyr::pivot_wider(names_from = FINDINGABBREVIATION, values_from = n)  %>%
    replace(is.na(.), 0) %>%
    mutate(cohort = case_when(
        date >= as.Date("2019-11-19") & date <= as.Date("2019-12-19") ~ "pre-fix",
        date >= as.Date("2019-12-20") & date <= as.Date("2020-01-20") ~ "post-fix"
    )) %>%
    filter(!is.na(cohort))

write.csv(daily_counts,
          file.path(here::here("_posts/2022-05-02-the-na-bug/"), "daily_electrolyte_counts.csv"),
          row.names = FALSE)