describe 'Tabelas', :tbl do

    before(:each) do
        visit '/tables'
        # recurso do capybara
        # page.current_window.resize_to(1280, 800)
    end

    it 'Pega o tony stark na lista' do
        expect(page).to have_content 'Robert  Downey Jr'
    end

    it 'Deve exibir o salario do stark' do

        atores = all('table tbody tr')
        stark = atores.detect { |a| a.text.include?('Robert Downey Jr') }
        puts stark

        expect(page).to have_content '10.000.000'
    end

    it 'deve exibir o salario do vin diesel' do
        # capybara
        diesel = find('table tbody tr', text: 'Vin Diesel')
        expect(diesel).to have_content '10.000.000'
    end

    it 'deve exibir o filme velozes' do
        diesel = find('table tbody tr', text: '@vindiesel')
        move = diesel.all('td')[2].text
        puts move
        expect(diesel).to eql 'Velozes e Furiosos'
    end

    it 'deve exibir o insta do Chris Evans' do
        ev = find('table tbody tr', text: 'Chris Evans')
        ista = ev.all('td')[4].text

        expect(insta).to eql '@teamcevans'
    end


    it 'deve selecionar Chris Prat para remoção' do
        cr = find('table tbody tr', text: 'Chris Prat')
        cr.find('a', text: 'delete').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar Chris Prat para edição' do
        cr = find('table tbody tr', text: 'Chris Prat')
        cr.find('a', text: 'edit').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end