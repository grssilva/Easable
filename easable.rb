# This is the class that wraps the easable value
class Easable
  attr_reader :start_value, :end_value
  attr_accessor :duration, :animation_type

  def initialize(duration = 3.seconds, animation_type = :linear)
    @duration = duration
    @animation_type = animation_type
  end

  def value=(new_value)
    # Don't allow the user to input the same value
    return if @end_value == new_value

    @start_value = value || new_value
    @end_value = new_value
    @start_at = Kernel.tick_count
  end

  def value
    progress = self.progress
    return @end_value if animation_over?

    case @start_value
    when Array then @start_value.map.with_index { |value, i| value + (@end_value[i] - value) * progress }
    when Hash then @start_value.map { |key, value| value + (@end_value[key] - value) * progress }.to_h
    else @start_value + (@end_value - @start_value) * progress
    end
  end

  # Returns a number between 0 and 1 based on the easing method
  def progress
    return 1 if animation_over?

    x = (Kernel.tick_count - @start_at) / @duration

    # We can just end if the animation is over
    if x >= 1
      end_animation
      1
    elsif x <= 0
      0
    else
      Easing.method(@animation_type).call(x)
    end
  end

  def end_animation
    @start_at = nil
    @start_value = nil
  end

  def animation_over?
    @start_at.nil?
  end

  def remaining_duration
    (Kernel.tick_count - @start_at) - @duration
  end

  def reset_to(value)
    @start_at = nil
    @start_value = nil
    @end_value = value
  end
end

# Create the attriubute for the easable
class Object
  def self.attr_easable(animation_type = :linear, duration = 3.seconds, *attributes)
    attributes.each do |attribute|
      define_method(attribute) do
        instance_variable_get("@#{attribute}_easable").value
      end

      define_method("#{attribute}=") do |value|
        unless instance_variable_defined?("@#{attribute}_easable")
          instance_variable_set("@#{attribute}_easable", Easable.new(duration, animation_type))
        end
        instance_variable_get("@#{attribute}_easable").value = value
      end
    end
  end
end