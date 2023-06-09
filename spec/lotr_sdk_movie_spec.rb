RSpec.describe LotrSdk::Movie do
  let(:movies) { LotrSdk::Movie.all }

  context 'when requesting all movies' do
    it 'returns a list of movies' do
      expect(movies).to be_a(Enumerable)
      expect(movies.first).to be_a(LotrSdk::Movie)
    end

    it 'returns the correct number of movies' do
      expect(movies.count).to eq(8)
    end
  end

  context 'when requesting specific movies' do
    context 'when the movie is The Lord of the Rings Series' do
      let(:movie) { LotrSdk::Movie.find('5cd95395de30eff6ebccde56') }
      it 'returns the correct movie data' do
        expect(movie.id).to eq('5cd95395de30eff6ebccde56')
        expect(movie.name).to eq('The Lord of the Rings Series')
      end
    end

    context 'when checking the quotes of movies' do
      it 'returns the correct number of quotes for each movie' do
        expect(movies.first.quotes.count).to eq(0)
        expect(movies.last.quotes.count).to eq(872)
      end
    end
  end
end
