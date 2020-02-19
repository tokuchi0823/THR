class PlansController < ApplicationController
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @plan
    else
      render :new
    end
  end
  
  def index
    @plan = Plan.all
  end
  
  private
  
  def plan_params
   params.require(:plan).permit(:purpose, :date, :meeting_place, :destination, :secretary_id)
  end
   
  
  
end
