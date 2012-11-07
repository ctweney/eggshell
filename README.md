#Eggshell [![Build Status](https://secure.travis-ci.org/ets-berkeley-edu/eggshell.png)](http://travis-ci.org/ets-berkeley-edu/eggshell)

The pre-release of CalCentral

## Dependencies

* [Ruby 1.9.3-p286](http://www.ruby-lang.org/en/)
* [Rubygems](http://rubyforge.org/frs/?group_id=126)
* [Rails 3.2.8](http://rubyonrails.org/download)
* [Bundler](http://gembundler.com/rails3.html)
* [Rvm](https://rvm.io/rvm/install/) - Ruby version managers

## Installation

1. Install postgres
```bash
brew update
brew install postgresql
initdb /usr/local/var/postgres
```

2. Start postgres, add the user and create the necessary databases
```bash
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
psql postgres
create database eggshell_development;
create user eggshell_development with password 'secret';
grant all privileges on database eggshell_development to eggshell_development;
create database eggshell_production;
create user eggshell_production with password 'secret';
grant all privileges on database eggshell_production to eggshell_production;
create database eggshell_test;
create user postgres;
grant all privileges on database eggshell_test to postgres;
alter role postgres with createdb;  # DEVELOPER MACHINES ONLY
```

3. Fork this repository, then:
```bash
git clone git@github.com:[your_github_acct]/eggshell.git
```

4. Go inside the `eggshell` repository
```bash
cd eggshell
```

5. Install jruby
```bash
rvm install jruby-1.7.0
```

6. Download the appropriate gems
```bash
bundle install
```

7. Enable CAS

Copy and paste the contents of `/config/settings.yml` to `/config/environments/development.local.yml` and update the settings.

8. Start the server
```bash
rails s
```

## LiveReload

See code changes happening live in the browser.
LiveReload can potentially be very helpful for front-end and back-end development.

- Run `foreman start` in the terminal, it will run both the rails server and guard. [Read more here](http://blog.daviddollar.org/2011/05/06/introducing-foreman.html)


## Debugging

### Emulating production mode locally

1. Precompile the assets: [(more info)](http://stackoverflow.com/questions/7275636/rails-3-1-0-actionviewtemplateerrror-application-css-isnt-precompiled)
```bash
bundle exec rake assets:precompile
```

2. Serve static assets through rails
```
config.serve_static_assets = true
```

3. Start the server in production mode
```bash
rails s -e production
```

4. After testing, remove the static assets and generated pages
```bash
bundle exec rake assets:clean
rm public/index.html
# remove other pages ...
```

### Styleguide

* Use an editor that supports [.editorconfig](http://editorconfig.org/#overview). Feel free to have a look at the [editor plug-ins](http://editorconfig.org/#download)
* Use `data-ng-` instead of `ng-` or `ng:`

:-1:
```html
<ng:view>
<span ng-bind="name"></span>
```
:+1:
```html
<div data-ng-view></div>
<span ng-bind="name"></span>
```

### Segmentation fault

```bash
.../lib/sqlite3/sqlite3_native.bundle: [BUG] Segmentation fault
```

Fix it with running:

```bash
gem uninstall sqlite3
gem install sqlite3
```

## API Endpoints:
_(Not meant to be thorough at this point)_

- __/api/user__:
  - __logged_in__: true/false boolean
  - __uid__: (if logged in, uid string)

- __/api/user/{uid}__: Eventually return something useful (name, profile information)
  - __uid__: <uid string>
  - __widget_data__: <JSONObject>

## Oracle

* Download ojdbc6.jar from http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html
* Save ojdbc6.jar in eggshell/lib

* Before connecting to campusdb_development, set the secret variables:

```bash
export ORACLE_USER=yer_username
export ORACLE_PASSWORD=yer_password
export ORACLE_DATABASE=yer_host:yer_port/yer_sid.berkeley.edu
```

* And test:
```bash
rspec spec/lib/campus_data_spec.rb
```

On Mac OS X, to get RubyMine to pick up the necessary environment variables, open a new shell, set the environment variables, and:
```bash
/Applications/RubyMine.app/Contents/MacOS/rubymine &
```
