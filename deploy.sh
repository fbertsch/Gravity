jekyll build
aws s3 sync _site s3://frankbertsch.com --profile personal
