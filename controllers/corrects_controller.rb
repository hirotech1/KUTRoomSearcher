class CorrectsController < ApplicationController
  def create
    @correct= Correct.new(
      user_id:@current_user.id,
      lesson_id: params[:id]
    )
    @correct.save
    redirect_to("/lessons/#{params[:id]}")
    flash[:notice]="ご協力ありがとうございます。"
  end
end