class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(uid: params[:session][:uid])
    @erros = []
    @erros << 'ユーザIDを入力してください' if params[:session][:uid].empty?
    @erros << 'パスワードを入力してください' if params[:session][:password].empty?
    if user == nil || user.authenticate(params[:session][:password]) == false
      @erros << 'ユーザID、パスワードが一致するユーザが存在しません'
    end

    if @erros.present?
      render 'new'
    else
      log_in user
      redirect_to photos_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end