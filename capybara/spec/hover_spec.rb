describe 'Mouse Hover', :hover do
    before(:each) do
        visit '/hovers'
    end

    it 'quando passo o mouse sobre o blade' do
        card = find('img[alt=Blade]')
        card.hover
        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o pantera negra' do
        card = find('img[alt^=Pantera]')
        card.hover
        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passo o mouse sobre o Homem Aranha', :arac do
        # expressão Começa ^ - com Homem
        # card = find('img[alt^=Homem]')
        # expressão Termina $ - em Aranha 
        # card = find('img[alt$=Homem]')
        # expressão Contem * - em Aranha 
        card = find('img[alt*=Homem]')

        card.hover
        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 2
    end

end