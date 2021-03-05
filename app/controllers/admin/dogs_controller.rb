class Admin::DogsController < ApplicationController 
    before_action :find_dog, only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.active
    end 
    
    def show 
        @meals = Meal.active
        @meals = @meals.select{|meal| meal.dog.id ===  @dog.id}
        # byebug
    end
    
    def new 
        @owner = Owner.find params[:owner_id]
        @dog = Dog.new(:owner_id=>@owner.id)
        @owner_id =  params[:owner_id].to_i
        # byebug
    end 
  
    def create 
        @dog = Dog.create(dog_params)
        @owner_id =  params[:dog][:owner_id].to_i
        # byebug
        if @dog.valid? 
            redirect_to admin_owner_path(@dog.owner.id) 
        else
            flash[:errors] = @dog.errors.full_messages 
            redirect_to  new_admin_owner_dog_path() 
        end  
    end 
    
    def edit 
        @owner_id = params[:owner_id].to_i
        # byebug
    end 
    
    def update
        if @dog.update(dog_params)
            redirect_to admin_owner_path(@dog.owner.id) 
        else
            flash[:errors] = @dog.errors.full_messages 
            redirect_to edit_admin_owner_dog_path(@dog) 
        end  
    end 
  
    def destroy 
        # @dog.destroy 
        if @dog.update_attributes(is_deleted: true)
            @dog.meals.update_all(is_deleted: true)
        end
        redirect_to admin_owner_path(params[:owner_id])
    end 

    private 

    def dog_params 
        params.require(:dog).permit(:name, :age, :color, :weight, :dog_image, :owner_id)
    end 

    def find_dog
        @dog = Dog.find(params[:id])
    end 
end
