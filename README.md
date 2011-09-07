# Heroku Memcached

A simple extension to use Memcache on Heroku.


## Installation

These instructions are for Radiant v1.0.0.rc3 or above which uses
Bundler.

Add the following to your Radiant Gemfile :

```
group :production do
  gem "radiant-heroku_memcached-extension", "~> 1.0.0"
end
```

Then run :

```
bundle install
```

Remember to enable memcahed for your Heroku install :

```
heroku addons:add memcache
```
