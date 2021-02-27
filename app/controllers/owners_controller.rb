class OwnersController < ApplicationController
    before_action :find_owner, only: [:show, :edit, :update, :destroy]

    def index 
        @owners = Owner.all
    end 

    def show 
    end
    
    def new 
        @owner = Owner.new
    end 
  
    def create 
        @owner = owner.create(owner_params)
        # redirect_to  owner_path(@owner)
        redirect_to  @owner
    end 
    
    def edit 
    end 
    
    def update
        @owner.update(owner_params)
        # redirect_to owner_path(@owner)
        redirect_to @owner
    end 
  
    def destroy 
        @owner.destroy 
        redirect_to owners_path
    end 

    private 

    def owner_params 
        params.require(:owner).permit(:first_name, :last_name, :email, :phone_number)
    end 

    def find_owner
        @owner = owner.find(params[:id]) 
    end 
end
