#!/bin/sh
cd /home/local/BIOREFERENCE-NJ/rkreyhsig9620/pandera
ssh -vT git@github.com
echo " " >> README.md
git add .
git commit -m "Updating README"
git push git@github.com:ricky1477/pandera.git

