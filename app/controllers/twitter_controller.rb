class TwitterController < ApplicationController
  before_action :logged_in_user

  require 'net/http'
  
  def callback
    host = Rails.configuration.settings[:twitter][:host]
    path = Rails.configuration.settings[:twitter][:token_request_path]
    uri = URI("#{host}#{path}")
    p = {
      'code' => params[:code],
      'client_id' => '28fa91cecc903483ef240c7e9d6607d267868a05f6c1b3f59e6ea1bd5eabb74f',
      'client_secret' => '6fda083d97114f7be097f99cedc28175b9dce9c825a876baa24c46a75db57be4',
      'redirect_uri' => 'http://localhost:3000/oauth/callback',
      'grant_type' => 'authorization_code'
    }
    res = Net::HTTP.post_form(uri, p)
    if res.is_a?(Net::HTTPSuccess)
      body = JSON.parse(res.body)
      current_user.twitter_access_token = body['access_token']
      current_user.save
      redirect_to photos_path
    end
  end

  def tweet
    host = Rails.configuration.settings[:twitter][:host]
    path = Rails.configuration.settings[:twitter][:tweets_path]
    uri = URI("#{host}#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"
    body = {
      'text' => params[:title],
      'url' => params[:image_url],
    }
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{current_user.twitter_access_token}"
    }
    res = http.post(uri.path, body.to_json, headers)
    redirect_to photos_path
  end

end