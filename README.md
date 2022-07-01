# Easable
Fast and easy easing for Dragon Ruby

The objective of this project is to enable adding easing to any game with a single line of code.

Instead of:
attr_access :position

you can use:
attr_easable :linear, 3.seconds, :position

and you instantly have access to a easable variable

you can still use

self.position = [x, y] to add the position
and when you access it using the self.position method, you get the correct value depening on the easing method

![screenshot](screenshot.gif)