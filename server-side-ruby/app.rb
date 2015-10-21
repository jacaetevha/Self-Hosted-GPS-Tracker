require 'json'
require 'models'

get '/' do
  redirect '/I'
end

get '/:username' do
  @tracker = Tracker.find_or_create_by_name(params[:username])
  if request.xhr?
    content_type :json
    @tracker.to_json
  else
    erb :index
  end
end
