include <../src/variables.scad>;

cargo_y=3*in+(sin($t*360)/2+0.5)*20*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
