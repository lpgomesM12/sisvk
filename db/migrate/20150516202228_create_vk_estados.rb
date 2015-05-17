#encoding: utf-8
class CreateVkEstados < ActiveRecord::Migration
  def change
    create_table :vk_estados do |t|
      t.string :nome_estado
      t.string :sigl_estado

      t.timestamps
    end

    VkEstado.create(:nome_estado => 'Acre', :sigl_estado =>  'AC')
    VkEstado.create(:nome_estado => 'Alagoas', :sigl_estado => 'AL')
    VkEstado.create(:nome_estado => 'Amazonas', :sigl_estado => 'AM')
    VkEstado.create(:nome_estado => 'Amapá', :sigl_estado => 'AP')
    VkEstado.create(:nome_estado => 'Bahia', :sigl_estado => 'BA')
    VkEstado.create(:nome_estado => 'Ceará', :sigl_estado => 'CE')
    VkEstado.create(:nome_estado => 'Distrito Federal', :sigl_estado => 'DF')
    VkEstado.create(:nome_estado => 'Espírito Santo', :sigl_estado => 'ES')
    VkEstado.create(:nome_estado => 'Goiás',:sigl_estado => 'GO')
    VkEstado.create(:nome_estado => 'Maranhão', :sigl_estado => 'MA')
    VkEstado.create(:nome_estado => 'Minas Gerais', :sigl_estado => 'MG')
    VkEstado.create(:nome_estado => 'Mato Grosso do Sul', :sigl_estado => 'MS')
    VkEstado.create(:nome_estado => 'Mato Grosso', :sigl_estado => 'MT')
    VkEstado.create(:nome_estado => 'Pará', :sigl_estado => 'PA')
    VkEstado.create(:nome_estado => 'Paraíba', :sigl_estado => 'PB')
    VkEstado.create(:nome_estado => 'Pernambuco', :sigl_estado => 'PE')
    VkEstado.create(:nome_estado => 'Piauí', :sigl_estado => 'PI')
    VkEstado.create(:nome_estado => 'Paraná', :sigl_estado => 'PR')
    VkEstado.create(:nome_estado => 'Rio de Janeiro', :sigl_estado => 'RJ')
    VkEstado.create(:nome_estado => 'Rio Grande do Norte', :sigl_estado => 'RN')
    VkEstado.create(:nome_estado => 'Rondônia', :sigl_estado => 'RO')
    VkEstado.create(:nome_estado => 'Roraima', :sigl_estado => 'RR')
    VkEstado.create(:nome_estado => 'Rio Grande do Sul', :sigl_estado => 'RS')
    VkEstado.create(:nome_estado => 'Santa Catarina', :sigl_estado => 'SC')
    VkEstado.create(:nome_estado => 'Sergipe', :sigl_estado => 'SE')
    VkEstado.create(:nome_estado => 'São Paulo', :sigl_estado => 'SP')
    VkEstado.create(:nome_estado => 'Tocantins', :sigl_estado => 'TO') 

  end
end
