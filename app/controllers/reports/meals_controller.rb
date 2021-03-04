class Reports::MealsController < ApplicationController
    before_action :find_meal, only: [:show, :edit, :update, :destroy]
    def index 
        @meals = Meal.all
    end 

    def show 
        @dog_id =  params[:dog_id].to_i
        @owner_id = params[:owner_id].to_i
    end
    
    # def new 
    #     @dog = Dog.find(params[:dog_id].to_i)
    #     @meal = Meal.new
    #     @dog_id =  params[:dog_id].to_i
    #     # byebug
    # end 
  
    # def create 
    #     @meal = Meal.create(meal_params)
    #     @dog_id =  params[:meal][:dog_id].to_i
    #     if @meal.valid? 
    #         redirect_to reports_dog_meal_path(@dog_id, @meal.id)
    #     else
    #         flash[:errors] = @meal.errors.full_messages 
    #         redirect_to  new_reports_dog_meal_path()  
    #     end  
    # end 
    
    # def edit 
    #     @dog = Dog.find(params[:dog_id].to_i)
    #     @dog_id =  params[:dog_id].to_i

    #     # @dog = params[:dog_id].to_i
    #     # @meal_id = params[:id].to_i
    #     # byebug
    # end 
    
    # def update
    #     # byebug
    #     if @meal.update(meal_params)
    #         redirect_to reports_dog_meal_path(@meal.dog_id, @meal.id) 
    #     else
    #         flash[:errors] = @meal.errors.full_messages 
    #         redirect_to edit_reports_dog_meal_path(@meal.dog_id, @meal.id) 
    #     end  
    # end 
  
    # def destroy 
    #     @dog_id =  params[:dog_id].to_i
    #     @owner_id = params[:owner_id].to_i
    #     @meal.destroy 
    #     redirect_to reports_owner_dog_path(@owner_id, @dog_id)
    # end 

    private 

    # def meal_params 
    #     params.require(:meal).permit(:brand, :quantity, :finished, :finished_on, :dog_id)
    # end 

    def find_meal
        @meal = Meal.find(params[:id]) 
    end 
end
