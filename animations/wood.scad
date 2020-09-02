include <../src/variables.scad>;

wood=in/8+(sin($t*360)/2+0.5)*2*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
