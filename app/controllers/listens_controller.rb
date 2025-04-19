class ListensControlladd controllerser < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_listen, only: %i[ show update destroy ]

  def index
    @listens = Listen.all

    render json: @listens
  end

  def show    
    render json: @listen
  end

  def create
    @listen = Listen.new(listen_params)

    if @listen.save
      render json: @listen, status: :created, location: @listen
    else
      render json: @listen.errors, status: :unprocessable_entity
    end
  end

  def update
    if @listen.update(listen_params)
      render json: @listen
    else
      render json: @listen.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listen.destroy
  end

  private

    def set_listen
      @listen = Listen.find(params[:id])
    end

    def listen_params
      params.expect(album: [ :rating, :review, :album_id, :user_id ])
    end
end
