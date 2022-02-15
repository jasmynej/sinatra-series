require_relative "test_helper"
require_relative '../app.rb'


class PracticeTest < Minitest::Test
    def test_1 
        
        puts "this test is running"
        User.delete_all
        user1 = User.create(name:"rebecca",email:"rebecca@gmail.com",password:"password",bio:"rebecca likes to cook")
        assert_equal User.first.user_nopassword, {name:"rebecca",email:"rebecca@gmail.com",bio:"rebecca likes to cook"}.to_json
    end
end

