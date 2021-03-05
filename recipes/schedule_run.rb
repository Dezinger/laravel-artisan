#
# Cookbook:: laravel-artisan
# Recipe:: schedule:run
#
# Copyright:: 2017, The Authors, All Rights Reserved.

### Add a crontab entry to run laravel artisan scheduler
artisan_schedule 'schedule:run >> /dev/null 2>&1' do
	path node['laravel-artisan']['path']
	user node['laravel-artisan']['queue']['user']
	action :create
end