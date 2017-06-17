// Anet A6 X-End - Blower & 3D-Touch/BL-Touch Mount & X-Endstop (optical)
//
// GNU GPL v3
// R.E. 2017.06

use <polyhole_re.scad>

module main(){
  union(){
    translate([-19,49.5,0])
      cylinder(5.3,r=13/2,$fn=100);
    translate([24,11.5,0])
      cylinder(5.3,r=13/2,$fn=100);
    translate([-23.75,5,0])
      cube([11.25,44.5,5.3]);  
    translate([-23.75,5,0])
      cube([47.75,13,5.3]);   
    translate([-10.85,-5.1,0])
      cube([14.7,11,5.3]); 
    translate([-9,10,0])
      rotate([0,0,45])
        cube([8,15,5.3]);
  }
}

module main_screw_holes(){
  translate([-19,49.5,-1]){
    polyhole(10,r=1.5);
    cylinder(2.5+1, r=5.65/2/cos(30), center=false, $fn=6);
    translate([0,0,2.5+1-0.01])
      cylinder(.6, r1=5.65/2/cos(30),r2=1.5, center=false, $fn=6);
  }
  translate([24,11.5,-1]){
    polyhole(10,r=1.5);
    cylinder(2.5+1, r=5.65/2/cos(30), center=false, $fn=6);
    translate([0,0,2.5+1-0.01])
      cylinder(.6, r1=5.65/2/cos(30),r2=1.5, center=false, $fn=6);
  }  
  translate([-7,0,-1-1]){
    polyhole(10,r=1.5);
    translate([0,0,5.3-1.5+1.3])
      cylinder(1.5,r1=1.5,r2=3,$fn=100);
    translate([0,0,5.3+1.3-.01])
      cylinder(2,r=3,$fn=100);
  }    
  translate([-.35,0,-1])
    polyhole(10,r=1.5);
  translate([.35,0,-1])
    polyhole(10,r=1.5);    
  
  translate([-11.85,4.5,-1])
    cylinder(10,r=1.5,$fn=30);
  translate([4.85,4.5,-1])
    cylinder(10,r=1.5,$fn=30);
}

module 3D_touch_mount(){
  difference(){
    union(){
      hull(){
        translate([7.23,0,0])
          cylinder(8,r=5.77,$fn=100);
        translate([-7.23,0,0])
          cylinder(8,r=5.77,$fn=100);     
      }
      // connection to main
      translate([0,-5.77,0])
        cube([7.23+5.77,5.77,8]);
      translate([12.65-5.3,-5.77-4,0])
        cube([5.3,5,8]);
    }
    translate([-9,0,-1])
      polyhole(10,r=1.55);
    translate([9,0,-1])
      polyhole(10,r=1.55  );    
    translate([0,0,-1])
      cylinder(10,r=2.5,$fn=50);
    translate([12.65,-15,-1])
      cube([5,20,10]);
  }
}

module x_endstop(high=6){
  difference(){
    translate([-3.75,-10.2/2,0])
      cube([7.6,10.2,16]);     
    translate([0,0,-1])
      hull(){
        cylinder(13+1,r=3,$fn=50);
        translate([5,0,0])
          cylinder(13+1,r=3,$fn=50);
      }
   // translate([7.6-3.75,-11/2,0])
      translate([7.6-3.75-.5,-11/2,0])
        rotate([0,-14,0])
          translate([0,0,-5])
            cube([7.6,11,25]);
  }
   // light-breaker:
  translate([-2.4/2-2.65,-5.2/2-0.8,16-0.5])      
        cube([2.4,5.2,high+0.5]);
}

module cabel_mount(length=20,width=7){
  translate([-19,49.5-8,0])
    rotate([0,0,45])
      translate([0,0,0]){
      translate([0,-width/2,0])
        cube([length,width,5.3/2]);
      translate([length-3,-(width+3)/2,0])
        cube([3,width+3,5.3/2]);
      translate([0,-(width+3)/2,0])
        cube([14,width+3,5.3/2]);
  }
}

module cabel_mount_bltouch(){
      translate([-19,49.5,0])
        rotate([0,0,-45])
          translate([-3.5-3-1.5,-3,0]){
            cube([3,5,5.3+6.5+3]);
            cube([3.5+3+1.5,5,5.3]);
            translate([3,0,5.3+6.5+1.5])
              rotate([-90,0,0])
                cylinder(5,r=1.5,$fn=30);
           
          }
  }


union(){
  difference(){
    union(){
      main();
      cabel_mount(24); 
      cabel_mount_bltouch();
    }
    main_screw_holes();
    
    //cable mount (hole for filament):
    translate([-19,49.5-8,5.3/2])
      rotate([0,90,45])
        translate([0,0,-3])
          polyhole(40,r=1.85/2);
  }
  translate([-30.95,17.050,12.65]) 
    rotate([-90,90,0]) 
      3D_touch_mount();
  translate([0,0,5.3])
    x_endstop(5);
}

  