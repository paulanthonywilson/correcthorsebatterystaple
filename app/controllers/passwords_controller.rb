class PasswordsController < ApplicationController
  def index
  end

  def create
    @password = Word.random_password(4)
    respond_to do |f|
      f.html {render :action=>:index}
      f.js {render 'display_password'}
    end
  end


end
