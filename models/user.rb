class User < ActiveRecord::Base

    #returning the user without the password
    def user_nopassword
        {name:self.name,email:self.email,bio:self.bio}.to_json
    end
    
end