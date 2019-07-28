Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'novels#index'
  resources :novels do
		resources :chapters, except: [:index] do
			 resources :comments, except: [:index,:show]
		end
  end

 


end
