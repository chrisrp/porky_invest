# language: pt

Funcionalidade: Exibição de uma página com as taixas do dia anterior.
  Como um usuário investidor
  Com o objetivo de ter um panorama dos indices diários
  Eu deveria poder visualizar as taxas do dia ou dia anterior

  Cenário: Exibir última taxa DI, quando houver
    Dado que exista uma taxa DI de "10.80"
    Quando eu acesso o dashboard
    Entao eu devo visualizar a taxa DI "10.80"

  Cenário: Não exibir última taxa DI, quando não houver
    Dado que não exista uma taxa DI
    Quando eu acesso o dashboard
    Entao eu devo visualizar a mensagem "não existe taxa cadastrada."

