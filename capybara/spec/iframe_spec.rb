describe 'iFrame', :frame do

    # before(:each) do
    #     visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
    # end

    describe 'bom', :bom do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 3
            end
        end
    end

    describe 'ruim', :ruim do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
        end

        it 'carrinho deve estar vazio' do
            scritp = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(scritp)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        sleep 3

        end
    end

end