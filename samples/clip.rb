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
cr.arc(128.0, 128.0, 76.8, 0, 2 * Math::PI)
cr.clip

cr.new_path #current path is not
						#consumed by cr.clip
cr.rectangle(0, 0, 256, 256)
cr.fill
cr.set_source_rgb(0, 1, 0)
cr.move_to(0, 0)
cr.line_to(256, 256)
cr.move_to(256, 0)
cr.line_to(0, 256)
cr.set_line_width(10.0)
cr.stroke

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-clip.png',
                                      File.dirname(__FILE__)))
