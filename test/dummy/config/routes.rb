Rails.application.routes.draw do
  mount BlueVelvet::Engine => "/facebook"

  get "/about" => 'facebook/page#about'
  get "/events" => 'facebook/page#events'
end
