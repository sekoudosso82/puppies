class MealsController < ApplicationController
    before_action :find_meal, only: [:show, :edit, :update, :destroy]

    def index 
        @meals = Meal.all
    end 

    def show 
    end
    
    def new 
        @meal = Meal.new
    end 
  
    def create 
        @meal = Meal.create(meal_params)
        # redirect_to  meal_path(@meal)
        redirect_to  @meal
    end 
    
    def edit 
    end 
    
    def update
        @meal.update(meal_params)
        # redirect_to meal_path(@meal)
        redirect_to @meal
    end 
  
    def destroy 
        @meal.destroy 
        redirect_to meals_path
    end 

    private 

    def meal_params 
        params.require(:meal).permit(:brand, :quantity, :finished_on)
    end 

    def find_meal
        @meal = Meal.find(params[:id]) 
    end 
end
