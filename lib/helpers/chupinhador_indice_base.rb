require 'nokogiri'

class ChupinhadorIndiceBase

  attr_reader :taxa, :data

  def chupinhar
    page = Nokogiri::HTML(RestClient.get(url))

    @taxa = extrair_taxa(page)
    @data = extrair_data(page)
  rescue => e
    Rails.logger.error(e.message)
  end

end

