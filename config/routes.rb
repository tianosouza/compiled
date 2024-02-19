Rails.application.routes.draw do
   resources :questions
   get '/search', to: 'questions#search', as: 'search_questions'
   root "home#index"
end
