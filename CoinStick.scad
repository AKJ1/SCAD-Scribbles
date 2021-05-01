use <threads.scad>
use <arc.scad>
// Coin Parameters [diameter, thickness]
coin_dimensions = [
    [26.50 + 0.55, 2.2], // 2lv
    [24.50 + 0.55, 2.0], // 1lv
    [22.50 + 0.55, 1.65], // 0.5lv
    [20.50 + 0.55, 1.60], // 0.2lv
    [18.50 + 0.55, 1.55] // 0.1lv
];

mode = "test"; // Available options : tubeandcap, coin, tube, sorter, cap

// Common Parameters
coin_index = 4; // which coin to make a tube for
coin_count = 25; 
wall_thickness = 2; 
screw_length = 0; // Leave 0 for symmetric cap & body
smooth = 6;
lip_girth = 4;
lip_thickness=2;

// Cap Parameters
cap_screw_length = 0; // Leave 0 for symmetric cap & body
cap_thread_offset = 1;

// Lip is midpoint, entire thing should be symetrical todo: the math

// translate([20, 0, 0]) {
if(mode == "test"){

    color("green")
    difference(){
        coin_tube(coin_diamater = coin_dimensions[coin_index][0]
        , coin_thickness = coin_dimensions[coin_index][1]
        , wall_thickness=wall_thickness
        , screw_length = screw_length
        , lip_thickness = lip_thickness
        , lip_girth = lip_girth
        , smooth = smooth
        , coin_count = coin_count);
        translate([0,-50,0])
        {
            cube(size=100);
        }
    }

    color("red")
    difference(){
        translate([0, 0, ((coin_count*coin_dimensions[coin_index][1])+6+lip_thickness/2)]) 
        {
            rotate([180,0,0])
            tube_cap(coin_diameter = coin_dimensions[coin_index][0]
            , coin_thickness = coin_dimensions[coin_index][1]
            , coin_count = coin_count
            , screw_length = cap_screw_length
            , wall_thickness = wall_thickness
            , thread_offset = cap_thread_offset
            );
        }
        translate([0,-50,0])
        {
            cube(size=100);
        }
    }
}

if(mode == "tube" || mode == "tubeandcap"){
    coin_tube(coin_diamater = coin_dimensions[coin_index][0]
    , coin_thickness = coin_dimensions[coin_index][1]
    , wall_thickness=wall_thickness
    , screw_length = screw_length
    , lip_thickness = lip_thickness
    , lip_girth = lip_girth
    , smooth = smooth
    , coin_count = coin_count);
}

if(mode == "cap" || mode == "tubeandcap"){
    translate([50, 0, 0]) 
    {
        tube_cap(coin_diameter = coin_dimensions[coin_index][0]
        , coin_thickness = coin_dimensions[coin_index][1]
        , coin_count = coin_count
        , screw_length = cap_screw_length
        , wall_thickness = wall_thickness
        , thread_offset = cap_thread_offset
        );
    }
}

module coin_tube(coin_count=10, coin_diamater=25, coin_thickness=2.5,
 wall_thickness=2, res = 10, lip_thickness = 2, lip_girth=8, screw_length = 0, smooth = 6)
{
    holder_height = coin_thickness * coin_count - lip_thickness/2;
    sl = screw_length == 0 ? holder_height/2 : screw_length;
    hh = holder_height - sl;
    // if(){
    //     sl = holder_height/2;
    //     holder_height = holder_height - sl;
    // }

    holder_diameter = wall_thickness + coin_diamater;

    translate([0, 0, smooth/2]) 
    {
        $fn = 64;
        difference()
        {
            union()
            {
                difference()
                {
                    minkowski() 
                    {
                        sphere(d=smooth);
                        cylinder(d=holder_diameter, h=hh);
                    }
                    translate([0,0,hh])
                    {
                        cylinder(d=coin_diamater*2, h=hh*2);
                    }
                }
                translate([0, 0, hh + lip_thickness]) 
                {
                    metric_thread(length = sl, angle=45, pitch=3, diameter = holder_diameter+wall_thickness); // todo remove smooth
                }
                translate([0,0, hh])
                {
                    minkowski() 
                    {
                        sphere(d=1);
                        cylinder(d=coin_diamater+lip_girth, h=lip_thickness);
                    }
                    // rotate_extrude(convexity = 10)
                    // {
                    //     translate([holder_diameter/2 + lip_thickness/4 - wall_thickness/2, 0,0]){
                    //         rotate([0, 0, 45]) {
                    //             circle(d = lip_thickness, $fn=4);
                    //         }
                    //     }
                    // }
                }
            }
            translate([0, 0, wall_thickness-smooth/2]) {
                cylinder(d=coin_diamater, h=holder_height+sl+smooth);
            }
        }
    }
}

module tube_cap(coin_count = 10, coin_diameter=25, coin_thickness = 2.5, lip_thickness = 2, screw_length=0, smooth = 6, wall_thickness = 2, thread_offset = 1)
{
    if(coin_count > 0)
    {
        holder_height = coin_thickness * coin_count - lip_thickness/2;
        sl = screw_length == 0 ? holder_height/2 : screw_length;
        hh = holder_height - sl;
        cd = coin_diameter + wall_thickness;
        pitch = 3;
        translate([0,0,smooth/2]){
            difference(){
                $fn = 64;
                minkowski(){
                    sphere(d=smooth);
                    cylinder(d= cd, h=sl);
                };
                translate([0,0,-pitch]){
                    difference(){
                        metric_thread(length = sl*2, angle = 45, pitch = pitch, diameter = cd + pitch/2 + thread_offset, internal = true);
                        translate([0,0,wall_thickness+smooth/4-thread_offset+0.4-100]){
                            cylinder(h=100, d = cd*2);
                        }
                    }
                };
                translate([0,0,sl]){
                    cylinder(d= cd*2, h=sl);
                }
            }
        }
    }
}
