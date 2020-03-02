class PlansController < ApplicationController
  
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
   params.require(:plan).permit(:purpose, :date, :meeting_place, :destination, :secretary_id)
  end
   
  
  
end
