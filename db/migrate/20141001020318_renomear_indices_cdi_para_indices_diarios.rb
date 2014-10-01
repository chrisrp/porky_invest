class RenomearIndicesCdiParaIndicesDiarios < ActiveRecord::Migration
  def change
    rename_table :indice_cdis, :indices_diarios
  end
end
