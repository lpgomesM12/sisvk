class VkEmpresa < ActiveRecord::Base
  belongs_to :vk_endereco

  accepts_nested_attributes_for :vk_endereco, allow_destroy: true

 #after_create  :verifica_empresa_usuario

def user_id
  @user_id
end

# setter
def user_id=(val)
  @user_id = val
end


def verifica_empresa_usuario

  	@user = User.find(self.user_id)
  	@user.vk_empresa_id = self.id
  	@user.save

end


end
