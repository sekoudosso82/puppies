class Reports::OwnersController < ApplicationController
    before_action :find_owner, only: [:show, :edit, :update, :destroy]

    def index 
        @owners = Owner.active 
    end 

    def show 
        @dogs = Dog.active 
        @dogs = @dogs.select{|dog| dog.owner.id ===  @owner.id}
    end
    
    
    
    
  
    private 

    def owner_params 
        params.require(:owner).permit(:first_name, :last_name, :email, :phone_number, :owner_image)
    end 

    def find_owner
        @owner = Owner.find(params[:id]) 
    end 
end
