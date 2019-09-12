class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    if session[:company]
    	companies_url
    else
    	root_url
    end
  end
end
