describe 'Seleção' do

    describe('single', :single) do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
        end

        it 'seleciona ator por nome' do
            ckt = find('.select2-selection--single')
            ckt.click
            qwe = find('.select2-results__option', text: 'Adam Sandler')
            qwe.click
        end

        it 'busca e click no ator' do
            find('.select2-selection--single').click
            sleep 2
            find('.select2-search__field').set 'Chris Rock'
            sleep 3
            find('.select2-results__option').click
            sleep 3
        end

        after(:each) do
            sleep 5
        end
    end

    describe('multiple', :multi) do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/multi.html'
        end

        def selecione(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'seleciona atores' do

            atores = ['Jim Carrey', 'Owen Wilson']

            atores.each do |a|
                selecione(a)
            end

            # selecione(atores)
            # selecione('Owen Wilson')

            # find('.select2-selection--multiple').click
            # find('.select2-search__field').set 'Owen Wilson'
            # find('.select2-results__option').click
            # sleep 2
        end

        after(:each) do
            sleep 5
        end
    end
end