class AvengerHeaderQuarter
    attr_accessor :list

    def initialize
        self.list = []
    end
    
    def put(name)
        self.list.push(name)
    end
end

describe AvengerHeaderQuarter do
    
    it 'deve adicionar um vingador' do
        hq = AvengerHeaderQuarter.new
        hq.put('Spiderman')
        expect(hq.list).to eql ['Spiderman']
    end

    it 'deve adicionar uma lista de vingadores' do
        hq = AvengerHeaderQuarter.new
        hq.put('Thor')
        hq.put('Spiderman')
        hq.put('Spiderman')

        resp = hq.list.size > 0
        expect(hq.list.size).to be > 0
        expect(resp).to be true
    end

    it 'deve adicionar uma lista de vingadores' do
        a = AvengerHeaderQuarter.new
        a.put('Thor')
        a.put('Hulk')
        a.put('Spiderman')
        a.put('Formiga')
        expect(a.list).to include 'Thor'
    end

    it 'primeiro da lista' do
        qa = AvengerHeaderQuarter.new
        qa.put('Thor')
        qa.put('Hulk')
        qa.put('Spiderman')
        expect(qa.list).to start_with('Thor')
    end

    it 'ironman deve ser o ultimo da lista' do
        tr = AvengerHeaderQuarter.new
        tr.put('Thor')
        tr.put('Hulk')
        tr.put('Spiderman')
        tr.put('Ironman')
        expect(tr.list).to end_with('Ironman')
    end

    it 'verifica sobre nome' do
        avenger = 'Peter Parker'
        expect(avenger).to match(/Parker/)
        expect(avenger).not_to match(/Parkerr/)
    end

end