describe 'alerta JS' do

    before(:each) do
        visit '/javascript_alerts'
    end

    it 'enviando alerta', :alert do
        click_button 'Alerta'
        # usando selenium
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 2
    end

    it 'Sim - confirmar', :confirma do
        click_button 'Confirma'
        # usando selenium
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
        sleep 2
    end

    it 'Não - confirmar', :confirma do
        click_button 'Confirma'
        # usando selenium
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.dismiss        
        expect(page).to have_content 'Mensagem não confirmada'
        sleep 2
    end

    it 'Accept Prompt', :prompt do
        accept_prompt(with: 'Fernando') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, Fernando'
        sleep 3
    end

    it 'dismiss prompt', :implement do
        #deve clicar em prompt e cancelar

        dismiss_prompt(with: 'Fernando') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, null'
        sleep 3
    end

end