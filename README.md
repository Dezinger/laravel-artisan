# Laravel-Artisan Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/laravel-artisan.svg)](https://supermarket.chef.io/cookbooks/laravel-artisan) [![Github Release](https://img.shields.io/github/release/sebbaum/laravel-artisan.svg)](https://github.com/sebbaum/laravel-artisan/releases) [![Github Issues](https://img.shields.io/github/issues/sebbaum/laravel-artisan.svg)](https://github.com/sebbaum/laravel-artisan/issues) [![license](https://img.shields.io/github/license/sebbaum/laravel-artisan.svg)](https://github.com/sebbaum/laravel-artisan/blob/master/LICENSE)

Did you ever want to to run [Laravel's php artisan commands](https://laravel.com/docs/5.5/artisan) on an automated infrastructure? If you are using [Chef](https://www.chef.io/) then this cookbook is for you.

## Scope
This cookbook supports some of the artisan commands, that are useful on a load balanced server infrastructure.  
Commands that are particular useful for development are not supported.

### Supported commands:
* down
* up
* ... and more to come

## Requirements
* Chef 12.7 or higher

## Platform Support
This cookbook has been developed and used on Ubuntu 16.04.

## Environment Support
Supported Environments:
* Vagrant
* AWS Opsworks

## Cookbook Dependencies
Currently none.

## Usage
Place a dependency on the mysql cookbook in your cookbook's metadata.rb

```ruby
depends 'mysql', '~> 8.0'
```
or add the dependency in your Berksfile:
```ruby
cookbook 'laravel-artisan'
```

Then, you can run the recipes using Chef's runlist. Right away this will throw an Exception. To get it work properly you have
to pass a path to the directory where the `artisan` file is located.

### Envirionment file
Passing the path to the artisan file via an environment file:
```json
{
  "name": "development",
  "description": "Vagrant Development Environment",
  "default_attributes": {
    "laravel-artisan": {
      "path": "<path-to-artisan-file>"
    }
  },
  "json_class": "Chef::Environment",
  "chef_type": "environment"
}

```

### AWS Opsworks
Using AWS Opsworks you can pass in the path via custom json:
```json

  "laravel-artisan": {
    "path": "<path-to-artisan-file>"
  }
}
```

### Recipes
* `laravel-artisan::down` 			Put the application into maintenance mode.
* `laravel-aritsan::up` 			Bring the application out of maintenance mode.
* `laravel-artisan::cache_clear`	Flush the application cache.
* `laravel-artisan::config_cache`	Create a cache file for faster configuration loading.
* `laravel-artisan::config_clear`	Remove the configuaration cache file.