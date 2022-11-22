class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    # post = Post.find(params[:id])
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
    # post.update(post_params)
    # if post.valid?
    #   render json: post
    # else
    #   render json: {errors: post.errors}, status: :unprocessable_entity
    # end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

end
