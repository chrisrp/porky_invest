class CreateIndiceCdi < ActiveRecord::Migration
  def change
    create_table :indice_cdis do |t|
      t.float :taxa_di
      t.date :data
    end
  end
end
