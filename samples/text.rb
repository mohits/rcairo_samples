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

cr.select_font_face("Sans", Cairo::FONT_SLANT_NORMAL,
                    Cairo::FONT_WEIGHT_BOLD)
cr.set_font_size(90.0)

cr.move_to(10.0, 135.0)
cr.show_text("Hello")

cr.move_to(70.0, 165.0)
cr.text_path("void")
cr.set_source_rgb(0.5, 0.5, 1)
cr.fill_preserve
cr.set_source_rgb(0, 0, 0)
cr.set_line_width(2.56)
cr.stroke

# draw helping lines
cr.set_source_rgba(1, 0.2, 0.2, 0.6)
cr.arc(10.0, 135.0, 5.12, 0, 2 * Math::PI)
cr.close_path
cr.arc(70.0, 165.0, 5.12, 0, 2 * Math::PI)
cr.fill

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-text.png',
                                      File.dirname(__FILE__)))
