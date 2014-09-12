
# language: pt

Funcionalidade: Exibição de uma página com as taixas do dia anterior.
  Como um usuário investidor
  Com o objetivo de enriquecer o histórico de taxas anteriores
  Eu deveria poder inserir novas taxas

  Cenário: Cadastrar nova taxa cdi
    Dado que eu esteja no cadastro de taxas cdi
    Quando eu informo a taxa "10.81"
    E data "01/01/2014"
    E gravo a informação
    Entao eu devo ser redirecionado para a página de taxas
    E visualizar a taxa "10.81" da data "2014-01-01"

    Cenário: Acessando quando não tenho taxas cadastradas
    Dado que eu não tenha taxas cadastradas
    Quando eu visito a lista de taxas
    Entao eu devo visualizar a mensagem "não existe taxa cadastrada."

    Cenário: Visualizar as taxas cadastradas
    Dado que eu tenha taxas cadastradas
    Quando eu visito a lista de taxas
    Entao eu não devo visualizar a mensagem "não existe taxa cadastrada."

