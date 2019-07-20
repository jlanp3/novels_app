class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :novels

  def novels
  	@novels = Novel.all
  end
end
