class Reports::OwnersController < ApplicationController
    before_action :find_owner, only: [:show, :edit, :update, :destroy]

    def index 
        @owners = Owner.all
    end 

    def show 
        @dogs = Dog.all.select{|dog| dog.owner.id ===  @owner.id}
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
        @owner.destroy 
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
