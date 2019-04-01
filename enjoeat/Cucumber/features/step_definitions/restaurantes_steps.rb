Quando("acesso a lista de restaurantes") do
    visit '/restaurants'

    @restaurante_data = [
        {name: 'Bread & Bakery', category: 'Padaria', delivery_time: '25 minutos', rating: 4.9},
        {name: 'Burger House', category: 'Hamburgers', delivery_time: '30 minutos', rating: 3.5},
        {name: 'Coffee Corner', category: 'Cafeteria', delivery_time: '20 minutos', rating: 4.8}
    ]
end

Então("vejo todas as opções disponíveis") do
    restaurante = all('.restaurant-item')
    except(restaurante.size).to be > 0
end

Então("cada restaurante deve exibir sua categoria") do
    restaurante = all('.restaurant-item')

    @restaurante_data.each_with_index do |x, index|
        expect(restaurante[index]).to have_text x[:category]
    end
end

Então("cada restaurante deve exibir o tempo de entrega") do

    restaurante = all('.restaurant-item')

    @restaurante_data.each_with_index do |x, index|
        expect(restaurante[index]).to have_text x[:delivery_time]
    end
end

Então("cada restaurante deve exibir sua nota de avaliação") do
    restaurante = all('.restaurant-item')

    @restaurante_data.each_with_index do |x, index|
        expect(restaurante[index]).to have_text x[:rating]
    end
end