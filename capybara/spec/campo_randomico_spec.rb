describe 'campos randomicos de data' do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/login2'
    end

    it 'com data', :data do
        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'
        
        login_form = find('#login')

        # switch case
        case login_form.text
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Ano/
            find('#year').set '1970'
        end

        click_button 'Login'
        sleep 3

    end

end