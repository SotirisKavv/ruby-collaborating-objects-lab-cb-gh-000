class MP3Importer

  attr_accessor :files

  def initialize(files)
    @files = files
  end

  def import
    @files.each { |file| Song.new_by_filename(file) }
  end
end
