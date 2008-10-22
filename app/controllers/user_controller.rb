class UserController < ApplicationController
  def show
    @record = User.find(:first, :conditions => {:name => params[:id]})
  end
end
