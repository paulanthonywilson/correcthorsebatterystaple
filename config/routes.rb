Correcthorsebatterystaple::Application.routes.draw do
  require_ssl = !Rails.env.development?

  scope :constraints => require_ssl ? { :protocol => "https" }  : {} do
    root :to => "passwords#index"
    match 'passwords', :to=>'passwords#create', :via=>'get'
  end
  match "*", :to => redirect { |_, request| "https://" + request.host_with_port + request.fullpath } if require_ssl
  root :to=>redirect{|_, request| "https://#{request.host_with_port}/"} if require_ssl
end
