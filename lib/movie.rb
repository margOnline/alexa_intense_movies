require 'imdb'
require 'forwardable'

class Movie
  extend Forwardable
  def_delegators :@imdb_record, :title, :plot_synopsis

  def self.find(movie_title, client = Imdb::Search)
    movie_list = client.new(movie_title).movies
    new(movie_list.first)
  end

  def initialize(imdb_record)
    @imdb_record = imdb_record
  end

  def cast_members
    "#{title} starred #{@imdb_record.cast_members.join(", ")}"
  end

  def directors
    "#{title} was directed by #{@imdb_record.director.join(", ")}"
  end
end
