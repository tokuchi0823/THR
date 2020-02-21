class RelationshipsController < ApplicationController
  
  def new
   @elationship = Relationship.new
  end
  
  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      flash[:success] = '参加表明を送信しました。'
      redirect_to @user
    else
      render :@user
    end
  end
  
  private
  
   def relationship_params
    params.require(:relationship).permit(:user_id, :plan_id)
   end
  
end
