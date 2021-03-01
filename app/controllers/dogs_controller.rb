class DogsController < ApplicationController 
    before_action :find_dog, only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.all
    end 
    
    def show 
        @meals = Meal.all.select{|meal| meal.dog.id ===  @owner.id}

    end
    
    def new 
        @dog = Dog.new
        @owners = Owner.all
    end 
  
    def create 
        @dog = Dog.create(dog_params)
        if @dog.valid? 
            redirect_to dog_path(@dog) 
        else
            flash[:errors] = @dog.errors.full_messages 
            redirect_to new_dog_path() 
        end  
        # redirect_to  @dog
    end 
    
    def edit 
        @owners = Owner.all
    end 
    
    def update
        @dog.update(dog_params)
        if @dog.update(dog_params)
            redirect_to dog_path(@dog.id) 
        else
            flash[:errors] = @dog.errors.full_messages 
            redirect_to edit_dog_path(@dog) 
        end  
    end 
  
    def destroy 
        @dog.destroy 
        redirect_to dogs_path
    end 

    private 

    def dog_params 
        params.require(:dog).permit(:name, :age, :color, :weight, :dog_image, :owner_id)
    end 

    def find_dog
        @dog = Dog.find(params[:id]) 
    end 
end
