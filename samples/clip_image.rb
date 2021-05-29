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
cr.arc(128.0, 128.0, 76.8, 0, 2*Math::PI)
cr.clip 
cr.new_path  # path not consumed by clip

# Source image is from:
# - https://www.publicdomainpictures.net/en/view-image.php?image=7683&picture=breaking-blue-wave
# Converted to PNG before using it
image = Cairo::ImageSurface.from_png(File.expand_path('../images/breaking-blue-wave.png',
                                                      File.dirname(__FILE__)))

w = image.width
h = image.height

cr.scale(256.0/w, 256.0/h)
cr.set_source(image, 0, 0)
cr.paint 

# save the file to the output directory
surface.write_to_png(File.expand_path('../output/cairo-clip-image.png',
                                      File.dirname(__FILE__)))
