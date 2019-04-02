Dado("que acesso a lista de restaurante") do
    visit '/restaurants'
end
Quando("eu escolho o restaurante {string}") do |resp|
    find('.restaurant-item', text: resp.upcase).click
end

Então("vejo os seguintes itens disponíveis no cardápio") do |table|
    items = all('.menu-item-info-box')

    prduct_data = table.hashes
    prduct_data.each do |resp, index|
        expect(items[index]).to have_text resp['produto'].upcase
        expect(items[index]).to have_text resp['descricao']
        expect(items[index]).to have_text resp['preco']
    end
end

Então("eu vejo as seguintes informacoes adicionais:") do |table|
    infos = puts table.rows_hash
    details = find('#detail')
    expect(details).to have_text infos['categoria']
    expect(details).to have_text infos['descricao']
    expect(details).to have_text infos['horario']
end