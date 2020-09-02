include <../src/variables.scad>;

skirt=0.75*in;
wall=(sin($t*360)/2+0.5)*3*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
