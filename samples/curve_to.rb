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
x = 25.6
y = 128.0
x1 = 102.4
y1 = 230.4
x2 = 153.6
y2 = 25.6
x3 = 230.4
y3 = 128.0

cr.set_source_rgb(0, 0, 0)
cr.move_to(x, y)
cr.curve_to(x1, y1, x2, y2, x3, y3)
cr.set_line_width(10.0)
cr.stroke

cr.set_source_rgba(1, 0.2, 0.2, 0.6)
cr.set_line_width(6.0)
cr.move_to(x, y)
cr.line_to(x1, y1)
cr.move_to(x2, y2)
cr.line_to(x3, y3)
cr.stroke

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-curve-to.png',
                                      File.dirname(__FILE__)))
