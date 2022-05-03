# AA Blog

This is the repo for the AA blog.

Link: https://lks-chart.github.io/blog/

Changes to the `main` branch will launch a new job and re-render the blog.

# Contribute to the blog

- Clone this repo

- Activate the renv environment: `renv::activate()`

- Start a new branch

- Create a new post: `distill::create_post("TITLE OF YOUR BLOG POST", draf = TRUE)` This will create a new folder in the `_posts` folder. This is where you will work on your blog post. 

- Write your blog post following [Markdown syntax](https://www.markdownguide.org/basic-syntax/).

- To render your blog post, knit the document.

- To render the entire website, run the `Build Website` command in the Build tab of RStudio.

- For more details, refer to the [Style Guidelines and Formatting](https://app.clickup.com/2346452/v/dc/27kem-18987/27kem-51722) document.

# Review process

## Writer

- Create a PR on Github.

- Tag the blog team members as reviewers.

- Make any edits based on the comments from the reviewers.

- Merge the PR when it's approved

## Blog team

- It's the blog team's responsibility to publish the blog post(s) according to schedule.
    
- When it's time to release a new blog post, create a new PR with the following changes: 

    - In the Rmd file, update `draft: true` to `draft: false`.
    
    - In the Rmd file, set the date to the release date.

- Once the PR is merged to the `main` branch, the changes will be reflected on the blog.