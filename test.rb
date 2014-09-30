require 'restclient'
require 'nokogiri'


    url = 'http://www.bcb.gov.br/pt-br/paginas/default.aspx'
    page = Nokogiri::HTML(RestClient.get(url))

    tds = page.css("//table[@lang=\"pt-br\"]//td[@bgcolor='#f8f5f6']")

    p tds[7].to_s.scan(/[0-9]*[\/][0-9]*/).first
    p Date.today.year
