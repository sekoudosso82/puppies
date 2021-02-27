class DogsController < ApplicationController 
    before_action :find_dog, only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.all
    end 

    def show 
    end
    
    def new 
        @dog = dog.new
    end 
  
    def create 
        @dog = dog.create(dog_params)
        redirect_to  @dog
    end 
    
    def edit 
    end 
    
    def update
        @dog.update(dog_params)
        redirect_to @dog
    end 
  
    def destroy 
        @dog.destroy 
        redirect_to dogs_path
    end 

    private 

    def dog_params 
        params.require(:dog).permit(:name, :age, :color, :weight)
    end 

    def find_dog
        @dog = dog.find(params[:id]) 
    end 
end
