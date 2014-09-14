require 'nokogiri'

class ChupinhadorCdi

  def chupinhar
    url = 'http://www.cetip.com.br/'
    page = Nokogiri::HTML(RestClient.get(url))

    @taxa = page.css('span#ctl00_Banner_lblTaxDI').text
    @data = page.css('span#ctl00_Banner_lblTaxDateDI').text
  end

  def taxa
   if  @taxa
     @taxa.gsub('%', '').gsub(',', '.').to_f
   end
  end

  def data
    @data.gsub('(', '').gsub(')', '').to_date
  end
end
