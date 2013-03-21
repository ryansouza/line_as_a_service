Lines::Application.routes.draw do
  post '/' => 'line#move'
  get '/get_in' => 'line#get_in', as: "get_in_line"
  root to: 'line#show'
end
