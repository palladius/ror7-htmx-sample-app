Rails.application.routes.draw do
  get 'genai/index'
  get 'genai/show'
  get 'genai/click'
  get 'genai/unclick'
  get 'genai/sobenme'
  get 'genai/why_sky_blue'

  # TODO copiali tutti
  post '/genai/why_sky_blue' =>  'genai#why_sky_blue', defaults: {sobenme: "POST /genai/why_sky_blue non so se vada"}
  post 'genai/show'

  get 'click'   =>  'genai#click', defaults: {sobenme: "GET /click"}
  get 'clicked' =>  'genai#click', defaults: {sobenme: "GET /clicked"}
  post 'click'   =>  'genai#post_click', defaults: {sobenme: "POST /click"}
  post 'clicked' =>  'genai#post_click', defaults: {sobenme: "POST /clicked"}
  #post 'genai/why_sky_blue'=>  'genai#why_sky_blue', defaults: {sobenme: "POST /genai/why_sky_blue"}

  resources :posts
  get 'dhhdemo/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"
  root "posts#index"
end
