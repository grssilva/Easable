# Easable
Fast and easy easing for Dragon Ruby

The objective of this project is to enable adding easing to any game with a single line of code.

Instead of
```
attr_access :position
```
you can use:
```
attr_easable :linear, 3.seconds, :position
```
and you instantly have access to a easable variable

In the case above, *linear* is the easing method, *3.seconds* is the duration of the easing and *:position* if the name of the variable

you can still use
```
self.position = [x, y]
```
to set the position
and when you access it using the 
```
self.position 
```
you get the correct value depening on the easing method

![screenshot](screenshot.gif)

