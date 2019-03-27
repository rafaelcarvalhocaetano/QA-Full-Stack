describe 'Forms' do
    # it 'Login com sucesso' do
    #     visit 'https://training-wheels-protocol.herokuapp.com/login'

    #     fill_in 'username', with: 'stark'
    #     fill_in 'password', with: 'jarvis!'
    #     click_button 'Login'

    #     expect(find('#flash').visible?).to be true
    #     puts find('#flash').text
    #     # expect(find('#flash').text).to eql 'Olá, Tony Stark. Você acessou a área logada!' -- ERRO - retorna erro no X
    #     # expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!' --OK
    #     # expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    # end

    it 'senha incorreta' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'username', with: 'starke'
        fill_in 'password', with: 'jarvis!w'
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'O usuário informado não está cadastrado!'

    end

end