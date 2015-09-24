Rails.application.routes.draw do

  resources :vk_enderecoanuncios
  resources :vk_enderecoempresas
  resources :vk_anunciofavoritos
  resources :vk_anuncios do
    member do
      get  :endereco
    end
  end
  resources :vk_empresavitrines
  resources :vk_vitrines
  resources :vk_produtos
  resources :vk_empresas
  resources :vk_enderecos
  resources :vk_categoriaprodutos
  devise_for :users
  resources :vk_cidades
  resources :vk_estados

  root  'site#home'

  match '/listarCidade', to: 'vk_cidades#get_cities', via: 'get'
  match '/buscaVitrines', to: 'vk_vitrines#buscaVitrines', via: 'get'

  get '/buscaPorVitrine/:vk_vitrine_id', to: 'site#index', as: 'buscaPorVitrine'
  get '/anuncioshow/:id', to: 'site#show_anuncio', as: 'anuncioshow'


  match '/buscaProdutos', to: 'vk_produtos#busca_produtos', via: 'get'
  match '/olhekpesquisa', to: 'site#index', via: 'get'

  match '/olheksalvarFavorito', to: 'vk_anunciofavoritos#salvar', via: 'get'

  match '/olheksalvaEndereco', to: 'vk_empresas#salva_endereco', via: 'get'
  match '/olhekexcluiEndereco', to: 'vk_empresas#exclui_endereco', via: 'get'

  match '/listaProdutos', to: 'vk_anuncios#produtos', via: 'get'

  get '/anunciar/:produto_id', to: 'vk_anuncios#new', as: 'anunciar'
  get '/buscaEnderecoEmpresa', to: 'vk_anuncios#busca_endereco_empresa', as: 'buscaEnderecoEmpresa'
  get '/buscaEnderecoAnuncio', to: 'vk_anuncios#busca_endereco_anuncio', as: 'buscaEnderecoAnuncio'
  get '/salvaEnderecoAnuncio', to: 'vk_anuncios#salva_endereco_anuncio', as: 'salvaEnderecoAnuncio'
  get '/excluiEnderecoAnuncio', to: 'vk_anuncios#exclui_endereco_anuncio', as: 'excluiEnderecoAnuncio'

  #Essa rota sempre deverá ser a ultima
  get '/:id', to: 'site#show_empresa', as: 'loja'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
