// this file must be downloaded and placed in the same directory
include <functions.scad>;
in=25.4;

// size of intended cargo
cargo_y=14*in;
cargo_x=12*in;
cargo_z=8*in;

// how thick the wood is.  I keep this a little large or the slots will be too tight
wood=1/2*in;

// thickness of wood around edges and joints
wall=0.75*in;

// outer size of box
box_x=cargo_x+wood*2;
box_y=cargo_y+wood*2;
box_z=cargo_z;

// change to true for a onewheel slot
onewheel=false;

// wheel size 
onewheel_d=10.5*in;
onewheel_h=7*in;

// board size
onewheel_x=22*in;
onewheel_y=2.5*in;
onewheel_z=8*in;

// how far to slide in from center
onewheel_offset=-2.5*in;


// meta variable used in other places
bit=0.25*in;

// how far apart to space parts in cutsheet
cutgap=2*in;

// add holes for screwing in joints
joint_holes=0;
//joint_holes=bit;

// diameter of cuts in corners of joints
// zero to disable
ear=bit;

// more aggressive corner cuts
ear_extra=0;

// extra wood below bottom
// this is a must have for cargo nets
skirt=wall;

// diameter of mounting bolt holes
bolt=10;

// placement of bolts within mounting pattern
// these will be mirrored across x axis
bolts_x=[140,115,111];
bolts_y=[0,104,131];

// move mounting pattern back on y axis
// multiple points can be defined
bolts_overhang=[8*in];

// gap between joints
pintail_gap=bit/4;

// used to cleanup previews, should not impact actual part
pad=0.1;

// size of circles in the mesh pattern
pattern_hole=1.5*in;

// how far apart the circles are
pattern_gap=2.75*in;

// defines max size of cutsheet so anchors can be placed
cutsheet_x=box_x+box_z+skirt+cutgap*3;
cutsheet_y=box_y+box_z*2+skirt+cutgap*4;

// how many pins between side and base
side_base_pins=2;

explode=0;
