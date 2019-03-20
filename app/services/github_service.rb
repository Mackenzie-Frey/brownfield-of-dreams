class GithubService

  def get_repos
    # get_json('/repos')
    conn
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.github.com/user/repos?access_token=#{ENV['GITHUB_TOKEN']}") do |faraday|
      # faraday.headers['Authorization: token'] = ENV['GITHUB_TOKEN']
      faraday.adapter Faraday.default_adapter
    end
  end
end
