class MealsController < ApplicationController
    before_action :find_meal, only: [:show, :edit, :update, :destroy]

    def index 
        @meals = Meal.all
    end 

    def show 
    end
    
    def new 
        @meal = Meal.new
        @dogs = Dog.all
    end 
  
    def create 
        @meal = Meal.create(meal_params)
        if @meal.valid? 
            redirect_to meal_path(@meal) 
        else
            flash[:errors] = @meal.errors.full_messages 
            redirect_to new_meal_path() 
        end  
    end 
    
    def edit 
        @dogs = Dog.all
    end 
    
    def update
        @meal.update(meal_params)
        if @meal.update(meal_params)
            redirect_to meal_path(@meal.id) 
        else
            flash[:errors] = @meal.errors.full_messages 
            redirect_to edit_meal_path(@meal) 
        end  
    end 
  
    def destroy 
        @meal.destroy 
        redirect_to meals_path
    end 

    private 

    def meal_params 
        params.require(:meal).permit(:brand, :quantity, :finished_on, :dog_id)
    end 

    def find_meal
        @meal = Meal.find(params[:id]) 
    end 
end
