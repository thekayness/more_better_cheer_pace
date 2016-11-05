
CheerPace!

Self-paced courses are hard to stay motivated in, let's change this by cheering each other on!  CheerPace is meant to be a place where we can (gently) hold each other accountable for finishing that awesome online course we still haven't finished. Users can:
	enter a course they plan on taking
	enter/update tasks associated with a course
	offer others encouragement with their courses

* Ruby version ~ 2.3.1

## Installation

To use this app hosted locally on a rails server, clone this repository, run 

```sh
bundle install
```	
to install all associated gems,

migrate the database:
```sh
rake db:migrate
```	
seed the database with my awesome example data:
```sh
rake db:seed
```	
and finally launch the rails server with:
```sh
rails s
```	

## Development setup
This app uses OAuth with the Devise gem for logging in via github, and requires an app id and app secret. If you register your own app with Github, you can configure your app id and app secret in the 
```sh
config/initializations/devise.rb
```	
file.

If you'd like to take some tests for a spin, you can run the rspec tests in the spec folder

```sh
rspec spec
```
## Contributions

You can find plans for future features in TODO.md.  Contributions are very welcome!

Distributed under the https://opensource.org/licenses/MIT license. Feel free to help yourself, tweet me what you think at @kayjsmyth.