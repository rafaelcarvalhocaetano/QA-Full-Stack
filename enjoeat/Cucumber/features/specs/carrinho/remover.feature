#language: pt

Funcionalidade: Remover do carrinho
    Para que eu possa atualizar meu carrinho apensa com items desejados
    Sendo um cliente que desista de um ou mais produtos
    Posso remover itens do meu carrinho


    Cenario: Remover 1 item

        Dado que eu tenho os seguintes itens no carrinho:
            |nome                           |preco      |
            |Cup Cake                       |R$ 8,70    |
            |Donut                          |R$ 2,50    |
            |Pão Artesanal Italiano         |R$ 15,90   |
        Quando eu removo somente o item 1
        Então o valor total deve ser de "R$ 18,40"

    Cenario: Remover todos os itens

        Dado que eu tenho os seguintes itens no carrinho:
            |nome                           |preco      |
            |Cup Cake                       |R$ 8,70    |
            |Donut                          |R$ 2,50    |
            |Pão Artesanal Italiano         |R$ 15,90   |
        Quando eu removo todos os itens
        Então vejo a seguinte mensagem no carrinho "Seu carrinho está vazio!"