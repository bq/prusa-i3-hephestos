
//---------------------------------------------------------------
//--  Eje Y final de carrera marco.  (c) Antonio Castro Gómez
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------

difference()
{
	union()
	{	
		difference()
		{
			union()
			{
				translate([0,0,1.5])cube(size=[26,16,3], center=true);
				translate([0,6,17.5])cube(size=[26,4,35], center=true);
			}
			//agujeros para tornillos M3
			translate([9.5,-5.3,0])cylinder(h=10,r=1.58,$fn=100,center=true);
			translate([-9.5,-5.3,0])cylinder(h=10,r=1.58,$fn=100,center=true);
			//agujero para soldaduras
			translate([0,0,0])cube(size=[12,7,10], center=true);
			//curvas esteticas
			translate([16,0,20])rotate([90,0,0])cylinder(h=30,r=11,$fn=100,center=true);
			translate([-16,0,19.5])rotate([90,0,0])cylinder(h=30,r=10,$fn=100,center=true);
		}

		translate([-13,6,32])rotate([90,0,0])cylinder(h=4,r=3,$fn=100,center=true);
		translate([10,6,34])rotate([90,0,0])cylinder(h=4,r=3,$fn=100,center=true);
	}

	translate([-13,7,32])rotate([90,0,0])cylinder(h=10,r=1.58,$fn=100,center=true);
}
