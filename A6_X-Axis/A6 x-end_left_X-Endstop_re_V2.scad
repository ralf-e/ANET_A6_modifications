// Anet A6 X-End - X-Endstop
// for GT2 20T and 16T 
// 
// GNU GPL v3
// R.E. 2017.06

use <pushfit_hole_re.scad>
use <polyhole_re.scad>

difference(){
  union(){
    translate([-1,0,+7.5])
      cube([10,10,15],center=true);
    translate([-2.5,0,+25/2])
      cube([3.2,6,25],center=true);  
  }
  translate([.9,0,0])
    polyhole(20,r=1.5,center=true);
  translate([-.9,0,0])
    polyhole(20,r=1.5,center=true);
  translate([10,0,10+5])
    cube([20,30,20],center=true);  
  translate([0,0,5])
    cylinder(8,r=3,$fn=30,center=false);
  translate([-7,0,-1])
    cylinder(6,r=3,$fn=30,center=false);
  
}