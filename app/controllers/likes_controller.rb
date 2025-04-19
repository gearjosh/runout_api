class LikesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_like, only: %i[ show update destroy ]

  def index
    @likes = Like.all

    render json: @likes
  end

  def show    
    render json: @like
  end

  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like.destroy
  end

  private

    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.expect(album: [ :listen_id, :user_id, :album_id ])
    end
end
