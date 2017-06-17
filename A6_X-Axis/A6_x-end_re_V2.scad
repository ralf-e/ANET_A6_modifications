// Anet A6 X-End
//
// GNU GPL v3
// R.E. 2017.06

use <pushfit_hole_re.scad>
use <polyhole_re.scad>


module main(){
  union(){
    //main
    translate([0,0,0])
      cylinder(64, r=10, center=false, $fn=100);
    translate([80,0,0])
      cylinder(64, r=10, center=false, $fn=100);
    translate([0,-10,0])
      cube([80,20,64],center=false);
    //bearing top level
    translate([41.5,10,27.5])
      rotate([-90,0,0])
        cylinder(6, r1=23, r2=17, center=false, $fn=100);
    //bearing bottom level
    translate([41.5,-10,27.5])
      rotate([90,0,0])
        cylinder(5.0, r1=15, r2=10, center=false, $fn=100);
  }
}

module rod_hole(){
  union(){
    translate([0,0,8.5])
      polyhole(64-8.5+1, 4, center = false);
    translate([0,0,-1])
      cylinder(10.5, r=1.6, center=false, $fn=30);  
    translate([0,0,8.5])
      cylinder(4, r=5.5, center=false, $fn=30);
    translate([0,0,12.5])
      cylinder(2.5, 5.5, 4, center=false, $fn=30);
  }
}

module rod_screw(){
//rod screw nuts
  translate([0,-10+3.3,1.6+4])
    rotate([90,0,0])
      cube([5.8,3.2,20],center=true);
  translate([0,0,1.6+4])
    rotate([90,0,0])
      cylinder(30,r=.9, $fn=30, center=true);
}

// Bearing LMEK8LUU
module bearing_LMEK8(thickness,bevel){
  union(){
    translate([0,0,-2.5])
      intersection() {
        cube([26,26,5], center=true);
        cylinder(5,r=16, center=true, $fn=30);
      }    
    translate([0,0,-5])
      //polyhole(45, 16/2, center = false);
      pushfit_hole(45,16+.1,60,0.3);
    for (i=[0:3])
      rotate([0,0,45+i*90]){
        translate([0,12,-5])
          //cylinder(22+5+4.5+1+1, r=1.6, center=false, $fn=30);
          polyhole(45, 1.6, center = false);
        translate([0,12,thickness])
          cylinder(40-thickness, r=5.8/2/cos(30), center=false, $fn=6);
        translate([0,12,bevel])
          cylinder(4, r1=5.8/2/cos(30), r2=5.8/2/cos(30)+4, , center=false, $fn=6);
      }
    }
  }

module lead_screw_nut(hole,thickness,bevel){
  union(){
    translate([0,0,-10]){
      polyhole(22, 10.2/2, center = false);
      pushfit_hole(22,10.2,60,0.3);
      cylinder(10, r=22/2+1, center=false, $fn=30);
      cylinder(50, r=hole/2, center=false, $fn=30);
    }
    for (i=[0:3])
      rotate([0,0,45+i*90]){
        translate([0,8,-10])
          //cylinder(45, r=1.6, center=false, $fn=30);
          polyhole(50, 1.6, center = false);
        translate([0,8,thickness])
          // Hex Nut 5.5mm
          cylinder(40-thickness, r=5.8/2/cos(30), center=false, $fn=6);
        translate([0,8,bevel])
          cylinder(4, r1=5.8/2/cos(30),r2=5.8/2/cos(30)+4,  center=false, $fn=6);
      }
    }
  }
  
  module material_saving(depth=6){      
  difference(){
   translate([0,0-10-0.5,12])
      cube([29,depth+0.5,46]);   
    translate([0,0,0])
      cylinder(64, r=10, center=false, $fn=100);
    rotate([0,0,-45])
      cube([10,20,64]);
    translate([29,-10,12])
      rotate([0,0,45])
        cube([10,20,64]);  
     translate([0,-10,12])
      rotate([45,0,0])
        translate([0,0,-10])
          cube([40,20,10]);
     translate([0,-10,12+46])
      rotate([-45,0,0])
        cube([40,20,10]);
    translate([41.5,0,27.5])
      rotate([90,0,0])
        cylinder(15.0, r1=25, r2=10, center=false, $fn=100);
  }
}

module A6_X_end_left()
  difference(){
  main();
  // rod holes
  rod_hole();
  rod_screw();
  translate([80,0,0]) {
    rod_hole();
    rod_screw();
  }
}


  
 
//test:
  translate([-40,0,0])
    bearing_LMEK8(20,25);
  translate([-70,0,0])
   lead_screw_nut(9,30,32);
  translate([-180,0,0])
   main();  
  
//test:
difference(){
  A6_X_end_left();
  
  //bearing
  translate([41.5,10+6,27.5])
    rotate([90,0,0])
      // Schraubenlänge-Materialstärke(Lager)-Mutter-Ueberstand:
      // 30-1.9-2.4-2.1 = 23.6, xEnd-Dicke= 26, Mutter bündig, Schraube 2.1 länger
      // 25-1.9-2.4 = 20.7, xEnd-Dicke= 26, Mutter 2.9 tiefer, Schraube bündig, !!vorsicht, Mutter auf Höhe Riemenspanner
      bearing_LMEK8(30-1.9-2.4-1.6,5+22+4.0);
      //bearing_LMEK8(25-1.9-2.4,5+22+4.0);
        
  //lead_screw_nut
  translate([41.5,10,27.5+23])
    rotate([90,0,0])
      // Schraubenlänge-Materialstärke(Lager)-Mutter-Ueberstand:
      // 25-3.5-2.4-1.5 = 17.6,  xEnd-Dicke=20, Mutter bündig, Schraube 1.5 länger
      // 22-3.5-2.4 = 16.1, xEnd-Dicke=20, Mutter 1.5 tiefer, Schraube bündig
      //lead_screw_nut(9.5,25-3.5-2.4-0.5,21.6);
      lead_screw_nut(9.5,22-3.5-2.4,21.6);
  
  material_saving();
}




