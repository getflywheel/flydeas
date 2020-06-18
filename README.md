# FLYDEAS

This README will go into a little more detail than may be necessary in other
repos for the sake of less experienced devs / interns (like myself) who
are still getting familiar with development standards and such.

## Table of contents
* [Requirements](#requirements)
* [Installation](#installing-and-running)
* [Developing & Standards](#developing-and-standards)
* [Deploying](#deploying)
* [Tips & Resources](#tips-and-resources)


## Requirements
First we'll go through a few things we need to get the app running locally
on your computer.

### Postgres
Postgres is the database we use with rails. The postgres app will 
allow you to get started with the database without needing to know
all the command line commands out of the gate. 
 
[Postgres set up guide](https://postgresapp.com/)
[Postgres usage](http://postgresguide.com/utilities/psql.html)

We'll get into setting up our local database in the [installation section](#installing-and-running). 

### Ruby/Rails
The link below will step you through setting up rails on your Mac. 
The optional steps at the end of the article are worth doing as well because 
iTerm and zsh are useful to have. 

[Rails set up guide](https://launchschool.com/blog/how-to-install-ruby-on-rails-development-environment-for-mac-os-x)

This application currently installs Rails version `4.2.11`. The minimum Ruby version is `1.9.3`; recommended Ruby version is `2.2`. If you use [rvm](https://rvm.io/)/[rbenv](https://github.com/rbenv/rbenv) to manage Ruby versions in your environment, you can add this version to your [.ruby-version](./.ruby-version) in the root directory to ensure use of the appropriate version for this application.
[Ruby & Rails Compatibility Table](https://www.fastruby.io/blog/ruby/rails/versions/compatibility-table.html)

### Yarn
Yarn is a package manager for JavaScript. We will use it to install sass lint.
That's okay if you don't know what that means, its explained later in the 
README [here](#Linters).
To install it just run the following:

`brew install yarn`

This assumes you've already installed brew during the rails set up guide.

### Direnv
In your terminal you have environment variables that are typically global in
terminal so that every directory has the same set of environment variables. 
Direnv allows you to specify variables depending on the directory you are currently 
in.

[Direnv set up guide](https://direnv.net/)

To make sure the install worked you can set environment variables in a
directory in a .envrc file and run the command `printenv` and see if the
 variables are set. Then you can run the same command in a different directory
and make sure those same variables are not set.
 
## Installing and Running 

### Cloning the repo
To set up the repo just run the following command where
you want your git repo to live.

`git clone https://github.com/getflywheel/flydeas.git`

### Install gems
Gems are Ruby's version of dependencies. The list of gems is kept in 
the `Gemfile`. After cloning the repo you can first make sure your system
is up to date with 

`gem update --system`

Install bundler with

`gem install bundler`

and then install the dependencies in the Gemfile with 

`bundle install`

### Configurations

#### Send Grid
We use send grid to send our emails and have it set up to pull the username
and password from environment variables. Add the following lines to the .envrc 
file in your flydeas directory.

`export SENDGRID_USERNAME=flywheeldev`

`export SENDGRID_PASSWORD=getthisfrom1password`

### Setting up the database
To set up your database instance you can start with 

`rake db:create`

This will create an empty database instance for you. If you already have 
an instance and need to reset it you can reload the schema using the
following command.

`rake db:schema:load`

To seed the development database

`rake db:seed`

### Start the app

To start a server so that you can access the site locally, run the following:

`rails server` or equivalently `rails s

#### Redis & Resque
We use redis and resque to delay tasks like sending emails 
and in the future it could be used to delay expensive tasks to reduce 
the server load. Currently the following commands all need to be run
and kept running in separate command line windows to run the site.

You will need to install Redis. (ie. for OSX: `brew install redis`)

`redis-server`

`rake resque:scheduler`

`QUEUE=emails rake resque:work`

### Accessing the site
If everything is installed correctly and running you should be able to access
the site here [http://localhost:3000/](http://localhost:3000/) 
If this brought you to the sign in page you did it!

![yay](https://media.giphy.com/media/nXxOjZrbnbRxS/giphy.gif)

If its not working, I'm sure one of the other devs would be happy to help as
this stage can be frustrating when you're not sure what does what. 

#### Logging in with the test user
username: 'test'
password: 'Flywheel1!'

#### Signing up a new user
- Click 'SignUp' in the running application.
- Fill out the application information
    - `getflywheel.com` domain required for Email
- Click 'Create Account'

#### Activating the new username
The new user account must be activated to allow login. In the case that the provided
email exists, an activation link should be sent to that address. If it does not, extra
developer steps are needed.

Locate the user's `activation_token`. This can be done by logging in to the postgres
console.

`psql -h localhost -U username databasename`

```
psql $ select activation_digest from users where username = 'new-flydeas-username-here'

   activation_digest
------------------------
 -ReDqKcnrUfbfN2TdCQU5Q
(1 row)
```

In your running application, visit `localhost:3000/account_activations/<activation-digest>/edit`.
You should now be able to log in with your newly created and activated user.

## Developing and Standards
Here are some of the developing standards we have in place to help keep things
neat.

### Git

#### Rebase vs Merge
We use rebasing instead of merging because it helps keep the history of the
repository clean 
If your not aware of the differences here's a good intro article to get you
up to speed. 

[rebase vs merge](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)

### Test Driven Development
[Test driven development](https://en.wikipedia.org/wiki/Test-driven_development)
is used in this project as it's a good habit to get new developers into 
and has numerous benefits for the repo itself. The idea is that you make
the tests for your code before you write the code itself. This way you know 
exactly what you need to accomplish with the code and that it works once you
are done. 

#### Running Tests
Tests are written and run using RSpec. Best practice is to maintain a mirror
of the app directory structure in the `spec` directory.

Run the entire suite:

`rspec`

Run an individual spec file:

`rspec spec/models/user_spec.rb`

Run an individual example by line number:

`rspec spec/models/user_spec.rb:15`

### Coverage
Code test coverage is analyzed using `simplecov` and is configured to run at the
end of an RSpec run. Results can be found in the `coverage` directory and can be
viewed in a nice series of static html pages by opening (./coverage/input.html)
in your web browser.

### Linters
[Linters](https://en.wikipedia.org/wiki/Lint_%28software%29)
are tools that scan your code to check if you have broken any coding standards
like for example exceeding 80 characters in a line.

![tabs not spaces gif](https://media.giphy.com/media/l0IylSajlbPRFxH8Y/giphy.gif) 

Linters are particularly useful for those of us who are just getting started
in any of these languages because it teaches us how our code is supposed to
look. It also helps maintain a consistent code base even with highly variable
levels of experience in the developers. The goal is to have the repo 100% 
rubocop compliant. 

To run rubocop and get a list of issues use the following:

`rubocop` or for a specific file `rubocop path/to/file.rb` 

Some editors also have rubocop extensions that show suggestions when you break
a rule. You can also set up hooks so that rubocop runs before you try to
commit a change. 

For sass files:

`yarn sasslint` 

## Deploying 
We use Heroku to deploy our app. It is set up to automatically deploy whenever master is updated. 

## Tips and Resources
[Git Cheat Sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
