
# Launch
## for local
### required

- Ruby 3.1.1
- Rails 7.0.3
- Mysql 5.7
- Redis

### set up

*start rails server*
```bash
$ bundle install --path .bundle
$ npm install
$ bundle exec rails db:migrate
$ bundle exec rails assets:precompile
$ bundle exec rails server
```

*start redis server*

```
$ redis-server
```
* local server


## for docker

```
$ docker-compose up
```
# Test case

### Model
### Controller 
### Integration


