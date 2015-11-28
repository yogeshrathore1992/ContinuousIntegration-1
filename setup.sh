#!/bin/bash

function installStandalonePuppet(){
	# Download puppet debian package 
	wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
	# Install debain package 
	dpkg -i puppetlabs-release-precise.deb
	apt-get update
	# Install puppet 
	apt-get install -y puppet
}

function installPuppetModules(){
	# Install puppet module jenkins
	puppet module install rtyler-jenkins
}

function listPuppetModules(){
	# List puppet available modules 
	puppet module list
}

function main(){
	installStandalonePuppet
	installPuppetModules
	listPuppetModules
}

main
