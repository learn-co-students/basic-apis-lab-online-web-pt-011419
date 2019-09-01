class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # binding.pry
    begin
      @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params['client_id'] = 'client_id'
        req.params['client_secret'] = 'client_secret'
        req.params[:q] = params[:query]
    end
     
    body = JSON.parse(@resp.body)
      if @resp.success?
        @result = body
      else
        # binding.pry
        @error = body["errors"][0]["code"]
      end

      render :search
  end
end
end
