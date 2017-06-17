// Anet A6 X-End - Z-Endstop
//
// GNU GPL v3
// R.E. 2017.06

use <pushfit_hole_re.scad>
use <polyhole_re.scad>

extraspace=0;
chamfer1=5;
chamfer2=3;

//printing orientation 
rotate([0,-90,0])
  translate([0,0,-10])

    difference(){
      translate([-10,0,0])
        cube([20,39.5,31],center=false);
      translate([-15,-5+extraspace,-10])
        cube([30,25,20+extraspace],center=false);
      translate([-15,+5,-10+.4])
        cube([30,16,20+extraspace],center=false);
      translate([0,20+extraspace,0])
        rotate([0,90,0])
          cylinder(30,r=10+extraspace,$fn=50,center=true);
      translate([-15,28,-10])
        cube([30,20,32],center=false);
      translate([0,0,2+10])
        rotate([-59,0,0])
          translate([-15,-20,0])
            cube([30,20,40],center=false);
      translate([13,37-chamfer1,0])
        rotate([0,0,45])
          translate([0,0,-5])
            cube([10,15,40],center=false);
      translate([-13,37-chamfer1,0])
        rotate([0,0,-45])
          translate([-10,0,-5])
            cube([10,15,40],center=false);
       translate([7-chamfer2,-3,0])
        rotate([0,0,-45])
          translate([0,0,-5])
            cube([10,15,40],center=false);
      translate([-7+chamfer2,-3,0])
        rotate([0,0,45])
          translate([-10,0,-5])
            cube([10,15,40],center=false);
      
      //screw holes
      translate([-5,12,0]){
        polyhole(100,1.5);
        translate([0,0,10+5])
          cylinder(20,r=3,$fn=50);
      }
      translate([5,12,0]){
        polyhole(100,1.5);
        translate([0,0,10+5])
          cylinder(20,r=3,$fn=50);
      }     
      translate([0,35.75,0])
        polyhole(100,1.5);
      translate([0,15+27.5,10+16.5])
            cube([5.6,20,2.4],center=true);  
    }