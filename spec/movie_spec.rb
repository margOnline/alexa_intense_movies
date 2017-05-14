require 'movie'

RSpec.describe Movie do
  describe '.find' do
    it 'delegates finding a movie to an Imdb client search' do
      client = double("Imdb::Search")
      expect(client).to receive_message_chain(:new, :movies, :first)

      described_class.find("Some Movie Title", client)
    end
  end

  describe '#cast_list' do
    it 'returns a human-readable string of cast members' do
      imdb_record = double("Imdb::Movie", title: "Movie", cast_members: ["Star1, Star2"])
      expect(described_class.new(imdb_record).cast_members).to eq "Movie starred Star1, Star2"
    end
  end

  describe '#directors' do
    it 'returns a human-readable string of director names' do
      imdb_record = double("Imdb::Movie", title: "Movie", director: ["Director1, Director2"])
      expect(described_class.new(imdb_record).directors).to eq "Movie was directed by Director1, Director2"
    end
  end
  
end