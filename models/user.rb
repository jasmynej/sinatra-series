class User < ActiveRecord::Base

    def user_nopassword
        {name:self.name,email:self.email,bio:self.bio}.to_json
    end
    
end