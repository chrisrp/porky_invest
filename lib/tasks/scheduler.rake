desc "Task chamada pelo heroku scheduler para carregar último indice cdi"
task :carregar_indice_cdi => :environment do
  IndiceCdi.carregar_ultimo_indice
end
