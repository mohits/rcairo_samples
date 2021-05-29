# RCairo Samples

[Cairo Graphics](https://cairographics.org/) is a powerful 2D graphics library. Although Cairo is a C library, there are bindings available for many languages. The [RCairo gem](https://github.com/rcairo/rcairo/) allows Ruby programs to use Cairo. This repository has the [simple samples from the Cairographics website](https://www.cairographics.org/samples/), ported to run under Ruby using the RCairo gem.

The samples were developed and verified using Ruby 2.6 on Windows. The code here takes reference from the samples on the CairoGraphics website for the code; minimal changes have been made to the code. As mentioned on that page, the original snippets were created by Øyvind Kolås for a paper submitted to GUADEC 2004. All of his original snippet code is considered to be part of the public domain. All the samples here can similarly be used for any purpose.

Please see https://notepad.onghu.com/2021/cairo-samples-in-ruby/ for more information.

## Organisation

The repository is organised as below:
* samples - this has the actual code with each file having a single sample
* images - this has one image that was used as an input for some of the samples
* output - these are reference outputs created by running the code

## Image Credit

Some of the samples require an image as an input. The image is taken from: https://www.publicdomainpictures.net/en/view-image.php?image=7683&picture=breaking-blue-wave and is in the public domain.
