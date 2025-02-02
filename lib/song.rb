class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save 
    song 
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = self.create
    song.name = name_of_song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    parts = file.split(' - ') 
    artist = parts[0]
    name = parts[1].sub('.mp3', '')

    song = self.create 
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    parts = file.split(' - ') 
    artist = parts[0]
    name = parts[1].sub('.mp3', '')

    song = self.create 
    song.name = name
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    @@all.clear 
  end
  
end
