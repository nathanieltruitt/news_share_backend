class Api::V1::VideosController < Api::V1::ApplicationController
  def index
    @videos = Video.all
    render json: VideoBlueprint.render_as_hash(@videos)
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
