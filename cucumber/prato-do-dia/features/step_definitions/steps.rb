module Enjoeat
    def proto_do_dia(dia)

        if dia == 'segunda-feira'
            'Virado a Paulista'
        elsif dia == 'terça-feira'
            'Dobradinha'
        elsif dia == 'quarta-feira'
            'Feijoada'
        elsif dia == 'quinta-feira'
            'Macarronada'
        elsif dia == 'sexta-feira'
            'Filé de Merluza'
        elsif dia == 'sábado'
            'Veja o Cardápio'
        elsif dia == 'domingo'
            'Fechado'
        else
            'Dia inválido'
        end
        
    end
end
# expoe o modulo
World Enjoeat

Dado("que hoje é {string}") do |dia|
    @hoje = dia
end

# Dado("que hoje é terça-feira") do
#     @hoje = 'terça-feira'
# end

Quando("eu pergunto qual é o prato do dia") do
    @resposta = proto_do_dia(@hoje)
end

Então("a resposta deve ser {string}") do |resp|
    # @resposta
    expect(@resposta).to eql resp
end