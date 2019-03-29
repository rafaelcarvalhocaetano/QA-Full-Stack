describe 'Upload de arquivos', :arquivo do

    before(:each) do
        visit '/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/API.txt'
        @imagem = Dir.pwd + '/spec/fixtures/fox.png'
    end

    it 'Upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'API.txt'
    end

    it 'Upload de imagem', :img do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        # times = Capybara.default_max_wait_time
        # sleep = times

        div_img = find('#new-image')
        expect(div_img[:src]).to include '/uploads/fox.png'
    end

    after(:each) do
        sleep 3
    end
end