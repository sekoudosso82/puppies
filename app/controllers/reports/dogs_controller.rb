class Reports::DogsController < ApplicationController 
    before_action :find_dog, only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.all.order("owner_id ASC").order("age ASC")
    end 
    
    def show 
        @meals = Meal.all.select{|meal| meal.dog.id ===  @dog.id}
        # byebug
    end
    
    private 

    def find_dog
        @dog = Dog.find(params[:id])
    end 
end
