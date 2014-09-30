class ChupinhadorSelic

  def chupinhar
    url = 'http://www.bcb.gov.br/pt-br/paginas/default.aspx'
    page = Nokogiri::HTML(RestClient.get(url))

    tds = page.css("//table[@lang=\"pt-br\"]//td[@bgcolor='#f8f5f6']")

    @taxa = tds[6].to_s.scan(/[0-9]*[,][0-9]*/)[0]
    @data = tds[7].to_s
  end

  def taxa
    @taxa.gsub(',', '.').to_f
  end
end
