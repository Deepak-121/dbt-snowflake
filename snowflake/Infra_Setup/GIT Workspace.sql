CREATE OR REPLACE API INTEGRATION INT_GIT
  API_PROVIDER = GIT_HTTPS_API
  API_ALLOWED_PREFIXES = ('https://github.com/Deepak-121/dbt-snowflake.git')
  ENABLED = TRUE;

CREATE OR REPLACE SECRET GIT_TOKEN
  TYPE = PASSWORD
  USERNAME = 'Deepak-121'
  PASSWORD = '<YOUR_GITHUB_FINE_GRAINED_PAT>';


Setup Git Workspace:-

Repository:  https://github.com/Deepak-121/dbt-snowflake.git
API Integration:  INT_GIT
Authentication:  Personal Access Token
Secret: GIT_TOKEN
Branch: main


--Testing

show git repositories;
show stages;
show secrets;
show integrations;
desc api integration int_git;
DESC SECRET USER$DEEPAK.PUBLIC.GIT_TOKEN;