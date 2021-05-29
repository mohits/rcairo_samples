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
utf8 = "cairo"

cr.select_font_face("Sans",
                    Cairo::FONT_SLANT_NORMAL,
                    Cairo::FONT_WEIGHT_NORMAL)

cr.set_font_size(100.0)
extents = cr.text_extents(utf8)

x = 25.0
y = 150.0

cr.move_to(x, y)
cr.show_text(utf8)

# draw helping lines */
cr.set_source_rgba(1, 0.2, 0.2, 0.6)
cr.set_line_width(6.0)
cr.arc(x, y, 10.0, 0, 2 * Math::PI)
cr.fill
cr.move_to(x, y)
cr.rel_line_to(0, -extents.height)
cr.rel_line_to(extents.width, 0)
#cr.rel_line_to(extents.x_advance, 0)
cr.rel_line_to(extents.x_bearing, -extents.y_bearing)
#cr.rel_line_to(0, extents.height)
cr.stroke
puts extents

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-text-extents.png',
                                      File.dirname(__FILE__)))
