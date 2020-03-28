namespace :push_line do 
    desc "LINEBOT：ゴミ出しの通知" 
    task push_line_message_trash: :environment do
        message = {
            type: 'text',
            text: 'テスト1'
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        @plans = Plan.all
        @plans.each do |plan|
            if plan.meetdate == Datetime.now-1
            client.broadcast(message)
            end
        end
    end
end







#desc "This task is called by the Heroku scheduler add-on"
#task :linetest => :environment do
#  Plan.connection
#  Plan.notification
#end
