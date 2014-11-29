module Simuladores
  class LciController < ApplicationController

    def show
      @lci = Simuladores::Lci.new(0,0,0,0)
    end

    def calcular
      parametros = params[:simuladores_lci]
      @lci = Simuladores::Lci.new(parametros['taxa_di'].to_d,
                                  parametros['dias'].to_i,
                                  parametros['percentual'].to_d,
                                  parametros['valor'].to_d)
      @lci.simular

      render :show
    end

  end
end
