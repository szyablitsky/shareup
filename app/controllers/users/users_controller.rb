class Users::UsersController < Devise::SessionsController
  respond_to :json

  def is_user
    authenticate_user!
    render status: 200,
      json: {
        success: !User.find_by_name(params[:name]).blank?
      }
  end
end