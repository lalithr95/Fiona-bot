#!/bin/sh

cd /app

echo "Setting up SSH"
mkdir /app/.ssh
echo "$SSH_PRIVATE_KEY" > .ssh/id_rsa
echo "Host heroku.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

echo "Cloning ..."
git clone $APPNAME_GITHUB_URL
cd /app/Github-visualization
echo "Adding Heroku URL"
git remote add prod $APPNAME_PRODUCTION_URL

echo "Pushing to Heroku"
git checkout master
git push prod master

echo "Cleaning"
rm -rf /app/Github-visualization
rm -rf /app/.ssh

exit 0