require 'json'
require 'models'
require 'time'

get '/' do
  redirect '/I'
end

get '/track/?' do
  redirect "/track/I?#{request.query_string}"
end

get '/track/:name/?' do
  @user = Tracker.find_or_create_by_name(params[:name])
  @user.latitude = params[:lat].to_f
  @user.longitude = params[:lon].to_f
  if params[:t]
    @user.utc_date = params[:t].to_f
    @user.date = Time.at @user.utc_date / 1000
  else
    @user.date = Time.now
  end
  @user.save
  halt 200
end

get '/:username/?' do
  @tracker = Tracker.find_or_create_by_name(params[:username])
  if request.xhr?
    content_type :json
    @tracker.to_json
  else
    erb :index
  end
end
