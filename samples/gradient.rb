#!/usr/bin/env ruby

# Ruby/ RCairo equivalent of Cairo graphics samples
# Source: https://www.cairographics.org/samples
# Ported by Mohit Sindhwani, 2021.
# See https://notepad.onghu.com/2021/cairo-samples-in-ruby/
# This code is in the public domain and may be used in any way

require 'cairo'

# Create a new image surface
width = 256
height = 256
surface = Cairo::ImageSurface.new(width, height) 

# Create a Cairo Context for the surface
cr = Cairo::Context.new(surface)
cr.set_source_rgb(0.95, 0.95, 0.95)
cr.paint

# The main code
cr.set_source_rgb(0, 0, 0)
#cr.pattern_t *pat

# Create the Linear Pattern
pat = Cairo::LinearPattern.new(0.0, 0.0,  0.0, 256.0)
pat.add_color_stop_rgba(1, 0, 0, 0, 1)
pat.add_color_stop_rgba(0, 1, 1, 1, 1)
cr.rectangle( 0, 0, 256, 256)
cr.set_source( pat)
cr.fill

# Create the radial pattern
pat = Cairo::RadialPattern.new(115.2, 102.4, 25.6,
                                   102.4,  102.4, 128.0)
pat.add_color_stop_rgba(0, 1, 1, 1, 1)
pat.add_color_stop_rgba(1, 0, 0, 0, 1)
cr.set_source(pat)

# Draw the circle filled with the radial pattern
cr.arc( 128.0, 128.0, 76.8, 0, 2 * Math::PI)
cr.fill

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-gradient.png',
                                      File.dirname(__FILE__)))
