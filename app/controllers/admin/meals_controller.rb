class Admin::MealsController < ApplicationController
    before_action :find_meal, only: [:show, :edit, :update, :destroy]
    def index 
        @meals = Meal.all
    end 

    def show 
    end
    
    def new 
        @meal = Meal.new
        @dog_id =  params[:dog_id].to_i
        # byebug
    end 
  
    def create 
        @meal = Meal.create(meal_params)
        @dog_id =  params[:meal][:dog_id].to_i
        if @meal.valid? 
            redirect_to dog_meals_path(@meal.id)
        else
            flash[:errors] = @meal.errors.full_messages 
            redirect_to  new_dog_meal_path()  
        end  
    end 
    
    def edit 
        @dog_id = params[:dog_id].to_i
        # byebug
    end 
    
    def update
        if @meal.update(meal_params)
            redirect_to dog_meal_path(@meal) 
        else
            flash[:errors] = @meal.errors.full_messages 
            redirect_to edit_dog_meal_path(@meal) 
        end  
    end 
  
    def destroy 
        @meal.destroy 
        redirect_to dog_meals_path
    end 

    private 

    def meal_params 
        params.require(:meal).permit(:brand, :quantity, :finished, :finished_on, :dog_id)
    end 

    def find_meal
        @meal = Meal.find(params[:id]) 
    end 
end
