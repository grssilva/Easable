# This file contains multiple implementation of easing functions.
# based on https://easings.net/
module Easing
  def self.identity x
    x
  end

  def self.linear x
    x
  end

  def self.flip x
    1 - x
  end

  # sine
  def self.in_sine x
    1 - Math.cos((x * Math::PI) / 2)
  end

  def self.out_sine x
    Math.sin((x * Math::PI) / 2)
  end

  def self.in_out_sine x
    -(Math.cos(Math::PI * x) - 1) / 2
  end

  # quad
  def self.in_quad x
    x**2
  end

  def self.out_quad x
    1 - (1 - x)**2
  end

  def self.in_out_quad x
    x < 0.5 ? 2 * x**2 : 1 - (-2 * x + 2)**2 / 2
  end

  # cubic
  def self.in_cubic x
    x**3
  end

  def self.out_cubic x
    1 - (1 - x)**3
  end

  def self.in_out_cubic x
    x < 0.5 ? 4 * x**3 : 1 - (-2 * x + 2)**3 / 2
  end

  # quart
  def self.in_quart x
    x**4
  end

  def self.out_quart x
    1 - (1 - x)**4
  end

  def self.in_out_quart x
    x < 0.5 ? 8 * x**4 : 1 - (-2 * x + 2)**4 / 2
  end

  # quint
  def self.in_quint x
    x**5
  end

  def self.out_quint x
    1 - (1 - x)**5
  end

  def self.in_out_quint x
    x < 0.5 ? 16 * x**5 : 1 - (-2 * x + 2)**5 / 2
  end

  # expo
  def self.in_expo x
    return 0 if x.zero?

    2**(10 * x - 10)
  end

  def self.out_expo x
    return 1 if x == 1

    1 - 2**(-10 * x)
  end

  def self.in_out_expo x
    return x if x == 0 || x == 1

    x < 0.5 ? 2**(20 * x - 10) / 2 : (2 - 2**(-20 * x + 10)) / 2
  end

  # circ
  def self.in_circ x
    1 - Math.sqrt(1 - x**2)
  end

  def self.out_circ x
    Math.sqrt(1 - (1 - x)**2)
  end

  def self.in_out_circ x
    x < 0.5 ? (1 - Math.sqrt(1 - (2 * x)**2)) / 2 : (Math.sqrt(1 - (-2 * x + 2)**2) + 1) / 2
  end

  # back
  def self.in_back x
    c1 = 1.70158
    c3 = c1 + 1

    c3 * x**3 - c1 * x**2
  end

  def self.out_back x
    c1 = 1.70158
    c3 = c1 + 1

    1 + c3 * (x - 1)**3 + c1 * (x - 1)**2
  end

  def self.in_out_back x
    c1 = 1.70158
    c2 = c1 * 1.525

    x < 0.5 ? ((2 * x)**2 * ((c2 + 1) * 2 * x - c2)) / 2 : ((2 * x - 2)**2 * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2;
  end

  #elastic
  def self.in_elastic x
    return x if x == 0 || x == 1

    c4 = (2 * Math::PI) / 3

    -(2**(10 * x - 10)) * Math.sin((x * 10 - 10.75) * c4)
  end

  def self.out_elastic x
    return x if x == 0 || x == 1

    c4 = (2 * Math::PI) / 3

    2**(-10 * x) * Math.sin((x * 10 - 0.75) * c4) + 1
  end

  def self.in_out_elastic x
    return x if x == 0 || x == 1

    c5 = (2 * Math::PI) / 4.5
    if x < 0.5
      -(2**(20 * x - 10) * Math.sin((20 * x - 11.125) * c5)) / 2
    else
      (2**(-20 * x + 10) * Math.sin((20 * x - 11.125) * c5)) / 2 + 1
    end
  end

  # bounce
  # Code provided by github.com/jesusgollonet using github copilot
  def self.in_bounce x
    1 - out_bounce(1 - x)
  end

  def self.out_bounce x
    return 1 if x == 1

    x < 4 / 11.0 ? (121 * x * x) / 16 : (363 / 40.0 * x * x) - (99 / 10.0 * x) + 17 / 5.0
  end

  def self.in_out_bounce x
    return in_bounce(x) if x < 0.5
    return out_bounce(x) if x >= 0.5
    return in_bounce(x * 2) / 2 if x < 0.75
    return out_bounce(x * 2 - 1) / 2 + 0.5
  end
end