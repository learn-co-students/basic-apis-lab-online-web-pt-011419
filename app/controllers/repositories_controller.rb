class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # binding.pry
    begin
      @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params['client_id'] = 'dcf93b818547d77558ef'
        req.params['client_secret'] = 'd218e4bd383e8f084885524f7bc0803fc0fba66e'
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
