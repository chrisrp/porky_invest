class IndiceDiarioController < ApplicationController

  def new
    @indice_cdi = IndiceDiario.new
  end

  def create
    @indice_cdi = IndiceDiario.new(indice_cdi_params)
    @indice_cdi.save

    redirect_to action: 'index'
  end

  def index
    carregar_indices

    respond_to do |format|
      format.html
      format.json { render json: @indices.reverse }
    end
  end

  private

  def carregar_indices
    @indices = IndiceDiario.last(10).reverse
  end

  def indice_cdi_params
    params.require(:indice_diario).permit(:taxa_di, :data)
  end

end
