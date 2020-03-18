class PlansController < ApplicationController
  require 'line/bot'
 
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  protect_from_forgery :except => [:callback]

  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
  
  #def notification
  #  client.broadcast(message2)
  #end
  
   helper_method :notification
  
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
      redirect_to plans_url(@plan)
    else
      render :edit
    end
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = '新規作成に成功しました。'
     # notification
      redirect_to @plan
    else
      render :new
    end
  end
  
  def index
    @plan = Plan.all
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:success] = "企画を削除しました。"
    redirect_to plans_url(@plan)
  end
  

  
  private
  
  def plan_params
   params.require(:plan).permit(:purpose, :meetdate, :meeting_place, :destination, :secretary_id, :overview, :finish_date)
  end
   
  def message2 
  {
   type: 'text',
   text: '新しい企画が作成されました！チェックしてみましょう！
   https://twenty-hearts-riders-app.herokuapp.com/plans/' + @plan.id.to_s 
  }
  end
  
end
