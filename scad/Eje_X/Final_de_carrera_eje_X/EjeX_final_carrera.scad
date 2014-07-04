//---------------------------------------------------------------
//--  Eje X final de carrera.  (c) Antonio Castro Gómez
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------


difference()
{
	translate([0,0,1.5])cube(size=[26,6,3], center=true);
	//translate([0,0,1])cube(size=[13,9,4], center=true);

	translate([9.5,0,-1])cylinder(h=10, r=2, $fn=100);

	translate([-9.25,0,-1])cylinder(h=10, r=2, $fn=100);
}
difference()
{

  translate([0,3,7.05])rotate([90,0,0])cylinder(h=6, r=7.05, $fn=100);
  translate([0,5,7.05])rotate([90,0,0])cylinder(h=10, r=4.08, $fn=100);
  translate([0,0,11])cube(size=[5,8,10], center=true);	
}
