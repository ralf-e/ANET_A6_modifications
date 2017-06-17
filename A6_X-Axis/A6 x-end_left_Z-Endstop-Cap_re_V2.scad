// Anet A6 X-End - Z-Endstop Cap
//
// GNU GPL v3
// R.E. 2017.06

use <pushfit_hole_re.scad>
use <polyhole_re.scad>

difference(){
  union(){
    cylinder(6,r=4,$fn=100,center=false);
    translate([0,0,6])
      cylinder(1.5,r1=4,r2=2.5,$fn=100,center=false);
  }
  translate([0,0,1.5])
    polyhole(10,r=1.4);
}
  