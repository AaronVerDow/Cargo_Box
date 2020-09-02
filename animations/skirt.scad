include <../src/variables.scad>;

skirt=(sin($t*360)/2+0.5)*4*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
