class PasswordsController < ApplicationController
  def index
  end

  def create
    @password = Word.random_password(4)
    render :action=>:index
  end


end
