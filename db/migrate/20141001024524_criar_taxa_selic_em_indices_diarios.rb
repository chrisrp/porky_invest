class CriarTaxaSelicEmIndicesDiarios < ActiveRecord::Migration
  def change
    add_column :indices_diarios, :taxa_selic, :float
    add_index :indices_diarios, :data, :unique => true
  end
end
