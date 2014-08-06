Rails.application.routes.draw do
  match 'passwords', :to=>'passwords#create', :via=>'get'
  root to: "passwords#index"
end
