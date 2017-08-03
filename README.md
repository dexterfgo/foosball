# Terem's Foosball Ranking System

Mini Ruby on Rails programming challenge project.

## Task

### Introduction

A sample project to test technical brilliance amongst our interview candidates.

Implement the following specifications as near as possible to a production application.

This should include significant thought towards architecture and extensibility and any other activities that would happen in developing a production ready application for a client. You may contact us to ask questions or clarifications.

### Project Overview

Terem technologies has a foosball table in the common room. In order to settle the oft asked question of who is the foosball champion, the team has elected to store the results of every game. To facilitate this process a new system will be built. The Foosball Ranking System.

### Requirements

a. User Stories

The key features of the solution may be:

- As a user, I can record the results of matches (no login requirements)
	- Able to enter the participants and the winner(s)
	- Assume the date of entry is the date of the match
	- Handle X vs X matches (1v1, 1v2, 2v2 etc)
- As a user, I can view the win rates
	- The overall win loss rate of a participant
	- The win loss rate of a participant against another specific participant

b. Bonus goals:

- Use a graphing API to show the win rates VS time.
- Add in something you think is cool (e.g. a design pattern, interesting approach to solution, a feature). Show us something impressive.

## Solution

### Dependencies

- Ruby 2.4.1
- Rails 5.1.1
- PostgreSQL 0.20.0
- Bundler 1.14.6
- Chartkick 2.2.4

For full list of required gems, see [Gemfile](https://raw.githubusercontent.com/dexterfgo/foosball/master/Gemfile).

### Usage

#### Option A: AWS EC2

- If you don't need to do a local launch, an instance of the app is deployed on [Amazon EC2](http://ec2-52-64-162-178.ap-southeast-2.compute.amazonaws.com/). Just [follow this link](http://ec2-52-64-162-178.ap-southeast-2.compute.amazonaws.com/) to run that instance.

#### Option B: Local Launch

- If you want to setup a local instance for testing and tweaks, follow the following steps.

- To launch app locally, launch your terminal.
	- Clone the foosball workspace.

	```
	>> git clone git@github.com:dexterfgo/foosball.git
	```
	
	- If you run into a dependency error, try using a more recent version of ruby 2.4.1. If you use rvm (which I recommend if you are using different versions for different projects), you can:

	```
	>> rvm install ruby-2.4.1 && rvm use ruby-2.4.1
	```
	
	- If you haven't installed postgresql server on your workstation yet, you can follow [this installation guide for OSX](https://www.codementor.io/devops/tutorial/getting-started-postgresql-server-mac-osx) or [this installation guide for Debian systems](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04).
	
	- Install all your gems using bundler.

	```
	>> bundle install
	```
	
	- Create database and run migrations.
	
	```
	>> rake db:setup && rake db:migrate
	```
	
	- Run your local rails server
	
	```
	» rails s
	=> Booting Puma
	=> Rails 5.1.1 application starting in development on http://localhost:3000
	=> Run `rails server -h` for more startup options
	Puma starting in single mode...
	* Version 3.8.2 (ruby 2.4.1-p111), codename: Sassy Salamander
	* Min threads: 5, max threads: 5
	* Environment: development
	* Listening on tcp://0.0.0.0:3000
	Use Ctrl-C to stop
	
	```
	
	
	- Open your browser and go to [Port 3000 of your http localhost as indicated](http://localhost:3000/).


### Existing Issues
Unresolved issues are tracked in [the Github Issues Tab](https://github.com/dexterfgo/foosball/issues) for this repository.


## Credits

- [Chartkick](http://chartkick.com/) for easy useable charts.
- [Groupdate](https://github.com/ankane/groupdate) to parse dates and times. 

## History

View the [changelog](https://github.com/dexterfgo/foosball/blob/master/CHANGELOG.md)

## Contributing

- [Report bugs](https://github.com/dexterfgo/foosball/issues)
