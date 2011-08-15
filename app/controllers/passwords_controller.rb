class PasswordsController < ApplicationController
  def index
  end

  def create
    @password = Word.random_password(params[:min_word_count].to_i, params[:min_length].to_i, params[:separator])
    respond_to do |format|
      format.html {render :action=>:index}
      format.js {render "display_password"}
    end
  end


end
