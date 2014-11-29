class Simuladores::Lci
  include ActiveModel::Model

  attr :montante,
       :taxa_di,
       :dias,
       :percentual,
       :valor

  def	initialize(taxa_di, dias, percentual, valor)
    @taxa_di = taxa_di/100.0
    @dias = dias
    @percentual = percentual/100.0
    @valor = valor
  end

  def simular
    taxa_desanualizada = ((@taxa_di + 1)**(1.0/252) - 1) * @percentual

    m = @valor * (1 + taxa_desanualizada)**@dias
    @montante = m.round(2)
  end
end
