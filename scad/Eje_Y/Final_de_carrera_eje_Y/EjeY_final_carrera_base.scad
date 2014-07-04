//---------------------------------------------------------------
//--  Eje Y final de carrera base.  (c) Antonio Castro Gómez
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------





translate([0,1.5,5])cube(size=[20,3,10], center=true);//central
translate([8.5,7.75,5])cube(size=[3,9.5,10], center=true);//lado base
translate([2,11,5])cube(size=[10,3,10], center=true);//lado pestaña

//pestaña
difference()
{
	translate([-4.5,11,5])cylinder(h=10, r=3, $fn=4, center=true);
	translate([-4.5,14,5])cube(size=[3,3,10], center=true);

}
difference()
{
	translate([-7.5,-5.25,5])cube(size=[5,12.5,10], center=true);//tornillo
	translate([-9,-6.5,5])rotate([0,90,0])cylinder(h=3, r=3.25, $fn=6, center=true);//tuerca
	translate([-9,-6.5,5])rotate([0,90,0])cylinder(h=30, r=1.85, $fn=100, center=true);//tuerca

}

	
