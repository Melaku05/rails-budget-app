class ApplicationController < ActionController::Base
   def authenticate_user!
      if user_signed_in?
         redirect_to categories_path
      end
   end   
  
end
