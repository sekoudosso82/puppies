class Admin::OwnersController < ApplicationController
    before_action :find_owner, only: [:show, :edit, :update, :destroy]

    def index 
        # byebug
        @owners = Owner.active
    end 
    

    def show 
        @dogs = Dog.active
        @dogs = @dogs.select{|dog| dog.owner.id ===  @owner.id}
    end
    
    def new 
        @owner = Owner.new
    end 
  
    def create 
        @owner = Owner.create(owner_params)
        if @owner.valid? 
            redirect_to admin_owner_path(@owner) 
        else
            flash[:errors] = @owner.errors.full_messages 
            redirect_to new_admin_owner_path() 
        end  
    end 
    
    def edit 
    end 
    
    def update
        @owner.update(owner_params)
        if @owner.update(owner_params)
            redirect_to admin_owner_path(@owner.id) 
        else
            flash[:errors] = @owner.errors.full_messages 
            redirect_to  edit_admin_owner_path(@owner) 
        end  
    end 
    
    
  
    def destroy 
        # @owner.destroy 
        # byebug
        if @owner.update_attributes(is_deleted: true)
            @owner.dogs.each do |dog|
              dog.meals.update_all(is_deleted: true)
        end
        
            @owner.dogs.update_all(is_deleted: true)
        end
        redirect_to admin_owners_path
    end 

    private 

    def owner_params 
        params.require(:owner).permit(:first_name, :last_name, :email, :phone_number, :owner_image)
    end 

    def find_owner
        @owner = Owner.find(params[:id]) 
    end 
end
