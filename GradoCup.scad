// CSG.scad - Basic example of CSG usage
use <bend.scad>
use <loft.scad>

cupOD = 63.60;
cupLip = 54.10;
cupID = 45.68;
cupWall = 3.00;

depthLip = 2; 
depthChamfer = 5;
depthCupFlair = 13;
depthCupTotal = 30;
depthGimbal = 8;

//  rotate_extrude(angle=360, convexity=2, $fn=100)
//  {
// 	difference()
// 	{
// 		polygon(points=[[0,0],[100,10],[100,-10]]);
// 		polygon(points=[[0,0],[20,10],[20,-10]]);
// 	}
//  }
ext = cupID - cupWall;
profile = polygon(points = [
 [ext, 0],
 [cupOD, 0]
]);


 
//  difference()
//  {
// 	 translate([1, 0, 0]) 
// 	 {
// 		 cube(5);
// 	 }
// 	cube(5);
//  }
// difference()
// {
// 	union()
// 	{
// 		translate([0,0, (depthCupTotal-depthLip)/2]) cylinder(d=cupID, h=depthCupTotal-depthLip, center=true);
// 		translate([0,0,depthCupTotal-depthLip]) cylinder(d=cupLip, h=depthLip, center=true);
// 		hull()
// 		{
// 			translate([0,0,0])
// 				cylinder(d=cupLip, h=0.1, center=true);

// 			translate([0,0, depthChamfer])
// 				cylinder(d = cupOD, h=0.1, center=true);

// 			translate([0,0, depthCupFlair])
// 				cylinder(d = cupOD, h=0.1, center=true);
// 		}
// 	}
// 	cylinder(d=cupID-cupWall, h=1000, center=true);
// }



// parabolic_bend([20, 150, 2], 0.001)
// {
// 	translate([10, 0, 0]) rotate(90, [0, 0, 1]) 
// 	{
// 		linear_extrude(height=2)
// 		{
// 			text("herro world", size=15, valign="bottom");
// 		}
// 	}
// }

// translate([0, -40, -50]) rotate(-90, [0,0,1])
//   parabolic_bend([20, 150, 2], 0.007)
//     translate([20, 0, 0]) rotate(90, [0,0,1])
//       linear_extrude(height=2)
//         text("parabolic_bend", size=15, valign="bottom");

// rotate(-90, [0,0,1]) rotate(90, [0,1,0])
//   cylindric_bend([20, 150, 2],150)
//     translate([20, 0, 0]) rotate(90, [0,0,1])
//       linear_extrude(height=2)
//         text("cylindric_bend", size=15, valign="bottom");

echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
