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

5. Download the appropriate gems
```bash
bundle install
```

6. Enable CAS

Copy and paste the contents of `/config/settings.yml` to `/config/environments/development.local.yml` and update the settings.

7. Start the server
```bash
rails s
```

## LiveReload
LiveReload can potentially be very helpful for frontend and backend development.
  
-  You will need a plugin for [chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) or [firefox](https://addons.mozilla.org/en-us/firefox/addon/livereload/).
-  Run guard ```guard start``` from the project root to monitor changes on the fs, and start rails ```rails server```.  
-  There's also a cheat using the packaged foreman routine ```forman start```, which will run both and stop both: [read more here](http://blog.daviddollar.org/2011/05/06/introducing-foreman.html)


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
_(Not meant to be through at this point)_

- __/api/user__:
  - __logged_in__: true/false boolean
  - __uid__: (if logged in, uid string)

- __/api/user/{uid}__: Eventually return something useful (name, profile information)
  - __uid__: <uid string>
  - __widget_data__: <JSONObject>