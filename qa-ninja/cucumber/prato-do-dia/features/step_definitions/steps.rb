module Enjoeat
    def proto_do_dia(dia)
        if dia == 'segunda-feira'
            'Virado a Paulista'
        elsif dia == 'terça-feira'
            'Dobradinha'
        end
    end
end
# expoe o modulo
World Enjoeat

Dado("que hoje é segunda-feira") do
    @hoje = 'segunda-feira'
end

Dado("que hoje é terça-feira") do
    @hoje = 'terça-feira'
end

Quando("eu pergunto qual é o prato do dia") do
    @resposta = proto_do_dia(@hoje)
end

Então("a resposta deve ser {string}") do |resp|
    # @resposta
    expect(@resposta).to eql resp
end