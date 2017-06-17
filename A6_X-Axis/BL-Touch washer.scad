// Anet A6 X-End - Blower & 3D-Touch/BL-Touch Mount & X-Endstop (optical) - BL-Touch washer
//
// GNU GPL v3
// R.E. 2017.06


use <polyhole_re.scad>

high=.2;

module 3D_touch_washer(high){
  difference(){
    union(){
      translate([7.23,0,0])
        cylinder(high,r=5.77,$fn=100);
      translate([-7.23,0,0])
        cylinder(high,r=5.77,$fn=100);
      translate([-7.23,-5.77,0])
        cube([7.23*2,5.77*2,high]);      
    }
    translate([-9,0,-1])
      polyhole(high+2,r=1.6);
    translate([9,0,-1])
      polyhole(high+2,r=1.6);
    translate([0,0,-1])
      cylinder(high+2,r=2.5,$fn=50);
  }
}


3D_touch_washer(high);

  