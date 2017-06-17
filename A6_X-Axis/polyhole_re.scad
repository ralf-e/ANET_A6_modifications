// polyholes - correct diameter for printing holes
//
// See http://hydraraptor.blogspot.com/2011/02/polyholes.html
//
// inspired by Josef Prusa (Prusa i3)
//
// GNU GPL v3
// R.E. 2017.06



function polyhole_n(r) = max(round(4 * r),3);
function polyhole_radius(r) = r / cos (180 / polyhole_n(r));

module polyhole(h, r, center = false) {
    rotate([0,0,0])
        cylinder(h = h, r = polyhole_radius(r), center = center, $fn = polyhole_n(r));
}


//test
high=20;
radius=4;
cylinder(high,r=radius,center=false);
translate([-3*radius,0,0])
  polyhole(high,radius,center=false);
echo("<b>Radius=</b>",radius);
echo("<b>polyhole_rad_n=</b>",polyhole_n(radius));
echo("<b>polyhole_radius=</b>",polyhole_radius(radius));


