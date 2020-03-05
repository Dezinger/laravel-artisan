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
if node['laravel-artisan'].key?('queues')
    node['laravel-artisan']['queues'].each do |name, value|
        artisan_queue "stop queue #{name}" do
          worker_name name
          configuration value
          action :stop
        end
    end
end