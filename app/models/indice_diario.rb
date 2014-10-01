#  taxa_di float
#  taxa_selic float
#  data    date

class IndiceDiario < ActiveRecord::Base
  self.table_name = 'indices_diarios'

  validates :data, presence: true
  validates :taxa_di, presence: true

  def self.carregar_ultimo_indice_cdi
      c = ChupinhadorCdi.new
      c.chupinhar

      indice = IndiceDiario.find_by(data: c.data)

    if indice.nil?
      indice = IndiceDiario.new(data: c.data, taxa_di: c.taxa)
      indice.save
    end

    indice
  end

end
