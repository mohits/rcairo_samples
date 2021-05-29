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
cr.set_line_width(6)

cr.rectangle(12, 12, 232, 70)
cr.new_sub_path
cr.arc(64, 64, 40, 0, 2 * Math::PI)
cr.new_sub_path
cr.arc_negative(192, 64, 40, 0, -2 * Math::PI)

cr.set_fill_rule(Cairo::FILL_RULE_EVEN_ODD)
cr.set_source_rgb(0, 0.7, 0)
cr.fill_preserve
cr.set_source_rgb(0, 0, 0)
cr.stroke

cr.translate(0, 128)
cr.rectangle(12, 12, 232, 70)
cr.new_sub_path
cr.arc(64, 64, 40, 0, 2 * Math::PI)
cr.new_sub_path
cr.arc_negative(192, 64, 40, 0, -2 * Math::PI)

cr.set_fill_rule(Cairo::FILL_RULE_WINDING)
cr.set_source_rgb(0, 0, 0.9)
cr.fill_preserve
cr.set_source_rgb(0, 0, 0)
cr.stroke

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-fill-style.png',
                                      File.dirname(__FILE__)))
