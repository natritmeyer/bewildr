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
  def self.click(point)
    instance.clickr.click(point)
  end

  #Double clicks the mouse at the supplied point
  def self.double_click(point)
    instance.clickr.double_click(point)
  end

  #Right clicks the mouse at the supplied point
  def self.right_click(point)
    instance.clickr.right_click(point)
  end

  #Press the left mouse button down at the current point
  def self.left_down
    instance.clickr.left_mouse_button_down
  end

  #Release the left mouse button
  def self.left_up
    instance.clickr.left_mouse_button_up
  end

  #Moves the mouse to the supplied point
  def self.move_to(point)
    instance.clickr.set_location(point)
  end

  #Drags the mouse from one location to another, and optionally, via another! Pass a has containing the following keys:
  #  :from
  #  :to
  #  :via (optional)
  #  :wait_at_via_for
  #The value for each of those keys should be either a point or an element apart from :wait_at_via_for which
  #takes seconds (eg: 0.2, 3, etc). If an element is supplied, the drag point will be the element's clickable point
  def self.drag(args)
    raise "Can't drag without a :from key in the hash" unless args.keys.include?(:from)
    raise "Can't drag without a :to key in the hash" unless args.keys.include?(:to)

    point_from = args[:from]
    point_to   = args[:to]
    point_via  = args[:via]
    args[:wait_at_via_for].nil? ? wait_time = 2 : wait_time = args[:wait_at_via_for]

    point_from = point_from.clickable_point if point_from.instance_of?(Bewildr::Element)
    point_to   = point_to.clickable_point if point_to.instance_of?(Bewildr::Element)
    point_via  = point_via.clickable_point if !point_via.nil? && point_via.instance_of?(Bewildr::Element)
    
    raise "Supplied :from was not an Element or a Point" unless point_from.class == System::Windows::Point
    raise "Supplied :to was not an Element or a Point"   unless point_to.class   == System::Windows::Point
    raise "Supplied :via was not an Element or a Point"  unless point_via.nil? || point_via.class  == System::Windows::Point

    self.move_to(point_from)
    self.left_down
    sleep 0.2

    if point_via.instance_of?(System::Windows::Point)
      almost_midway = System::Windows::Point.new
      almost_midway.x = point_via.x + 1
      almost_midway.y = point_via.y + 1
      self.move_to(almost_midway)
      sleep 0.3
      self.move_to(point_via)
      sleep wait_time
    end

    almost_there = System::Windows::Point.new
    almost_there.x = point_to.x + 1
    almost_there.y = point_to.y + 1

    self.move_to(almost_there)
    sleep 0.2
    self.move_to(point_to)
    self.left_up
  end
end

=begin
        Methods in BewildrClickr dll that need wrapping here...

        public void Drag(Point startingLocation, Point targetLocation)
        public void RightMouseButtonDown()
        public void RightMouseButtonUp()
=end