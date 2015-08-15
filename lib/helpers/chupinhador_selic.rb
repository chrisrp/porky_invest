class ChupinhadorSelic < ChupinhadorIndiceBase

  def url
    'http://www.bcb.gov.br/pt-br/paginas/default.aspx'
  end

  private

  def extrair_taxa(page)
    td = page.css("//table[@lang=\"pt-br\"]//td[@bgcolor='#f8f5f6']")[6]
    taxa = td.to_s.scan(/[0-9]*[,][0-9]*/)[0]
    taxa.gsub(',', '.').to_f
  end

  def extrair_data(page)
    td = page.css("//table[@lang=\"pt-br\"]//td[@bgcolor='#f8f5f6']")[7]

    dia_mes = td.to_s.scan(/\d\d/)
    Date.new(Date.today.year, dia_mes[1].to_i, dia_mes[0].to_i)
  end
end
