class DashboardController < ApplicationController
  def index
    @atheletes = User.all
  end
end
