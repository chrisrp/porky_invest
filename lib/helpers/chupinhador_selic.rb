require 'nokogiri'

class ChupinhadorSelic

  attr_reader :taxa, :data
  def chupinhar
    url = 'http://www.bcb.gov.br/pt-br/paginas/default.aspx'
    page = Nokogiri::HTML(RestClient.get(url))

    tds = page.css("//table[@lang=\"pt-br\"]//td[@bgcolor='#f8f5f6']")

    @taxa = extrair_taxa(tds[6])
    @data = extrair_data(tds[7])
  rescue => e
    Rails.logger.error(e.message)
  end

  private

  def extrair_taxa(td)
    taxa = td.to_s.scan(/[0-9]*[,][0-9]*/)[0]
    taxa.gsub(',', '.').to_f
  end

  def extrair_data(td)
    dia_mes = td.to_s.scan(/\d\d/)
    Date.new(Date.today.year, dia_mes[1].to_i, dia_mes[0].to_i)
  end
end
