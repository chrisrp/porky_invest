#  taxa_di float
#  taxa_selic float
#  data    date

class IndiceDiario < ActiveRecord::Base
  self.table_name = 'indices_diarios'

  validates :data, presence: true
  validate :taxa_di_or_taxa_selic

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

  def self.carregar_ultima_taxa_selic
    c = ChupinhadorSelic.new
    c.chupinhar

    taxa = IndiceDiario.find_by(data: c.data)

    if taxa.nil?
      taxa = IndiceDiario.new(data: c.data, taxa_selic: c.taxa)
      taxa.save
    elsif taxa.taxa_selic.nil?
      taxa.update_attributes(taxa_selic: c.taxa)
    end

    taxa
  end

  private

  def taxa_di_or_taxa_selic
    unless taxa_di.present? || taxa_selic.present?
      errors.add(:base, 'preencher taxa selic ou di')
    end
  end

end
