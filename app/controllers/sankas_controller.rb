class SankasController < ApplicationController
  before_action :logged_in_user

  def create
    @plan = Plan.find(params[:plan_id])
    unless @plan.sanka?(current_user)
      @plan.sanka(current_user)
      flash[:success] = "参加申請を送信しました。"
      @plan.reload
      redirect_to @plan
    end
  end

  def destroy
    @plan = Sanka.find(params[:id]).plan
    if @plan.sanka?(current_user)
      @plan.unsanka(current_user)
      flash[:success] = "参加をキャンセルしました。"
      @plan.reload
      redirect_to @plan
    end
  end
end