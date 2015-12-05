#!/bin/bash

function installStandalonePuppet(){
	puppet help >/dev/null 2>&1
	if [ $? == "0" ]; then
		echo "Cool, puppet available ..."
	else		
		echo "Download puppet debian package ..."
		wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
		echo "Install debain package ..."
		dpkg -i puppetlabs-release-precise.deb
		apt-get update
		echo "Installing puppet ..."
		apt-get install -y puppet
	fi
}

function installPuppetModules(){
	# Install puppet module jenkins
	puppet module install rtyler-jenkins
}

function listPuppetModules(){
	# List puppet available modules 
	puppet module list
}

function setHostName(){
	# Check hostname entry
	cat /etc/hostname |grep jenkins.example.com >/dev/null 2>&1
	
	if [ $? == "0" ]; then
		echo "Cool, HostName entry available ..."
	else
		echo "Adding HostName into hosts file ..."
		echo "jenkins.example.com" > /etc/hostname
		hostname jenkins.example.com
	fi
}

function modifyHostsFile(){
	# Check hosts file entry
	cat /etc/hosts |grep jenkins.example.com >/dev/null 2>&1
	
	if [ $? == "0" ]; then
		echo "Cool, Hosts file entry available ..."
	else
		echo "Adding HostName into hosts file ..."
		echo "127.0.1.1 jenkins.example.com" >> /etc/hosts
	fi		
}

function installJenkins(){
	currentDirectory=`pwd`
	# Change dir to /etc/puppet/manifests
	cd /etc/puppet/manifests
	# Copy manifest file
	cp $currentDirectory/files/jenkins.pp .
	# Install jenkins
	puppet apply jenkins.pp --debug
}



function main(){
	installStandalonePuppet
	installPuppetModules
	listPuppetModules
	setHostName
	installJenkins
}

main
