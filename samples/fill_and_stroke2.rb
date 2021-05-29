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
cr.move_to(128.0, 25.6)
cr.line_to(230.4, 230.4)
cr.rel_line_to(-102.4, 0.0)
cr.curve_to(51.2, 230.4, 51.2, 128.0, 128.0, 128.0)
cr.close_path

cr.move_to(64.0, 25.6)
cr.rel_line_to(51.2, 51.2)
cr.rel_line_to(-51.2, 51.2)
cr.rel_line_to(-51.2, -51.2)
cr.close_path

cr.set_line_width(10.0)
cr.set_source_rgb(0, 0, 1)
cr.fill_preserve
cr.set_source_rgb(0, 0, 0)
cr.stroke

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-fill-stroke2.png',
                                      File.dirname(__FILE__)))
