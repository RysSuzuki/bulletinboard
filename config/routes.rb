Rails.application.routes.draw do
  resources:letters do
  collection do
        post :confirm
      end
  member do
        patch :confirm
        post :update
      end
  end
end
