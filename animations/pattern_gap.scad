include <../src/variables.scad>;

pattern_gap=2.5*in+(sin($t*360)/2+0.5)*4*in;

// RENDER gif
module demo() {
    assembled();
}
assembled();
