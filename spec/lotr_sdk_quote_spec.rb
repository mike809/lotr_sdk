RSpec.describe LotrSdk::Quote do
  let(:quotes) { LotrSdk::Quote.all }

  context 'when requesting all quotes' do
    it 'returns a list of quotes' do
      expect(quotes).to be_a(Enumerable)
      expect(quotes.first).to be_a(LotrSdk::Quote)
    end

    it 'returns the correct number of Quotes' do
      expect(quotes.count).to eq(1000)
    end
  end

  context 'when requesting specific Quotes' do
    context 'when the Quote is The Lord of the Rings Series' do
      let(:quote) { LotrSdk::Quote.find('5cd96e05de30eff6ebcce7ea') }
      it 'returns the correct Quote data' do
        expect(quote.id).to eq('5cd96e05de30eff6ebcce7ea')
        expect(quote.dialog).to eq('Deagol!')
      end
    end

    context 'when checking the movie of a quote' do
      it 'returns the correct movie' do
        expect(quotes.first.dialog).to eq('Deagol!')
        expect(quotes.first.movie.name).to eq('The Return of the King')
        expect(quotes.last.dialog).to eq('Get the wounded on horses. The wolves of Isengard will return. Leave the dead.')
        expect(quotes.last.movie.name).to eq('The Two Towers')
      end
    end
  end
end
