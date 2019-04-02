Dado("que o produto desejado é {string}") do |produto|
    @produto_nome = produto
end

Dado("o valor do produto é {string}") do |valor|
    @produto_nome = valor
end

Quando("eu adiciono {int} unidade deste item") do |int|
    find(".menu-item-info-box", text: @produto_nome.upcase).find(".add-to-cart").click
end

Então("deve ser adicionado {int} unindade\\(s) deste item") do |qtd|
    cart = find("#cart")
    expect(cart).to have_text "(#{qtd}x) #{@produto_nome}"
end

Então("o valor total deve ser de {string}") do |valor_total|
    cart = find("#cart")
    cart.find('tr', text: 'Total:').find('td')
    expect(cart).to eql valor_total
    puts total.text
    puts valor_total
    sleep 5
end

### lista de produtos
Dado("que os produtos desejados são:") do |table|
    @produto_list = table.hashes
end

Quando("eu adiciono todos os itens") do
    @produto_list.each do |x|
        # convertendo para inteiro to_i.times
        x['quantidade'].to_i.times do
            find(".menu-item-info-box", text: x["nome"].upcase).find(".add-to-cart").click
            sleep 2
        end
    end
end

Então("vejo todos os itens no carrinho") do |x|
    cart = find("cart")
    @produto_list.each do |p|
        expect(cart).to have_text "(#{["quantidade"]}x) #{p["nome"]}"
        sleep 2
    end
end