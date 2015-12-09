class LikesController < ApplicationController
  respond_to :json

  before_action :authenticate_user!

  def create
    @content = get_content_type(params[:likeable_id], params[:likeable_type])
    @like = current_user.likes.build(like_params)
    @like.likeable_id = params[:likeable_id]
    if @like.save

    else

    end
    render nothing: true
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render nothing: true
  end

private

  def like_params
    params.permit(:likeable_id, :likeable_type, :user_id)
  end

  def get_content_type(id, content_type)
    if content_type == 'board'
      Board.find(id)
    elsif content_type == 'pin'
      Pin.find(id)
    else
      false
    end
  end
end
