// Anet A6 X-End - Belt Tensioner
// for GT2 20T and 16T 
// 
// GNU GPL v3
// R.E. 2017.06

distance_1=9.9;
distance_2=9.0;
bevel=.6;


use <pushfit_hole_re.scad>
use <polyhole_re.scad>

module main(){
  difference(){
    union(){
      difference(){
        union(){
        cylinder(20,r=6.635,center=true,$fn=100);
        translate([8,0,0])
          cube([16,6.635*2,20],center=true);
        }
          cube([20,20,distance_1],center=true);
      }
      cylinder(10,r=2.7,center=true,$fn=50);
      }
      cube([20,20,distance_2],center=true);
      translate([0,-1-5.365,0])
        cube([40,2,25],center=true);
    }
  }
  
module screw_hole(){
  translate([0,0,0.3]){
    cylinder(3,r1=3,r2=0,$fn=50,center=false);
    translate([0,0,-4.9])
    cylinder(5, r=3, center=false, $fn=30);
  }
  polyhole(25,1.45,center=false);
  // Hex Nut 5.5mm
  translate([0,0,20-2.6])
  cylinder(10, r=5.8/2*1.155, center=false, $fn=6);
}

module screw_hole_2(){
  // hexagon head 5.5mm
  translate([0,0,-5])
    cylinder(5, r=5.8/2*1.155, center=false, $fn=6);  
  translate([0,0,-4.99])
    cylinder(5, r=3, center=false, $fn=30);
  polyhole(15,1.5,center=false);
}

module fancy(){
  x=16;
  y1=6.635;
  y2=5.365;
  z=20;
  translate([x,y1,0])
    rotate([0,0,45]) 
      cube([bevel*2,10,30],center=true);
  translate([x,-y2,0])
    rotate([0,0,-45]) 
      cube([bevel*2,10,30],center=true);
  translate([x,0,-z/2])
    rotate([0,45,0]) 
      cube([bevel*2,30,10],center=true);
  translate([x,0,z/2])
    rotate([0,-45,0]) 
      cube([bevel*2,30,10],center=true);
  }
  
module orientation_text(){
  translate([9,0,10-1])
      rotate([0,0,0])
        linear_extrude(height=2)
          text("^20", size=4, font=":style=Bold", halign="center", valign="center");  
  translate([9,0,-10+1])
      rotate([180,0,0])
        linear_extrude(height=2)
          text("^16", size=4, font=":style=Bold", halign="center", valign="center");  
}  


//full part
rotate([90,0,0]){
  //orientation for printing
  intersection(){  
    difference(){
      main();  
      translate([0,0,-10])
        screw_hole();
      translate([10+2.8,0,0])
        rotate([0,90,0])
          screw_hole_2();
      fancy();  
      //text for orientation GT2 12T / 16T
      orientation_text();
    }
     translate([0,1.27/2,0])
      rotate([0,90,0])
        cylinder(40,r=11,$fn=50,center=true);
   }
}