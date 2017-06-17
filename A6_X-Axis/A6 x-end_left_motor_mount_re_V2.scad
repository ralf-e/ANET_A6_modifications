// Anet A6 X-End MOTOR MOUNT
//
// GNU GPL v3
// R.E. 2017.06

use <polyhole_re.scad>

module motor_mount(){
  difference(){
    union(){
      cube ([42.15+5,42.15+7,5]);
      cube ([42.15+5,7,43]);
      cube ([5,42.15+7,43]);
    }

translate([-1,42.15+7,5])
  rotate([atan((42.15)/(43-5)),0,0])
    cube ([7,30,60]);
    
translate([26.15,28.15,-2]){  
  polyhole(10,11.1);
  translate([31/2,31/2,0])
      polyhole(10,1.5);
  translate([31/2,-31/2,0])
      polyhole(10,1.5);
  translate([-31/2,31/2,0])
      polyhole(10,1.5);
  translate([-31/2,-31/2,0])
      polyhole(10,1.5);
}

translate([26.15,28.15,-7])  
  cylinder(10,r1=21,r2=11,$fn=30);

translate([19,21,-2])
  cube([50,50,10]);
translate([19-2-5,42.15+7+2,-2])
  rotate([0,0,-45])
    cube([60,30,10]);
}
}


module motor_mount_adjustment(high=28.386,extra_space=0){
  //adjustment
  translate([high,0,0]) {
    //adjustment centering
    translate([0,0,23.5])  
      rotate([90,0,0])
        cylinder(3,r1=5-extra_space/2,r2=5-3-extra_space/2,$fn=50);
  
    //adjustment top
    translate([10+extra_space/2,0,0])
      difference(){
        translate([0,-3.5,0])
          cube([5,3.5,43]);
/*        translate([5,0,0])
          rotate([0,0,45]) 
            translate([-5,-3.5,-1])
              cube([15,3.5,45]); */
    }
    //adjustment bottom
    translate([-5-10-extra_space/2,0,0])
      difference(){
        translate([0,-3.5,0])
          cube([5,3.5,43]);
          rotate([0,0,-45]) 
            translate([0,-3.5,-1])
              cube([5,3.5,45]);
    }
  }
}

module motor_mount_screws(high=28.386){
  translate([high,5+7-3.2,10])  
    rotate([90,0,0]){
      polyhole(15,1.5);
      cylinder(5,r=3.1,$fn=30);
    }
  translate([high,5+7-3.2,10+27])  
    rotate([90,0,0]){
      polyhole(15,1.5);
      cylinder(5,r=3.1,$fn=30);
  }
  //for endStop cable
  translate([high+3,10,43+0.9])  
    rotate([90,0,0])
      cylinder(20,r=3,$fn=30);
  translate([high+3,6,43+0.9])  
    rotate([-90,0,0])
      cylinder(3,r1=3,r2=6,$fn=30);
      
  //top beavel
  translate([15+high,0,0])
    rotate([0,0,45]) 
      translate([-5,-3.5,-1])
        cube([15,3.5,45]);
}

module fancy (){
  //bottom beavel
  translate([-4,7.5,0])
    rotate([0,0,-45]) 
      translate([0,-3.5,-1])
        cube([15,3.5,45]);
  rotate([-30,0,0]) 
    translate([-5,-15,-3.5])
      cube([55,15,3.5]);
  translate([0,0,43])
    rotate([30,0,0]) 
      translate([-5,-15,0])
        cube([55,15,3.5]);
  
}


difference(){
  // for Pulley GT2 20T high=28.386
  // for Pulley GT2 16T Motor high=28.386 + 1.27
  high=28.386; text="20T";
  //high=28.386-1.27; text="16T"; 
  extra_space=.3;
  
  union(){
    motor_mount();
    motor_mount_adjustment(high,extra_space);
    //Anet A6 Text  
  }
  motor_mount_screws(high);
  fancy();
  
  //Text
  translate([2,28.15,0])
    rotate([0,0,-90])
      mirror([1,0,0])
        linear_extrude(height=1.5)
          text(text, size=8, font=":style=Bold", halign="center", valign="bottom");
  
}

