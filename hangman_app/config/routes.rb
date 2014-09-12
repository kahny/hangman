Rails.application.routes.draw do
  match "*path", to: "site#index", via: "get"

  root 'site#index'

end
