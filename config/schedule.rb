# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "THR_plan/log/cron_log.log"

 every 1.minutes do
#   command "/usr/bin/some_great_command"
   runner "client.broadcast(message2)"
#   rake "some:great:rake:task"
 end
 
 def message2
  {
   type: 'text',
   text: '(*´꒳`*)'
  }
 end
  
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
