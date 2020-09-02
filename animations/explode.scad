include <../src/variables.scad>;

explode=0+(sin($t*360)/2+0.5)*6*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
