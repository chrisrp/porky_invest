#  taxa_di float
#  data    date

class IndiceCdi < ActiveRecord::Base
  validates :data, presence: true
  validates :taxa_di, presence: true

  def self.carregar_da_cetip
    IndiceCdi.find_by(data: Date.today)
  end
end
