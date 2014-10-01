require 'nokogiri'

class ChupinhadorCdi

  attr_reader :taxa, :data

  def chupinhar
    url = 'http://www.cetip.com.br/'
    page = Nokogiri::HTML(RestClient.get(url))

    @taxa = extrair_taxa(page)
    @data = extrair_data(page)
  rescue => e
    Rails.logger.error(e.message)
  end

  private

  def extrair_taxa(page)
    taxa = page.css('span#ctl00_Banner_lblTaxDI').text
    taxa.gsub('%', '').gsub(',', '.').to_f
  end

  def extrair_data(page)
    data = page.css('span#ctl00_Banner_lblTaxDateDI').text
    data.gsub('(', '').gsub(')', '').to_date
  end
end
