class PagesController < ApplicationController
  def index
  end

  # handle the non-Oauth signin
  def signin
    if request.post?
      @user = User.find_by name: params[:user][:name]
      if @user.nil?
        #User not found
        redirect_to action: :signup, alert: 'No user'
      else
        @identity = @user.identities.find_by provider: 'LendTu'
        if @identity.nil?
          #login not found
          redirect_to action: :signup, alert: 'Login Not Found'
        else
          if @identity.authenticate(params[:user][:password])
            #success!
            self.current_user=@identity.user
            redirect_to root_url
          else
            #bad password
            redirect_to action: :signup, alert: 'Bad Password'
          end
        end
      end
    end
  end

  # handle non-Oauth
  def signup
    if signed_in?
      @user = current_user
    end
  end
  
end
