require 'test_helper'

class OwnersControllerTest < ActionDispatch::IntegrationTest
  # test "title" do 
  #   body 
  #   assert_response :success
    
  # end 

  test "get all owners" do 
    get admin_owners_url
    assert_response :success 
  end

  

end
