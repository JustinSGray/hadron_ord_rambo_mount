base_width = 75.35;
base_length = 104.52;


x_post_offset = (base_width-67.35)/2;
y_post_offset = (base_length-96.52)/2;

x_hole_offset = (base_width-43.587)/2;
y_hole_offset = (base_length-90.55)/2;

post_height = 77.73;

hole_d = 2.5; 
hole_h = 10;

res = .5;
$fa = res;
$fs = res;

cutout_factor = 1.4;
offset_factor = (1-1/cutout_factor);
x_cutout_offset = base_width*(1-1/cutout_factor)/2;
y_cutout_offset = base_length*(1-1/cutout_factor)/2;
cutout_corner_rad = 5;

difference() {
  union() {
      difference(){
        translate([0,0,-4]) cube([base_width, base_length, 4]);
	    union(){
    	      translate([x_hole_offset,y_hole_offset, -hole_h/2]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	      translate([x_hole_offset+43.587,y_hole_offset, -hole_h/2]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	      translate([x_hole_offset+43.587,y_hole_offset+90.55, -hole_h/2]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	      translate([x_hole_offset,y_hole_offset+90.55, -hole_h/2]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
          translate([x_cutout_offset,y_cutout_offset,-5]) {
            minkowski() {
			  translate([cutout_corner_rad,cutout_corner_rad,0])cube([(base_width/cutout_factor)-2*cutout_corner_rad, (base_length/cutout_factor)-2*cutout_corner_rad, 10]);
			  cylinder(r=cutout_corner_rad,h=10, $fa = res, $fs = res);
            }
          }  

	    }	
      }
      

      translate([x_post_offset,y_post_offset, 0]) cylinder(h=post_height,r=4, $fa = res, $fs = res);
      translate([x_post_offset+67.35,y_post_offset, 0]) cylinder(h=post_height,r=4, $fa = res, $fs = res);
      translate([x_post_offset+67.35,y_post_offset+96.52, 0]) cylinder(h=post_height,r=4, $fa = res, $fs = res);
      translate([x_post_offset,y_post_offset+96.52, 0]) cylinder(h=post_height,r=4, $fa = res, $fs = res);
  }
  union(){
	  translate([0,0,post_height]) rotate(45, [0,post_height,0]) cube(200);
	  translate([2,0,post_height]) rotate([0,45,0]){
	    union() {
	      translate([x_post_offset,y_post_offset, -hole_h]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	      translate([x_post_offset+95.25,y_post_offset, -hole_h]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	      translate([x_post_offset+95.25,y_post_offset+96.52, -hole_h]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	      translate([x_post_offset,y_post_offset+96.52, -hole_h]) cylinder(h=hole_h,r=hole_d/2, $fa = res, $fs = res);
	    }
	  } 
  }
}

		 








