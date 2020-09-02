include <../src/variables.scad>;

pattern_hole=(sin($t*360)/2+0.5)*2.5*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
