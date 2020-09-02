include <../src/variables.scad>;

pintail_gap=(sin($t*360)/2+0.5)*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
