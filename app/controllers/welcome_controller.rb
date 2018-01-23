class WelcomeController < ApplicationController

  def index
    @users = User.where.not(id: current_user).map { |u| u }
  end

end
