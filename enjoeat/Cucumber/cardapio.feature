#language: pt

Funcionalidade: Cardapio
    Para que eu possa decidir o que pretendo comer
    Sendo um usuário que escolheu um restaurante
    Posso acessar o cardápio

    # @cardapio
    Cenario: Produto

        Dado que eu acesso o sistema
        Quando eu acesso um restaurante "Burger House"
        Então vejo os seguintes itens disponivel no cardápio            
            |produto                   |descricao                          |preco          |
            |Classic Burger            |O clássico. Não tem como errar     |R$ 18,50       |
            |Batatas Fritas            |Batatas Fritas crocantes           |R$ 5,50        |
            |Refrigerante              |O refri mais gelado da cidade      |R$ 4,50        |
        # E vejo a descricao dos produtos
        # E vejo o preco dos produtos
