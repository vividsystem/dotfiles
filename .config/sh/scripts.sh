#!/bin/sh

function createproject(){
	mkdir ~/Developer/Code/Projects/$1
	touch ~/Developer/Code/Projects/$1/README.md
	touch ~/Developer/Code/Projects/$1/.gitignore
	cd ~/Developer/Code/Projects/$1/
	git init
	git add .
	git commit -m 'initial commit'
	code .
}
