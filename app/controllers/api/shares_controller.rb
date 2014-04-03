class Api::SharesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  respond_to :json

  def index
    render json: []
  end

  def create
    share = Share.create(share_params params)

    render status: 200,
      json: {
        success: share.persisted?,
        share_id: share.id
      }
  end

  private

    # candidate for sevice class
    def share_params params
      share_params = {
        from_user_id: current_user.id,
        url: params[:url]
      }

      if to_user = User.where('name = ? or email = ?',params[:user],params[:user]).first
        share_params[:to_user_id] = to_user.id
      else
        share_params[:to_email] = params[:user]
      end

      share_params
    end
end
