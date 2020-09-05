use <joints.scad>;

module dirror_x(x=0) {
    children();
    translate([x,0,0])
    mirror([1,0,0])
    children();
}

module dirror_y(y=0) {
    children();
    translate([0,y,0])
    mirror([0,1,0])
    children();
}

// simple 3d model for preview
module onewheel() {
    #translate([0,0,onewheel_z/2+wood]) {
        cylinder(d=onewheel_d,h=onewheel_h,center=true);
        cube([onewheel_x,onewheel_y,onewheel_z],center=true);
    }
}

// extrude 2d drawings for preview
module wood(padding=0) {
    translate([0,0,-padding])
    linear_extrude(height=wood+padding*2)
    children();
}

module assembled() {
    if(onewheel)
    translate([0,onewheel_offset,wall])
    onewheel();

    color("lime")
    wood()
    base();

    color("blue")
    dirror_x()
    translate([-box_x/2-explode,0,box_z/2])
    rotate([90,0,90])
    wood()
    side();

    color("magenta")
    translate([0,box_y/2+explode,box_z/2])
    rotate([90,0,0])
    wood()
    back();

    color("red")
    translate([0,wood-box_y/2-explode,box_z/2])
    rotate([90,0,0])
    wood()
    front();

}

module cutsheet_corner() {
    square([cutgap,bit*1.1]);
    square([bit*1.1,cutgap]);
}

module cutsheet_drill() {
    translate([0,0,2])
    color("red")
    cutsheet(display="drill");
}

module cutsheet_inside() {
    translate([0,0,1])
    color("blue")
    cutsheet(display="inside");
}

module cutsheet_outside() {
    color("lime")
    cutsheet(display="outside");
}

module cutsheet(display="") {
    translate([cutgap,cutgap]) {
        base_cutsheet(display)
        back_cutsheet(display)
        front_cutsheet(display);
        translate([box_x+cutgap,0])
        side_cutsheet(display)
        side_cutsheet(display);
    }
    color("white")
    dirror_x(cutsheet_x)
    dirror_y(cutsheet_y)
    cutsheet_corner();
}

module base_cutsheet(display="") {
    translate([box_x/2,box_y/2])
    base(display);
    translate([0,box_y+cutgap,0])
    children();
}

module side_cutsheet(display="") {
    translate([box_z/2,box_y/2])
    rotate([0,0,90])
    side(display);
    translate([0,box_y+cutgap,0])
    children();
}

module front_cutsheet(display="") {
    translate([box_x/2,box_z/2])
    front(display);
    translate([0,box_z+cutgap,0])
    children();
}

module back_cutsheet(display="") {
    translate([box_x/2,box_z/2+skirt])
    back(display);
    translate([0,box_z+cutgap+skirt,0])
    children();
}

module base_drill() {
    intersection () {
        for(y=bolts_overhang)
        translate([0,y-box_y/2])
        bolt_plate();
        square([box_x-wood*4,box_y-wood*4],center=true);
    }
}

module base_outside() {
    difference() {
        square([box_x,box_y],center=true);

        dirror_y()
        translate([box_x/2,-box_y/2-pad,0])
        rotate([0,0,90])
        negative_pins(box_x,wood+pad,2,pintail_gap,joint_holes,ear,ear_extra);

        dirror_x()
        translate([-box_x/2-pad,-box_y/2,0])
        negative_pins(box_y,wood+pad,2,pintail_gap,joint_holes,ear,ear_extra);
    }
}

module base(display="") {
    if(!display)
    color("lime")
    difference() {
        base_outside();
        base_drill();
    }

    if(display=="drill")
    base_drill();

    if(display=="outside")
    base_outside();
}

