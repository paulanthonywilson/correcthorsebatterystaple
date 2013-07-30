Correcthorsebatterystaple::Application.routes.draw do
  root :to => "passwords#index"
  match 'passwords', :to=>'passwords#create', :via=>'get'
end
