class VkEmpresa < ActiveRecord::Base
  belongs_to :vk_endereco

  accepts_nested_attributes_for :vk_endereco, allow_destroy: true

  validates :nome_pagina, :presence => { :message => 'Digite o nome da pagina' }

  after_create  :verifica_empresa_usuario
  before_create :captura_id

def captura_id
 @@idUsuario = self.user_id
end
def user_id
  @user_id
end

# setter
def user_id=(val)
  @user_id = val
end

def verifica_empresa_usuario
  	@user = User.find(@@idUsuario)
  	@user.vk_empresa_id = self.id
  	@user.save
end


end
