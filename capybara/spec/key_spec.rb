describe 'key', :teclado do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/key_presses'
    end

    it 'enviando do teclado' do

        teclas = %i[tab escape space enter shift control alt]


        teclas.each do |a|
            find('#campo-id').send_keys a
            expect(page).to have_content 'You entered: ' + a.to_s.upcase
            sleep 1
        end

        # tecla espaço
        # find('#campo-id').send_keys :space

        # tecla Tab
        # find('#campo-id').send_keys :tab
        
        # expect(page).to have_content 'You entered: TAB'
    end


    it 'enviando letras', :enviando do
        letras = %w[a b c d e f g]


        letras.each do |b|
            find('#campo-id').send_keys b
            #verificação
            expect(page).to have_content 'You entered: ' + b.to_s.upcase
            sleep 1
        end
    end

end