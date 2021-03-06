require 'test_helper'

class Admin::OwnersControllerTest < ActionDispatch::IntegrationTest
  # test "title" do 
  #   body 
  #   assert_response :success
    
  # end 
  # index 
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
  
  #  new owner 
  test " new owner" do 
    get new_admin_owner_url
    assert_response :success
  end 
  # after new  owner , create new owner
  setup do
    @new_owner =  { email: "sekou@gmail.com", first_name: "Sekou", last_name: "Dosso", phone_number: 234 } 
  end 
  test "create new owner" do
    assert Owner.create(@new_owner)
    assert owner = Owner.new(@new_owner)
    assert owner.invalid?
    assert owner.errors.include?(:email)
  end 

  # edit 
  test "edit owner" do 
    get edit_admin_owner_url(@owner)
    assert_response :success
  end 

# update 
test "update owner " do 
  assert @owner.update({ email: "sekou@gmail.com", first_name: "Sekou", last_name: "Dosso", phone_number: 234 })
  assert_equal "sekou@gmail.com", @owner.reload.email 
end

  
# destroy
  test "should destroy admin_owner" do
    delete admin_owner_url(@owner)
    assert_redirected_to admin_owners_url

  end

end
