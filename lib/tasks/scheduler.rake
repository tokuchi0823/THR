require 'date'

namespace :push_line do 
    desc "LINEBOT：企画前日通知" 
    task push_line_message_trash: :environment do
        message = {
            type: 'text',
            text: "もうすぐツーリングですね！バイクの調子はどうですか？\nガソリンは満タンですか？ルートも再確認しておきましょう！\nhttps://twenty-hearts-riders-app.herokuapp.com/plans/" + plan.id.to_s
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        @plans = Plan.all
        @plans.each do |plan|
            if plan.meetdate.prev_day.to_date <= Date.today && plan.meetdate.to_date > Date.today
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
