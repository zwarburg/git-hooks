#!/bin/bash
############################
# cd .... /git-hooks
# chmod +x .make.sh
# ./.make.sh
############################

########## Variables

path=~/src   # directory where all your git projects are stored. I store them at ~/src 

##########

# Create folder for git-templates
echo "Creating .git-templates/hooks folder at ~/"
mkdir -p ~/.git-templates/hooks

# Move files into that folder
cp /hooks/. ~/.git-templates/hooks

# Add folder to the .git config
git config --global init.templatedir '~/.git-templates'

# CD into each project and re-initialize it
cd $path
for dir in *
do
	cd $dir
	echo "Reinitializing $dir"
	git init
	cd ../
done
