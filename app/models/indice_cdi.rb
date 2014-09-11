#  taxa_di float
#  data    date

class IndiceCdi < ActiveRecord::Base
  validates :data, presence: true
  validates :taxa_di, presence: true

  def self.carregar_ultima_taxa
    true
  end
end
