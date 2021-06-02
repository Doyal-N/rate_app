Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'last_rate', to: 'forced_rates#last_rate'
      resource :forced_rates, only: %i[create]
    end
  end

  root 'home#index'

  match '*path', to: 'home#index', via: :get
end
