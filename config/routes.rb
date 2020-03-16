Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  #routes for sassadmin
  get 'sassadmins' => 'saas_admin#index'
  get 'saasadmin/:id' => 'saas_admin#show'
  post 'saasadmin' => 'saas_admin#create'
  patch 'saasadmin/:id' => 'saas_admin#update'
  put    'saasadmin/:id' => 'saas_admin#update'
  delete 'saasadmin/:id' => 'saas_admin#destroy'

  #saasadmin Login
  post 'auth/login' => 'auth#saasAdminLogin'

  #Common Routes
  get 'services' => 'common#getServices'
  get 'roles' => 'common#getRoles'
  get 'documenttypes' => 'common#getDocumentTypes'
  get 'getcountries' => 'common#getCountries'
  get 'getstates/:id' => 'common#getStates'

  #routes for saasuser 
  get 'saasusers' => 'saas_user#index'
  get 'saasuser/:id' => 'saas_user#show'
  post 'saasuser' => 'saas_user#create'
  patch 'saasuser/:id' => 'saas_user#update'
  put    'saasuser/:id' => 'saas_user#update'
  delete 'saasuser/:id' => 'saas_user#destroy'
  get 'saasuserdetails/:id' => 'saas_user#view'

  #routes for agency 
  get 'agencies' =>  'agency#index'
  get 'agency/:id' => 'agency#show'
  post 'agency' => 'agency#create'
  patch 'agency/:id' => 'agency#update'
  put    'agency/:id' => 'agency#update'
  delete 'agency/:id' => 'agency#destroy'

  #routes for subscription Plans
  get 'subscription_plans' =>  'subscription_plans#index'
  get 'subscription_plan/:id' => 'subscription_plans#show'
  post 'subscription_plan' => 'subscription_plans#create'
  patch 'subscription_plan/:id' => 'subscription_plans#update'
  put    'subscription_plan/:id' => 'subscription_plans#update'
  delete 'subscription_plan/:id' => 'subscription_plans#destroy'

  #routes for agency 
  get 'payments' =>  'payment#index'
  get 'payment/:id' => 'payment#show'

end
