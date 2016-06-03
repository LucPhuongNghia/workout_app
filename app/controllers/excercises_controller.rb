class ExcercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_excercise, except: [:index, :new, :create]
    
    def index
        @excercises = current_user.excercises.all
    end
    
    def new 
       @excercise = current_user.excercises.new 
    end
        
    def create
       @excercise = current_user.excercises.new(excercise_params)
       
       if @excercise.save
           flash[:success] = "Excercise has been created"
           redirect_to [current_user, @excercise]
       else
           flash[:danger] = "Excercise has not been created"
           render :new
       end
    end
    
    def show
       
    end
    
    private
        def excercise_params
            params.require(:excercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
        end
        
        def set_excercise
           @excercise = current_user.excercises.find(params[:id]) 
        end
end