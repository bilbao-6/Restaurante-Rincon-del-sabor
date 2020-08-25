class ApplicationController < ActionController::Base
  add_flash_types :danger,:info,:warning,:success
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = 'no tienes permiso para acceder a éste recurso'
    redirect_to(request.referrer || root_path)

  end

end
