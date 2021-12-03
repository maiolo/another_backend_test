Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "/password_checker", to: "base#check_password"
    end
  end
end