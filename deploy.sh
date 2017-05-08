jekyll build
cp _includes/google4ec338ed4b6982ff.html _site/
aws s3 sync _site s3://frankbertsch.com --profile personal
