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
end