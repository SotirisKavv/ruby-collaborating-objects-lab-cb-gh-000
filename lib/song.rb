class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(name)
    tmp = name.split(" - ")
    song = Song.new(tmp[1])
    song.artist_name = tmp[0]
    song
  end

  def artist_name=(name)
    Artist.find_or_create_by_name(name).add_song(self)
  end


end
