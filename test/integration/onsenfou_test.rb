require 'test_helper'

class OnsenfouTest < ActionDispatch::IntegrationTest
 test "links test" do 
    get root_path
    assert_template "statique/accueil"
    assert_select "a[href=?]", services_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", team_path
    assert_select "a[href=?]", root_path, count: 2
 end 
end
