class Reports::DogsController < ApplicationController 
    before_action :find_dog, only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.active
        @dogs = @dogs.order("owner_id ASC").order("age ASC")
    end 
    
    def show 
        @meals = Meal.active
        @meals = @meals.select{|meal| meal.dog.id ===  @dog.id}
        # byebug
    end
    
    private 

    def find_dog
        @dog = Dog.find(params[:id])
    end 
end
