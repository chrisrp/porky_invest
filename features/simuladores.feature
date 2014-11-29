
# language: pt

Funcionalidade: Exibicao de simuladores de investimentos de renda fixa

  Cenário: Simular um LCI
    Dado que eu esteja no simulador de LCI
    Quando eu informo a taxa do cdi de "10.81"
    E "8" dias de aplicacao
    E o percentual do cdi de "84.25"% 
    E o valor do investimento de "1000"  
    E peco para calcular
    Entao devo ver o montante de "1002.75"

