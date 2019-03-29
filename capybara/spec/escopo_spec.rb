describe 'Escopo' do

    # escopo do capybara

    before(:each) do
        visit '/access'
    end

    it 'Escopo - login id dinamicos', :escopo do

        # seletor pai
        # login_form = find('#login')
        # login_form.find('input[name=username]').set 'stark'
        # login_form.find('input[name=password]').set 'jarvis!'

        # função / metodo do capybara
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'

            click_button 'Entrar'
        end

        # click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'

        sleep 3
    end


    it 'Escopo 2 > login', :lg do
        within('#signup') do
            find('input[name = username]').set 'rafael'
            find('input[name = password]').set '123123!'

            click_link 'Criar Conta'
        end

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'

        sleep 3
    end

end