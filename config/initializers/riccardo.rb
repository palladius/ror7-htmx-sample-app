################
## CARLESSIAN APP stuff
################

APP_VERSION = File.read('./VERSION').chomp
DEFAULT_APP_NAME = 'Ror7 HTMX Sample App'
APP_NAME = ENV.fetch 'APP_NAME', DEFAULT_APP_NAME
APP_PERMISSIONS  = 'Riccardo Carlesso Inc. - some rights reserved.'
APP_CODE = "https://github.com/palladius/ror7-htmx-sample-app"
LICENSE_URL = "https://github.com/palladius/ror7-htmx-sample-app/blob/main/LICENSE"

################
## CORS ISSUE
################
#
# https://stackoverflow.com/questions/29324852/allow-cors-in-ruby-on-rails

# answe 23
Rails.application.config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options]
  end
end

# answe 7
Rails.application.config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Request-Method' => 'GET, PATCH, PUT, POST, OPTIONS, DELETE',
    'Access-Control-Allow-Headers:' => 'Origin, X-Requested-With, Content-Type, Accept'
}
