class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '1144896eedc6077623ed'
      req.params['client_secret'] = '702824acfc21f52fc96db4399671534b0cc077eb'
      req.params['q'] = 'tetris'
    end
    body_hash = JSON.parse(@resp.body)
    #binding.pry
    #@venues = body_hash["response"]["venues"]
    @repositories = body_hash["items"]
    #binding.pry
    render 'search'
  end
end
