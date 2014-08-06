require 'spec_helper'

describe PasswordsController do

  describe "get index" do
    it "displays the index page" do
      get :index
      assert_template :index
    end
  end


  describe "post create" do
    before(:each) do
      allow(Word).to receive(:random_password).and_return("correct-horse-battery-staple")
      post :create
    end
    it "renders index" do
      assert_template :index
    end

    it "assigns a new password" do
      assert_equal "correct-horse-battery-staple", assigns(:password)
    end

  end

end
