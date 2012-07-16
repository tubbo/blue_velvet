Rails.application.routes.draw do
  mount BlueVelvet::Engine => "/facebook"

  get "/about" => 'facebook/page#description'
  get "/members" => 'facebook/page#members'
  get "/events" => 'facebook/page#events'
end
