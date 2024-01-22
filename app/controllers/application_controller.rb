class ApplicationController < ActionController::Base
  # fixes this: https://stackoverflow.com/questions/35181340/rails-cant-verify-csrf-token-authenticity-when-making-a-post-request
  protect_from_forgery with: :null_session

end
