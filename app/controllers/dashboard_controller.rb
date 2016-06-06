class DashboardController < ApplicationController
  def index
    @athletes = User.paginate(:page => params[:page])
  end
  
  def search
    if params[:page]
      @athletes = User.search_by_name(session[:search_name]).paginate(:page => params[:page])
    else
      session[:search_name] = nil
      @athletes = User.search_by_name(params[:search_name]).paginate(:page => params[:page])
    end
    
    session[:search_name] = params[:search_name] if params[:search_name]
  end
  
end
