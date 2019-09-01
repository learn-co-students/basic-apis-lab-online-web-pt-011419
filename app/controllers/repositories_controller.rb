class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = ENV['GITHUB_CLIENT_ID']
      req.params['client_secret'] = ENV['GITHUB_SECRET']
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @responses = body["items"]
    render 'search'
  end
end
