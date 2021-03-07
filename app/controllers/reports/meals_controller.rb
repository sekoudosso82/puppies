class Reports::MealsController < ApplicationController
    before_action :find_meal, only: [:show, :edit, :update, :destroy]
    def index 
        @meals = Meal.active
    end 

    def show 
        @dog_id =  params[:dog_id].to_i
        @owner_id = params[:owner_id].to_i
    end
    
    private 

    def find_meal
        @meal = Meal.find(params[:id]) 
    end 
end
