install.packages(c("data.table", "magrittr", "fst", "ggplot2", "ggpubr", "officer", "rvg", "tableone", "gtsummary", "MatchIt", "twang", "usethis", "gitcreds"))


## setting: permanent storage
credentials::credential_helper_set("manager")  

## create a personal access token for authentication:
usethis::create_github_token()

## copy and paste your token and press enter
credentials::set_github_pat()

#### 4. Restart R! ###########################################################

# ----------------------------------------------------------------------------

#### 5. Verify settings ######################################################

usethis::git_sitrep()

## Your username and email should be stated correctly in the output. 
## Also, the report shoud cotain something like:
## 'Personal access token: '<found in env var>''

# ----------------------------------------------------------------------------