class AddEmpresaToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :vk_empresa, index: true
  end
end
