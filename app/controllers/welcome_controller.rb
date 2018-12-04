class WelcomeController < ApplicationController
  before_action :require_logged_in

  def home
    @user = current_user
  end
end
