multimeter_width = 70;
multimeter_height = 24;
holder_height = 25;
border_width = 5;
angle = 15;

platform_length = 80;
platform_offset = [0, 20, -15];


difference(){
    union(){
        difference(){
        union(){
            //holder box
            translate([0, -2, -5])
            rotate([-angle, 0, 0])
            cube([multimeter_width+border_width, multimeter_height+border_width, holder_height], center=true);

            // platform
            translate(platform_offset)
            difference(){
            cube([multimeter_width+border_width, platform_length, border_width], center=true);
            cube([multimeter_width-border_width, platform_length-2*border_width, border_width], center=true);
            }
        };
        //multimeter hole
        rotate([-angle, 0, 0])
        translate([0, -1, 0])
        cube([multimeter_width, multimeter_height, holder_height+1], center=true);
        }
    }

// this structure removes the bottommost residue from the rotation
color("red")
translate([0,0,-4*border_width])
    cube([multimeter_width+border_width, platform_length, border_width], center=true);
// this is a cutout for the connectors
color("cyan")
translate([15, -20, -5])
rotate([-angle, 0, 0])
cube([23, border_width*2, 20]);
}
