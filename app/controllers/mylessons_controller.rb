class MylessonsController < ApplicationController

  before_action :authenticate_user

  

  def register  
  
    @Mylesson= Mylesson.new(
      user_id:@current_user.id,
      lesson_id: params[:id]
    )
    @Mylesson.save
    redirect_to("/lessons/#{params[:id]}")
    flash[:notice]="My講義に登録しました。"
  
  end

  def unregister
    @Mylesson= Mylesson.find_by(
      user_id:@current_user.id,
      lesson_id: params[:id]
    )
    @Mylesson.destroy
    redirect_to("/lessons/#{params[:id]}")
    flash[:notice]="My講義から外しました。"
  end
  def unregister_frommypage
    @Mylesson= Mylesson.find_by(
      user_id:@current_user.id,
      lesson_id: params[:id]
    )
    @Mylesson.destroy
    redirect_to("/users/#{@current_user.id}")
    flash[:notice]="My講義から外しました。"
  end
end
