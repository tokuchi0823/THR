namespace :push_line do 
    desc "LINEBOT：ゴミ出しの通知" 
    task push_line_message_trash: :environment do
        message = {
            type: 'text',
            text: 'テスト'
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        client.broadcast(message)
    end
end







#desc "This task is called by the Heroku scheduler add-on"
#task :linetest => :environment do
#  Plan.connection
#  Plan.notification
#end
