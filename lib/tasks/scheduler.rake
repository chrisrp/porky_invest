desc "Task chamada pelo heroku scheduler para carregar último indice cdi"
task :carregar_ultimo_indice_cdi => :environment do
  IndiceDiario.carregar_ultimo_indice_cdi
end

desc "Task chamada pelo heroku scheduler para carregar última taxa selic"
task :carregar_ultima_taxa_selic => :environment do
  IndiceDiario.carregar_ultima_taxa_selic
end
