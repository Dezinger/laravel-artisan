# Stop the artisan queue:work process.
#
# Cookbook:: laravel-artisan
# Recipe:: queue_stop
#
# Copyright:: 2017, The Authors, All Rights Reserved.

artisan_queue 'stop queue' do
	worker_name node['laravel-artisan']['queue']['worker_name']
  	configuration node['laravel-artisan']['queue']
  	action :stop
end


### Support multiple queues
if node['laravel-artisan'].keys?('queues')
    node['laravel-artisan']['queues'].each do |key, value|
        artisan_queue "stop queue #{key}" do
          worker_name key
          configuration value
          action :stop
        end
    end
end