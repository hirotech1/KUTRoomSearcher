class UsersController < ApplicationController

  before_action :ensure_correct_user,{only: [:mypage]}
  before_action :authenticate_user,{only: [:logout, :mypage]}
  before_action :forbid_login_user,{only: [:login, :login_form, :new, :create]}
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/")
    else
      render("users/new")
    end
  end
  
 def login_form
 end

 def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end


 
  
  def logout
    session[:user_id]= nil
    flash[:notice]="ログアウトしました"
    redirect_to("/users/login")
  end
  
  def mypage
    @mylessons = Mylesson.where(user_id:@current_user)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] ="権限がありません"
      redirect_to("/")
    end
  end

end


