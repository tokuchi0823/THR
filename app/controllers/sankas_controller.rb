class SankasController < ApplicationController
  require 'line/bot'
  before_action :logged_in_user
  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
  
  def notification_reject
    client.push_message(@user.line_id,message_reject)
  end

  def create
    @plan = Plan.find(params[:plan_id])
    unless @plan.sanka?(current_user)
      @plan.sanka(current_user)
      @sanka = Sanka.where(plan_id: params[:plan_id]).find_by(user_id: current_user)
      @sanka.update_attributes(sanka_params)
      flash[:success] = "参加申請を送信しました。"
      @plan.reload
      redirect_to @plan
    end
  end

  def destroy
    @plan = Sanka.find(params[:id]).plan
    @user = Sanka.find(params[:id]).user
    if @plan.sanka?(current_user)
      @plan.unsanka(current_user)
      flash[:success] = "参加をキャンセルしました。"
      @plan.reload
      redirect_to @plan
    else
      @plan.unsanka(@user)
      flash[:success] = "参加を拒否しました。"
      @plan.reload
      redirect_to @plan
    end
  end
  
  private
  
  def sanka_params
   params.require(:sanka).permit(:comment)
  end
  
  def message_reject 
  {
   type: 'text',
   text: '以下の企画への参加が拒否されました。'
  }
  end
  
end