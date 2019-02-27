class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.from_omniauth(request.env["omniauth.auth"])

    user = authenticate_with_google

    if user
      session[:user_id] = user.id
      flash[:notice] = "Login was successfull"
    else
       flash[:notice] = "User not found"
    end
      redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been successfully logged out."
    redirect_to root_path
  end

  def redirecting

    if !current_user
      redirect_to welcome_path
    else
      case current_user.access_level
      when 'teacher'
          redirect_to locks_path
      when 'admin'
          redirect_to users_path
      else
          redirect_to login_path
      end
    end

  end

  private
    def authenticate_with_google
      if flash[:google_sign_in_token].present?

        auth = GoogleSignIn::Identity.new(flash[:google_sign_in_token])
        user = User.google_sign_in(auth)

        return user
      end
    end


end
