// Anet A6 X-End RIGHT
//
// GNU GPL v3
// R.E. 2017.06

use <oshw-logo.scad>
use <pushfit_hole_re.scad>
use <polyhole_re.scad>
use <A6_x-end_re_V2.scad>

/*
module belt_hole(){  
  translate([-8.5/2,-16.5/2,0]){
    cube([8.5,16.5,80], center=false);
    translate([0,0,-1])
      belt_hole_bevel();
    translate([08.5,0,64.5])
      rotate([0,180,0])
        translate([0,0,0])
          belt_hole_bevel();
  }    
}
*/

module belt_hole_bevel(){
  polyhedron(
    points = [       
      [-5.25,-10,0 ],  
      [ 5.25,-10,0 ], 
      [ 5.25, 10,0 ], 
      [-5.25, 10,0 ],
      [-8.25,-13,3 ],  
      [ 8.25,-13,3 ], 
      [ 8.25, 13,3 ],
      [-8.25, 13,3 ]],
     
    faces = [
      [0,1,2,3],  
      [4,5,1,0],  
      [7,6,5,4], 
      [5,6,2,1],  
      [6,7,3,2],  
      [7,4,0,3]] 
  );
}

module belt_hole_bevel2(){
  polyhedron(
    points = [       
      [-10.2,-6.2,0 ],  
      [ 10.2,-6.2,0 ], 
      [ 10.2, 6.2,0 ], 
      [-10.2, 6.2,0 ],
      [-13.2,-9.2,3 ],  
      [ 13.2,-9.2,3 ], 
      [ 13.2, 9.2,3 ],
      [-13.2, 9.2,3 ]],
     
    faces = [
      [0,1,2,3],  
      [4,5,1,0],  
      [7,6,5,4], 
      [5,6,2,1],  
      [6,7,3,2],  
      [7,4,0,3]] 
  );
}

module belt_hole(){
  union(){
    translate([0,0,40]){
      cube([10.5,20,80],center=true); 
      translate([0,0.635,0])
        cube([20.4,12.4,80],center=true);
       
      difference(){
        translate([0,0.635,0])
          cube([11.5,13.4,80],center=true);
        translate([11.5/2,13.4/2+.635,0])
          cylinder(81,r=.5,center=true,$fn=50);
        translate([-11.5/2,13.4/2+.635,0])
          cylinder(81,r=.5,center=true,$fn=50);
        translate([11.5/2,-13.4/2+.635,0])
          cylinder(81,r=.5,center=true,$fn=50);
        translate([-11.5/2,-13.4/2+.635,0])
          cylinder(81,r=.5,center=true,$fn=50);
      }
    }
    translate([0,0.635,0])
      cylinder(20,d=3.5,center=true,$fn=50);
    translate([0,-0.635,0])
      cylinder(20,d=3.5,center=true,$fn=50);
    translate([0,0.635,0])
      cylinder(2.6*2,d=7,center=true,$fn=50);
    translate([0,-0.635,0])
      cylinder(2.6*2,d=7,center=true,$fn=50);
  }
}
    

module belthole_reinforcement(){
  translate([-56.75,-10,0]){
    cylinder(64,r=6.5, $fn=50, center=false);
    translate([-12,0,0])
      cylinder(64,r=6.5, $fn=50, center=false);
    translate([-12,-6.5,0])
      cube([12,13,64], center=false);
  }
}

module belthole_reinforcement_top(){
  translate([-52.25,10,0]){
    cylinder(64,r=2, $fn=50, center=false);
    translate([-21,0,0])
      cylinder(64,r=2, $fn=50, center=false);
    translate([-21,-2,0])
      cube([21,4,64], center=false);
  }
}

difference(){
  union(){
    mirror()
      A6_X_end_left();
    belthole_reinforcement();
    belthole_reinforcement_top();
   }    
  //bearing
  translate([-41.5,16,27.5])
    rotate([90,0,0])
      // Schraubenlänge-Materialstärke(Lager)-Mutter-Ueberstand:
      // 30-1.9-2.4-2.1 = 23.6, xEnd-Dicke= 26, Mutter bündig, Schraube 2.1 länger
      // 25-1.9-2.4 = 20.7, xEnd-Dicke= 26, Mutter 2.9 tiefer, Schraube bündig
      //bearing_LMEK8(30-1.9-2.4-2,5+22+4.0);
      bearing_LMEK8(25-1.9-2.4-.2,32);
   
  //lead_screw_nut
  translate([-41.5,10,27.5+23])
    rotate([90,0,0])
      // Schraubenlänge-Materialstärke(Lager)-Mutter-Ueberstand:
      // 25-3.5-2.4-1.5 = 17.6, xEnd-Dicke=20, Mutter bündig, Schraube 1.5 länger
      // 22-3.5-2.4 = 16.1, xEnd-Dicke=20, Mutter 1.5 tiefer, Schraube bündig
      //lead_screw_nut(9.5,25-3.5-2.4-0.5,21.6);
      lead_screw_nut(9.5,22-3.5-2.4-.2,26);
   
  //belt hole  
  translate([-62.75,-2.236,6])
    belt_hole();
  translate([-62.75,-2.236,61.5])
    belt_hole_bevel();
  translate([-62.75,-2.236+0.635,63])
    belt_hole_bevel2();

  //material savings
  mirror()
    material_saving(5);  
  
    
  //oshw-Logo
  translate([-10,10+2-1.5,32])
    rotate([90,-90,0])
      linear_extrude(height=2)
        oshw_logo_2d(15);
  translate([-40,4,64-1.5])
    linear_extrude(height=2)
          oshw_logo_2d(10);
  translate([-40,0,-0.5])
    linear_extrude(height=2)
          oshw_logo_2d(14);
  //Anet A6 Text
  translate([-40-5,-5,63])
    linear_extrude(height=2)
      text("Anet A6", size=6, font=":style=Bold", halign="left", valign="center"); 
}



