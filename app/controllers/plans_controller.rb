class PlansController < ApplicationController
  require 'line/bot'
  require 'date'
 
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  protect_from_forgery :except => [:callback]

  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
  
  def notification
    client.broadcast(message2)
  end
  
  def notification_update(ids)
    client.multicast(ids,message_update)
  end
  
  def notification_delete(ids)
    client.multicast(ids,message_delete)
  end
  
   helper_method :notification
   helper_method :notification_edit
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def new
    @plan = Plan.new
  end
  
  def edit 
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      flash[:success] = "ツーリング企画を更新しました。"
      userid = Sanka.where(plan_id: @plan.id).pluck(:user_id)
      ids = User.where(id: userid).pluck(:line_id)
      notification_update(ids)
      redirect_to plans_url(@plan)
    else
      render :edit
    end
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = '新規作成に成功しました。'
      notification
      redirect_to @plan
    else
      render :new
    end
  end
  
  def index
    #@plan = Plan.all
    @plans = Plan.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    userid = Sanka.where(plan_id: @plan.id).pluck(:user_id)
    ids = User.where(id: userid).pluck(:line_id)
    notification_delete(ids)
    @plan.destroy
    flash[:success] = "企画を削除しました。"
    redirect_to plans_url(@plan)
  end
  
  def map
  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
  end
  

  
  private
  
  def plan_params
   params.require(:plan).permit(:purpose, :meetdate, :meeting_place, :destination, :secretary_id, :overview, :finish_date, :deadline_date, :passing_point1, :passing_point2, :passing_point3, :passing_point4, :passing_point5, :picture, :caution, :contact, :avoidferries, :avoidhighways, :avoidtolls)
  end
   
  def message2 
  {
   type: 'text',
   text: "新しい企画が作成されました！チェックしてみましょう！\nhttps://twenty-hearts-riders-app.herokuapp.com/plans/" + @plan.id.to_s 
  }
  end
  
  def message_update
  {
   type: 'text',
   text: "参加予定の企画が修正されました！チェックしてみましょう！\nhttps://twenty-hearts-riders-app.herokuapp.com/plans/" + @plan.id.to_s 
  }
  end
  
  def message_delete
  {
   type: 'text',
   text: "参加予定の企画が中止になりました。\n「" + @plan.purpose + "」\n次回の企画をお楽しみに！"
  }
  end
  
end
