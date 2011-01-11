#Represents and gives access to mouse actions. Implemented as a singleton, but accessed through class methods to make the API more contained.
class Bewildr::Mouse
  include Singleton

  def initialize
    @clickr = Bewildr::Clickr::Clickr.new
  end

  #Returns the BewildrClickr instance - don't use!
  def clickr
    @clickr
  end

  #Clicks the mouse at the supplied point
  def self.click(clickable_point)
    instance.clickr.click(clickable_point)
  end

  #Double clicks the mouse at the supplied point
  def self.double_click(clickable_point)
    instance.clickr.double_click(clickable_point)
  end

  #Right clicks the mouse at the supplied point
  def self.right_click(clickable_point)
    instance.clickr.right_click(clickable_point)
  end
end

=begin
        Methods in BewildrClickr dll that need wrapping here...

        public void Drag(Point startingLocation, Point targetLocation)
        public void SetLocation(Point location)
        public void LeftMouseButtonDown()
        public void LeftMouseButtonUp()
        public void RightMouseButtonDown()
        public void RightMouseButtonUp()
=end