# Introduction
*Project Name: Music Sharing*

A project with the main purpose of making it possible for people to share Youtube music videos with others

*Feature*

- User registration and login
- Sharing YouTube videos
- Viewing a list of shared videos
- Real-time notifications for new video shares: When a user shares a new video, other logged-in users should receive a real-time notification about the newly shared video.

# Required 

- *Framework*

Ruby on rails ( v7.0.3 )
( Ruby 3.1.1 )

- *Database*

Mysql5.7

- *Frontend*

Bootstrap 5

- *Background Job*

Redis

- *Test*

Rspec

# Installation & Configuration:

- Clone 
```
$ cd /path/to/workspace
$ git clone git@github.com:lampv318/music-sharing.git
$ cd music-sharing
```

- Install Ruby ( v3.1.1 )

```
$ brew install rbenv ruby-build
$ rbenv install 3.1.1
$ rbenv versions
  system
* 3.1.1 (set by /Users/name/.rbenv/version)

$ cd /path/to/workspace/music-sharing
$ rbenv local 3.1.1
```

- Install Rails ( v7.0.3 )

```
$ gem install rails -v 7.0.4.3
$ rails -v
Rails 7.0.3
```

- Install Mysql 5.7

```
$ brew install mysql@5.7
$ brew link mysql@5.7 --force
$ mysql --version
$ mysql.server start
```

- Redis

```
brew install redis
```

```
redis-server /usr/local/etc/redis.conf
```

# Database Setup

```
$ cd /path/to/workspace/music-sharing
$ bundle install --path .bundle
$ bundle exec rails db:migrate
```

# Running the Application

## For local
Run Rails server
```
$ cd /path/to/workspace/pa_web
$ bundle install --path .bundle
$ bundle exec rails assets:precompile
$ bundle exec rails server
```

Visit http://localhost:3000

- note: required redis-server is running

## For docker

```
$ docker-compose up
```

Visit http://0.0.0.0:3000/
( when server is started, need to click create database and migrate on browser ) 


## Testing 

```
bundle exec rspec spec
```

- Unit test
Model
```
# user model
describe 'validations' do
 # check the validation of the fields
end

describe 'associations' do
  # check associations
end

describe '#downcase_email' do
  # check method is working well
end

# shared_video model
describe 'validations' do
end

describe 'associations' do
end

context 'callbacks check' do
 # when a video is shared and then  perform notification broadcast job
end
```

Controller
```
# home controller
describe 'GET #index' do
  it 'should have @shared_video at home page' do
  end
end

# session_controller
describe 'POST #create' do
  context 'Login is Successfully' do
    it 'should have flash success and redirect_to root_url' do
    end
  end

  context 'Login is Failed' do
    it 'should have flash danger and redirect_to login_url' do
    end
  end
end

describe 'DELETE #destroy' do
  context 'Logout is Successfully' do
    it 'should logout and redirect_to root_url' do
    end
  end
end

# shared_video_controller
describe 'POST #create' do
  context 'Create shared video is Successfully' do
    it 'should have flash success and redirect_to root_url' do
    end
  end

  context 'Create shared video is Failed' do
    it 'should have danger success and redirect_to root_url' do
    end
  end
end

# user_controller
describe 'GET #new' do
  it '@user variable is defined' do
  end
end

describe 'POST #create' do
  it 'user should be created and redirect_to root_url' do
  end
end

context 'create user is failed' do
  it 'user should be created and redirect_to root_url' do
  end
end
```
- Unit test

```
# user login logout
scenario 'User resgister success and then logout' do
end

scenario 'User resgister failed' do
end

# user share video
scenario 'User resgister success and then share a video successfull' do
end

scenario 'User resgister success and then share a video failed' do
end
```


Testing result

![Screenshot 2023-06-06 at 00 01 43](https://github.com/lampv318/music-sharing/assets/22747775/526f6b3b-45d6-4c89-8885-4a3183290747)

coverage

![Screenshot 2023-06-06 at 00 02 26](https://github.com/lampv318/music-sharing/assets/22747775/afebfdb7-5b7c-427a-8367-140ab844f407)

# Docker Deployment

project use docker-compose to build run server
docker-compose includes 3 containers
- mysql
- rails
- redis

Run Command
```
$ docker-compose up
```

# Usage

- Register, Login
- Share a video
- Notification 

# Troubleshooting



