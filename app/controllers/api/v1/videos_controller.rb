# handles CRUD for saved videos within the database
class Api::V1::VideosController < Api::V1::ApplicationController
  before_action :set_video, only: %i[show update destroy]
 
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

  private
 
  def set_video
    @video = Video.find(params[:id])
  end

end
