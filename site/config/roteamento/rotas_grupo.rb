
#CARLOS
match '/grupos/buscar/' => 'grupo#buscarGrupoNome',  via: :get
match '/grupos/buscar/' => 'grupo#buscarGrupoNome', :as => :grupo_busca, via: :post
match '/grupos/:id/membros' => 'grupo#verMembros', :as => :membros_grupo, via: :get
match 'grupos/:id/deletar/' => 'grupo#destroy', :as => :destroy_grupo, via: :get
match 'grupos/:id/edit/' => 'grupo#update', :as => :att_grupo, via: :create
match 'grupos/:id/edit/' => 'grupo#update', via: :post
#------------------------------------------------------------------------------------------------------------
match 'grupos/' => 'grupo#index', :as => :list, via: :get
match 'grupos/new/' => 'grupo#new', :as => :grupo, via: :post
match 'grupos/new/' => 'grupo#new',  via: :get
match 'grupos/:id/edit/' => 'grupo#edit', via: :get
match 'grupos/:id/' => 'grupo#show', :as => :grupo_ver, via: :get

match 'grupos/sair/:idGrupo/' => 'grupo#sair', via: :get

match 'grupos/' => 'grupo#create', via: :create
match 'grupos/' => 'grupo#create', via: :post


match 'gruposDe/:id' => 'grupo#gruposDe', via: :get
