module Simuladores
  class LciController < ApplicationController


    def new
      @lci = Simuladores::Lci.new

      render 'show'
    end

    def index
      @lci = Simuladores::Lci.new
    end

    def show
      @lci = Simuladores::Lci.new
    end

    def create
      parametros = params[:simuladores_lci]
      @lci = Simuladores::Lci.new(parametros)
      @lci.simular

      render :show
    end

    def calcular
    end

  end
end
