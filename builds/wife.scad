include <../src/variables.scad>;

cargo_x=235;
cargo_y=400;
cargo_z=200;

cutgap=bit*3;

// Rad Runner
bolts_x=[160,110,160,110];
bolts_y=[0,57,225,282];

// lots of options
bolts_overhang=[65, 30,-5,-40,-75];

// PREVIEW
// RENDER scad
module preview() {
    assembled();
}

// PREVIEW
// RENDER scad
module cutsheet_preview() {
    cutsheet();
}

// RENDER svg
module outside() {
    cutsheet(display="outside");
}

// RENDER svg
module inside() {
    cutsheet(display="inside");
}

// RENDER svg
module drill() {
    cutsheet(display="drill");
}
