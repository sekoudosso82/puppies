require 'test_helper'

class Admin::OwnersControllerTest < ActionDispatch::IntegrationTest
  # test "title" do 
  #   body 
  #   assert_response :success
    
  # end 

  test "get all owners" do 
    get admin_owners_url
    assert_response :success 
  end

  # show 
  setup do
    @owner = owners(:one)
  end
  test "should show admin_owner" do
    get admin_owner_url(@owner)
    assert_response :success
  end 

end
