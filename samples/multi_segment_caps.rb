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
cr.move_to(50.0, 75.0)
cr.line_to(200.0, 75.0)

cr.move_to(50.0, 125.0)
cr.line_to(200.0, 125.0)

cr.move_to(50.0, 175.0)
cr.line_to(200.0, 175.0)

cr.set_line_width(30.0)
cr.set_line_cap(Cairo::LINE_CAP_ROUND)
cr.stroke

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-multi-segment-caps.png',
                                      File.dirname(__FILE__)))
