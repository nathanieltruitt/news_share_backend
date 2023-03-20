module YoutubeApi
  def get_videos(search_query, page = nil, page_size)
    begin
      if page.nil?
        query_params =
          { key: ENV.fetch("youtube_api_key"),
            part: "snippet",
            q: search_query,
            type: "video",
            maxResults: page_size,
          }
      else
        query_params =
          {
            key: ENV.fetch("youtube_api_key"),
            part: "snippet",
            q: search_query,
            type: "video",
            pageToken: page,
            maxResults: page_size
          }
      end
      conn = Faraday.new(url: "https://www.googleapis.com", params: query_params)
      response = conn.get("/youtube/v3/search") do |req|
        req.headers["Content-Type"] = "application/json"
      end
    rescue Faraday::ClientError => e
      Rails.logger.error("An error occurred: #{e.message}") and return
    end
    parse_videos(response)
  end

  def parse_videos(response)
    data = JSON.parse(response.body)
    items = data["items"].map do |item|
      { id: item["id"]["videoId"],
        title: item["snippet"]["title"],
        description: item["snippet"]["description"],
        thumbnail: item["snippet"]["thumbnails"]["default"],
        published_at: item["snippet"]["publishedAt"]
      }
    end
    # return the next page token for later use and the list of videos
    page_tokens = { next_token: data["nextPageToken"], prev_token: data["prevPageToken"] || nil }
    { page_tokens:, videos: items }
  end
end
