#  taxa_di float
#  data    date

class IndiceCdi < ActiveRecord::Base
  validates :data, presence: true
  validates :taxa_di, presence: true

  def self.carregar_ultimo_indice
      c = ChupinhadorCdi.new
      c.chupinhar

      indice = IndiceCdi.find_by(data: c.data)

    if indice.nil?
      indice = IndiceCdi.new(data: c.data, taxa_di: c.taxa)
      indice.save
    end

    indice
  end

end
