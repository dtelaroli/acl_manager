# AclManager

[![Code Climate](https://codeclimate.com/github/flexait/acl_manager/badges/gpa.svg)](https://codeclimate.com/github/flexait/acl_manager)

## Installation

1. Install the acl_manager gem: `gem install 'acl_manager'` or put it inside your Gemfile: `gem 'acl_manager'`
2. Add the acl_manager module into devise inside your model: `devise :database_authenticatable, :registerable, ..., :acl_manager`

3. Install the migrations. run:  `rails g acl_manager MODEL`

4. Open up your console and build the acls
    `AclManager::Acl.build_all!`

5. Create your first role. eg: Admin
  ```
  AclManager::Role.create(name: 'admin', active: true, description: 'gives users     admin access')
  role = AclManager::Role.first
  role.acls << AclManager::Acl.first
  user = User.first
  user.roles << role
  ```
6. Add Acl Manager filter to your controllers

  ```
  class ApplicationController < ActionController::Base
    before_filter :authenticate_user!, :authorizate_user!
    ...
  end
  ```

## Usage

![Acl Manager Print Screen](https://raw.githubusercontent.com/flexait/acl_manager/master/acl-manager.png)

### Create a role list to user form

```
= f.collection_check_boxes :role_ids, AclManager::Role.all, :id, :name do |ff|
  = f.label
  = f.check_box
```

### Translate role name

```
activerecord.attributes.acl_manager.role.#{role_name}
```

### Contribute

As a rails engine, there is a dummy application. `test/dummy`.
At this path its possible to rise a rails aplication and test any modification in a easy way, instead of creating a new one from zero.
Inside of this dummy aplication there is a User model to play with.

### Using Docker

You can use docker and docker-compose to contribute.
You must install them

#### Docker Installation

* For Windows: https://docs.docker.com/docker-for-windows/install/#install-docker-for-windows
* For Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/

#### Docker Compose Installation

* https://docs.docker.com/compose/install/#install-compose

#### Docker Usage

```shell
# Starting dummy spec (http://localhost:3000)
docker-compose up

# Accessing bash
docker-compose run app bash
```

Make aliases

```shell
# Generate docker image
make build

# Starting dummy spec
make up

# Accessing bash
make bash

# Executing migrate
make migrate

# Executing bundle
make bundle
```

## License

This project rocks and uses MIT-LICENSE.