module side_outside() {
    difference() {
        square([box_y,box_z+skirt],center=true);

        translate([-box_y/2-pad,-box_z/2+skirt/2])
        negative_pins(box_z,wood+pad,2,pintail_gap,joint_holes,ear,ear_extra);

        translate([box_y/2-wood,-box_z/2-skirt/2])
        translate([wood,0])
        mirror([1,0,0])
        negative_pins(box_z+skirt,wood+pad,2,pintail_gap,joint_holes,ear,ear_extra);

        translate([-box_y/2,-box_z/2+skirt/2+1])
        mirror([0,1])
        negative_slot(pintail_gap+1,wood,ear,ear_extra);


        if(onewheel)
        translate([onewheel_offset-onewheel_y/2,skirt/2-box_z/2+wood+wall])
        square([onewheel_y,onewheel_z]);
    }
}

module side(display="") {
    translate([0,-skirt/2]) {
        if(!display)
        color("blue")
        difference() {
            side_outside();
            side_inside();
        }
        if(display=="inside")
        side_inside();
        if(display=="outside")
        side_outside();
    }
}

module side_inside() {
    translate([box_y/2,-box_z/2+skirt/2,0])
    rotate([0,0,90])
    dirror_x(wood)
    negative_tails(box_y,wood,side_base_pins,pintail_gap,joint_holes,ear,ear_extra);

    translate([0,skirt/2+wood/2])
    intersection() {
        difference() {
            square([box_y-wood*2-wall*2,box_z-wall*2-wood],center=true);
            if(onewheel)
            translate([onewheel_offset,0])
            square([onewheel_y+wall*2,box_z],center=true);
        }
        pattern();
    }
}

module end_pattern() {
    translate([0,wood/2]) 
    intersection() {
        square([box_x-wall*2-wood*2, box_z-wood-wall*2],center=true);
        pattern();
    }
}

module front_outside() {
    difference() {
        square([box_x,box_z],center=true);
        end_holes();

        dirror_x()
        translate([-box_x/2-pad,-box_z/2])
        negative_tails(box_z,wood+pad,2,pintail_gap,joint_holes,ear,ear_extra);
    }
}

module front(display="") {
    if(!display)
    color("red")
    difference() {
        front_outside();
        end_pattern();
    }
    if(display=="inside")
    end_pattern();
    if(display=="outside")
    front_outside();
}


module end_holes() {
    translate([box_x/2,-box_z/2])
    rotate([0,0,90])
    negative_tails(box_x,wood,2,pintail_gap,joint_holes,ear,ear_extra);
}

module back_outside() {
    difference() {
        translate([0,-skirt/2])
        square([box_x,box_z+skirt],center=true);

        dirror_x()
        translate([-box_x/2-pad,-box_z/2-skirt]) 
        negative_tails(box_z+skirt,wood+pad,2,pintail_gap,joint_holes,ear,ear_extra);
    }
}

module back_capture() {
    // fix dog bones because back is captured but front isn't
    
    // i'll pay for this later
    translate([box_x/2,-box_z/2])
    rotate([0,0,90]) 
    translate([wood,0])
    mirror([1,0])
    negative_tails(box_x,wood,2,pintail_gap,joint_holes,ear,ear_extra);
}

module back(display="") {
    if(!display)
    color("magenta")
    difference() {
        back_outside();
        end_holes();
        back_capture();
        end_pattern();
    }
    if(display=="inside") {
        end_holes();
        back_capture();
        end_pattern();
    }

    if(display=="outside")
    back_outside();
}

module pattern() {
    pattern_max=box_x+box_y;
    translate([-pattern_gap/2,0])
    dirror_y()
    dirror_x() {
        for(x=[0:pattern_gap:pattern_max])
        for(y=[0:pattern_gap:pattern_max])
        translate([x,y])
        circle(d=pattern_hole);

        for(x=[pattern_gap/2:pattern_gap:pattern_max])
        for(y=[pattern_gap/2:pattern_gap:pattern_max])
        translate([x,y])
        circle(d=pattern_hole);
    }
}

module bolt_plate() {
    for(i=[0:1:len(bolts_x)-1])
    dirror_x()
    translate([bolts_x[i]/2,bolts_y[i]])
    circle(d=bolt);
}
