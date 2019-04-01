#language: pt

Funcionalidade: Informacoes adicionais

    Para que eu possa ver as Informacoes adicionais
    Sendo um usuário que escolheu um restaurante
    Posso ver a cetegoria, descricao detalhada e horarios de funcionalidade

    @infos
    Cenario: Detalhes do restaurante

        Dado que acesso a lista de restaurantes
        Quando eu escolho um restaurante "Burger House"
        Então eu vejo sua categoria
        # E vejo a descricao detalhada
        # E vejo tambem o horario de funcionamento
            |categoria      |hamburgues                                 |
            |descrição      |40 anos se especializando em trash food    |
            |horários       |Funciona todos os dias, de 10h às 22h      |