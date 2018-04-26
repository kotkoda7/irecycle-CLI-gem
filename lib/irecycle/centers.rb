
class Irecycle::Center

	attr_accessor :name, :address1, :address2, :address3, :tel, :dist, :material, :restrictions

@@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
  	@@all = []
  end


end


