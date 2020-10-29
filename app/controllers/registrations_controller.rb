class RegistrationsController < Devise::RegistrationsController
  def update
    params.permit!
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      # Line below required if using Devise >= 1.2.0
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      redirect_to dashboard_path # That's the line I need to change
    end

  end
end
