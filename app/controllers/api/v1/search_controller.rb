class Api::V1::SearchController < Api::V1::ApplicationController
  skip_before_action :authenticate
  include YoutubeApi

  def search_videos
    # TODO: need to search for existing youtube video in database before searching youtube api
    # processes search query and returns results from youtube API
    render_error("query cannot be empty.", 401) if params[:search].nil?

    videos = get_videos(params[:search], params[:page] || nil, params[:pageSize] || 5)

    render_error("response for videos is empty", status: 500) if videos.nil?

    render_success(payload: videos)
  end
end
