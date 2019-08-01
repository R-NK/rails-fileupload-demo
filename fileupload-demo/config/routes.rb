Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'file_upload#index'

  resources :file_upload, only: [:create]
  get 'render_uploaded_file_html', to: 'file_upload#render_uploaded_file_html'
end
