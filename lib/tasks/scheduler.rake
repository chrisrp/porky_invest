desc "Task chamada pelo heroku scheduler para carregar último indice cdi"
task :carregar_indice_cdi => :environment do
  IndiceDiario.carregar_ultimo_indice_cdi
end
