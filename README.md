# Photo App

## Overview

This is a photo collection and tweet posting app for assignments.

## Installation

1. Ruby version
```
3.0.2
```
2. Install Gems
```bash
$ gem install bundler
$ bundle config set --local path 'vendor/bundle'
$ bundle install
```
3. Database initialization
```bash
$ bundle exec rails db:migrate
$ bundle exec rails db:seed
```
4. Install webpacker
```
$ bundle exec rails webpacker:install
```
5. Run the test suite [TBA]
```bash
bundle exec rails test
```
6. Rails server start
```bash
$ bundle exec rails s
```
7. Access service url
```
http://localhost:3000/
```
