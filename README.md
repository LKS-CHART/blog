# AA Blog

This is the repo for the AA blog.

-   Blog: <https://lks-chart.github.io/blog/>

-   Github repo (mirror): <https://github.com/LKS-CHART/blog>

-   Gitlab repo: <https://git.unity.local/dsaa/blog>

Changes to the `main` branch will launch a new job on Github and re-render the blog. **To contribute to the blog, please clone the [Gitlab repo](https://git.unity.local/dsaa/blog) and create a MR on Gitlab**

# Blog Team

-   Derek Beaton

-   Chloe Pou-Prom

-   Meggie Debnath

# Contribute to the blog

-   Clone this repo from Gitlab

-   Activate the renv environment: `renv::activate()`

-   Start a new branch

-   Create a new post: `distill::create_post("TITLE OF YOUR BLOG POST")` This will create a new folder in the `_posts` folder. In this folder you will find a new Rmd file. The Rmd file is the one you will edit with your blog post content.

-   Edit the header of the Rmd file to include the correct author information and to add categories to the blog post.

    -   Include the type of post: e.g., `post-journal-club`, `post-extended-standup`, `post-paper-summary` (for DSAA papers), `post-perspective` (opinions, perspectives on healthcare/data science/work), `post-miscellaneous`

    -   If relevant, include a language category: e.g., `language-R`, `language-python`, `language-javascript`

    -   If relevant, include the project: e.g., `project-chartwatch`, `project-rushh`, `project-hemo`

    -   Other categories could for example be the package/library name (e.g., `funneljoin`, `modelstudio`), a data-science topic (e.g., `anomaly-detection`, `dei`), or a modeling technique or ML field (e.g., `logistic-regression`, `nlp`)

    -   Your header might resemble something like this:

    ```         
    ---
    title: "Is my AI Discriminatory?"
    description: |
      A discussion about bias in healthcare AI, and building models with fairness and ethics in mind. [5 min read]
    author:
      - name: Meggie Debnath
        affiliation: DSAA, Unity Health Toronto
        affiliation_url: https://chartdatascience.ca
    date: 2022-06-21
    output:
      distill::distill_article:
        toc: true
    categories:
      - post-journal-club
      - bias-fairness-ethics
    draft: false
    preview: ai-biases.jpg
    bibliography: refer.bib
    ---
    ```

-   Write your blog post following [Markdown syntax](https://www.markdownguide.org/basic-syntax/).

-   To render your blog post, knit the document.

-   To render the entire website, run the `Build Website` command in the Build tab of RStudio.

-   For more details, refer to the [Style Guidelines and Formatting](https://app.clickup.com/2346452/v/dc/27kem-18987/27kem-51722) document.

# Review process

## For writers:

-   Create a MR on Gitlab.

-   Tag the blog team members as reviewers.

-   Make any edits based on the comments from the reviewers.

-   Update the date when the MR is ready to be merged (if applicable) and then merge the MR.

## For the blog team:

-   Before approving the MR, check the following:

    -   The date in the Rmd header reflects the date the post will be published.

    -   Categories are included in the Rmd header.

-   Once the MR is merged to the `main` branch, Gitlab CI will ensure the Rmd files in the blog are properly rendered. The changes will then be mirrored to the Github repo and will trigger to Github job that deploys the site.


# Workflow

- Changes to the Gitlab main branch will trigger Gitlab CI:

    - The blog files are re-rendered and any changes are pushed to the Gitlab main branch.
    
    - Gitlab CI requires that the `ACCESS_TOKEN` variable be set in: Settings > CI/CD > Variables. If you need to re-set this token, you can do so in: Settings > CI/CD > Project Access Tokens.

- Through mirroring, changes in the Gitlab main branch are pushed to the Github main branch.

- Changes in the Github main branch will trigger the Github job that deploys the site.
