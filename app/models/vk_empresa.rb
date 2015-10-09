#encoding: utf-8
class VkEmpresa < ActiveRecord::Base
  belongs_to :vk_endereco

  accepts_nested_attributes_for :vk_endereco, allow_destroy: true

  has_attached_file :logo, :styles => { :medium => "300x120#", :thumb => "100x31#" }
  validates_attachment_content_type :logo, :content_type => %w(image/jpeg image/jpg image/png)

 validates :nome_pagina, :presence => { :message => 'Digite o nome da pagina' }
 validate :valida_nome_pagina

  def valida_nome_pagina
		errors.add(:nome_pagina, "O nome da pagina não pode conter espaços em branco") if self.nome_pagina.to_s.include? " "
	end

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
