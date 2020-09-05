# Instructions for new users

* Download the scad files and keep them in the same directory.  
  * joints.scad is a library that creates the pins for connecting parts
  * functions.scad contains the meat of the code
  * variables.scad contains all of the settings for customization
  * assembled.scad shows a 3D view of the assemlbed box
  * \*\_cutsheet.scad files are for generating the 2D output for actually cutting
* Open assembled.scad and optionally all_processes_cutsheet.scad in OpenSCAD
* Make sure Design -> Automatic Reload and Compile is checked
* Edit variables.scad in a text editor.  After saving changes the OpenSCAD windows should update. 
* Play with the numbers to create the box you want.  A visual representation of what the different variables do is shown below.
* Once complete render the 2D files by pressing F6
* File -> Export DXF or SVG
* The cutsheets aren't smart enough to scale for all box sizes.  Some options to fix this:
  * Edit functions.scad
  * Try to drag the drawings in your CAM program.  Some will support this.
  * Open the DXF or SVG in Inkscape
  * Post a copy of variables.scad on the Maslow forums.  I *might* be able to post a fixed cutsheet module.  

# Instructions for advanced users

This method is best for creating many different boxes with a consistent look.

* Open src/functions.scad and src/variables.scad for reference
  * Only change things in these files that belong to all boxes
* Create a new file (preferably in builds/) and include variables.scad
  * Only add what's necessary to these files
* If starting with one of my builds the RENDER and PREVIEW comments are for my post processor:
  * https://github.com/AaronVerDow/openscad-post-processor

# Variables

## cargo_x
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/cargo_x_demo.gif)
## cargo_y
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/cargo_y_demo.gif)
## cargo_z
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/cargo_z_demo.gif)
## explode
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/explode_demo.gif)
## pattern_gap
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/pattern_gap_demo.gif)
## pattern_hole
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/pattern_hole_demo.gif)
## pintail_gap
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/pintail_gap_demo.gif)
## skirt
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/skirt_demo.gif)
## wall
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/wall_demo.gif)
## wood
![](https://raw.githubusercontent.com/AaronVerDow/Cargo_Box/master/animations/output/wood_demo.gif)
