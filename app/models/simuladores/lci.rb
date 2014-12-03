class Simuladores::Lci
  include ActiveModel::Model

  attr_accessor :montante,
       :taxa_di,
       :dias,
       :percentual,
       :valor

  def simular
    taxa_desanualizada = ((@taxa_di.to_d/100.0 + 1)**(1.0/252) - 1) * @percentual.to_d/100.0

    m = @valor.to_d * (1 + taxa_desanualizada)**@dias.to_i
    @montante = m.round(2)
  end
end
