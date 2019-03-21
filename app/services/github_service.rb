class GithubService
  def initialize(token)
    @token = token
  end

  def get_repos
    get_json('repos')
  end

  def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.github.com/user/") do |faraday|
      faraday.headers["Authorization"] = "token #{@token}"
      faraday.adapter Faraday.default_adapter
    end
  end
end