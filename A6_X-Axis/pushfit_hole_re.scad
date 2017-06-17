// pushfit_hole - holes for rods
// corrected diameter 
// extension on top for printing without briding problems
//
// inspired by Josef Prusa (Prusa i3)
//
// GNU GPL v3
// R.E.

use <polyhole_re.scad>

module pushfit_hole(length,diameter,overhang_angle=60,bridge_distance=0.4){
    // for better printing 45° < overhang_angle < 90° 
  
  radius = diameter / 2;
     
  polyhole(length,radius,center=false);
  if (overhang_angle >= 45 && overhang_angle < 90)
    difference(){
      translate([0,polyhole_radius(radius) * (sin(overhang_angle) - 1 / sqrt(2) + cos(overhang_angle)),length/2]) rotate([0,0,45]) cube(size = [polyhole_radius(radius),polyhole_radius(radius),length], center = true);
    translate([0,5/4*radius+bridge_distance,length/2]) cube([radius ,radius/2,length+1], center = true);
 }
}


//test
rotate(a=[90,0,0])
  pushfit_hole(50,8,60,0.3);


