class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    songs = []
    Song.all.collect {|song| songs << song if song.artist == self}
    songs
  end

  def self.find_or_create_by_name(name)
    Artist.all.each do |artist|
      if artist.name == name
        return artist
      end
    end
    Artist.new(name)
  end

  def print_songs
    Song.all.each do |song|
      if song.artist == self
        puts "#{song.name}"
      end
    end
  end
end
