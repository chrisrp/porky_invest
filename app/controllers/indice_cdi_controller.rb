class IndiceCdiController < ApplicationController

  def new
    @indice_cdi = IndiceCdi.new
  end

  def create
    @indice_cdi = IndiceCdi.new(indice_cdi_params)
    @indice_cdi.save

    carregar_indices
    render :index
  end


  private

  def carregar_indices
    @indices = IndiceCdi.last(10).reverse
  end

  def indice_cdi_params
    params.require(:indice_cdi).permit(:taxa_di, :data)
  end

end
