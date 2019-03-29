describe 'Alterando janelas' do

    before(:each) do
        visit '/windows'
    end

    it 'nova janela', :wind do

        # abrindo janela do tipo link
        new_wind = window_opened_by { click_link 'Clique aqui' }

        within_window -> { page.title == 'Nova Janela' } do
            expect(page).to have_content 'Aqui temos uma nova janela \o/'
        end

        # fechando janela
        new_wind.close
        info = expect(new_wind.closed?).to be true
        puts info
        sleep 3
    end
end