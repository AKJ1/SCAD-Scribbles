// CSG.scad - Basic example of CSG usage

 rotate_extrude(angle=360, convexity=2, $fn=100){
	  difference()
 {
 polygon(points=[[0,0],[200,10],[200,-10]]);
	 
 polygon(points=[[0,0],[20,10],[20,-10]]);
	 	 
 }
 }
 
 cube(5)
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
