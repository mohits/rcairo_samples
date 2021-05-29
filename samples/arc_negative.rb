#!/usr/bin/env ruby

# Ruby/ RCairo equivalent of Cairo graphics samples
# Source: https://www.cairographics.org/samples
# Ported by Mohit Sindhwani, 2021.
# See https://notepad.onghu.com/2021/cairo-samples-in-ruby/
# This code is in the public domain and may be used in any way

require 'cairo'

# Set up the parameters
xc = 128.0
yc = 128.0
radius = 100.0
angle1 = 45.0  * (Math::PI/180.0) # angles are specified
angle2 = 180.0  * (Math::PI/180.0) # in radians

# Create a new image surface
width = 256
height = 256
surface = Cairo::ImageSurface.new(width, height) 

# Create a Cairo Context for the surface
cr = Cairo::Context.new(surface)
cr.set_source_rgb(0.95, 0.95, 0.95)
cr.paint

# The main negative arc
cr.set_source_rgb(0, 0, 0)
cr.set_line_width(10.0)
cr.arc_negative(xc, yc, radius, angle1, angle2)
cr.stroke

# Draw helping lines
cr.set_source_rgba(1, 0.2, 0.2, 0.6);
cr.set_line_width(6.0);

# First, the circle at the centre
cr.arc(xc, yc, 10.0, 0, 2*Math::PI);
cr.fill;

# Then, the lines reaching out
cr.arc(xc, yc, radius, angle1, angle1);
cr.line_to(xc, yc);
cr.arc(xc, yc, radius, angle2, angle2);
cr.line_to(xc, yc);
cr.stroke;

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-arc-negative.png',
                                      File.dirname(__FILE__)))
