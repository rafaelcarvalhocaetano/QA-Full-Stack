#language:pt

Funcionalidade: Qual é o Prato do Dia
    Queremos saber qual o prato do dia na capital Paulista

    Cenario: Hoje é dia de Virada Paulista
    
        Dado que hoje é segunda-feira
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Virado a Paulista"

    Cenario: Hoje é dia de Dobradinha
        Dado que hoje é terça-feira
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Dobradinha"