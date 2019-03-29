describe 'Caixa de opções', :dropdown do

    it 'Item especifico simples' do
        visit '/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3
    end

    it 'Item especcífico' do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end

    it 'Qualquer item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        sleep 3

    end
end