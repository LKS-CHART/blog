library(dplyr)
library(distill)

rmd_filenames <- list.files("_posts", full.names = T, pattern = ".Rmd", recursive = T)

blog_posts <- data.frame(
    filename = rmd_filenames,
    ts = unlist(lapply(rmd_filenames, function(x) (as.character(file.info(x)$mtime))))
) 

most_recent_filename <- blog_posts %>%
    arrange(desc(ts)) %>%
    slice(1) %>%
    pull(filename)


rmarkdown::render(most_recent_filename)

distill::rename_post_dir(post_dir = dirname(most_recent_filename), date_prefix=Sys.Date())

rmarkdown::render_site("index.Rmd")
