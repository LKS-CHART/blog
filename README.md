# AA Blog

This is the repo for the AA blog.

- Blog: https://lks-chart.github.io/blog/

- Github repo (mirror): https://github.com/LKS-CHART/blog

- Gitlab repo: https://git.unity.local/dsaa/blog

Changes to the `main` branch will launch a new job on Github and re-render the blog. **To contribute to the blog, please clone the [Gitlab repo](https://git.unity.local/dsaa/blog) and create a MR on Gitlab**

# Blog Team

- Derek Beaton

- Chloe Pou-Prom

- Meggie Debnath

# Contribute to the blog

- Clone this repo from Gitlab

- Activate the renv environment: `renv::activate()`

- Start a new branch

- Create a new post: `distill::create_post("TITLE OF YOUR BLOG POST", draft = TRUE)` This will create a new folder in the `_posts` folder. In this folder you will find a new Rmd file. The Rmd file is the one you will edit with your blog post content.

- Edit the header of the Rmd file to include the correct author information and to add categories to the blog post. 

    - Include the type of post: e.g., `post-journal-club`, `post-extended-standup`, `post-paper-summary` (for DSAA papers), `post-perspective` (opinions, perspectives on healthcare/data science/work), `post-miscellaneous`

    -  If relevant, include a language category: e.g., `language-R`, `language-python`, `language-javascript`
    
    -  If relevant, include the project: e.g., `project-chartwatch`, `project-rushh`, `project-hemo`
    
    - Other categories could for example be the package/library name (e.g., `funneljoin`, `modelstudio`), a data-science topic (e.g., `anomaly-detection`, `dei`), or a modeling technique or ML field (e.g., `logistic-regression`, `nlp`)

- Write your blog post following [Markdown syntax](https://www.markdownguide.org/basic-syntax/).

- To render your blog post, knit the document.

- To render the entire website, run the `Build Website` command in the Build tab of RStudio.

- For more details, refer to the [Style Guidelines and Formatting](https://app.clickup.com/2346452/v/dc/27kem-18987/27kem-51722) document.

# Review process

## Writer

- Create a PR on Github.

- Tag the blog team members as reviewers.

- Make any edits based on the comments from the reviewers.

- Merge the PR when it's approved.

## Blog team

- It's the blog team's responsibility to publish the blog post(s) according to schedule.
    
- When it's time to release a new blog post, create a new PR with the following changes: 

    - In the blog post Rmd file, update `draft: true` to `draft: false`.
    
    - In the blog post Rmd file, set the date to the release date.

    - Rename the blog post directory with the `distill::rename_post_dir(post_dir = "_posts/[OLD_DIRECTORY]", date_prefix="[DATE_TO_BE_PUBLISHED]")` where `DATE_TO_BE_PUBLISHED` is in the `"YYYY-MM-DD"` format. 

- Re-knit the blog post and re-build the website.

- Once the PR is merged to the `main` branch, the changes will be reflected on the blog.
