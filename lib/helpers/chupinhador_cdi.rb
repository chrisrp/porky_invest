class ChupinhadorCdi < ChupinhadorIndiceBase

  def url
    'http://www.cetip.com.br/'
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
