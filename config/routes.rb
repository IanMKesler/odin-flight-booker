Rails.application.routes.draw do
  get 'flights/index'
  root 'flights#index'

  resource :bookings, only: [:new, :create, :show]
end
