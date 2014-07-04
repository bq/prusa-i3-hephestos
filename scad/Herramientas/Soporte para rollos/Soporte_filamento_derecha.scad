//--------------------------------------------------------------------------
//-- Soporte para rollo de filamento de prusa i3. (c) Antonio Castro Gómez
//--------------------------------------------------------------------------
//-- Released under the GPL license
//--------------------------------------------------------------------------


difference()
{
	union()
	{

		//enganche con marco
		difference()
		{
			union()
			{
				minkowski()
				{
					cylinder(h=8, r=6, $fn=100, center=true);
					translate([20,3.5,8])cube(size=[40,7,8], center=true);
				}

				//Cuerpo spooler
				linear_extrude(height = 10)
				polygon(points=[	[-2.5,12.4], /*pico enganche superior*/
								[43,-5.35], /*pico encganche inferior*/
								[-130,-50],
								[-130,-40] ]);

				//base soporte
				translate([-130,-42,5])cylinder(h=10, r=12, $fn=100, center=true);
			}
				translate([20,3.5,10])cube(size=[41,7,25], center=true);
				translate([26.1,9.5,10])cube(size=[40,7.5,25], center=true);
				translate([0,0,18])cube(size=[100,50,16], center=true);
				translate([-130,-42,-1])cylinder(h=30, r=1.8, $fn=100, center=true);
		}
		translate([-130,-42,17.5])cylinder(h=35, r=10, $fn=100, center=true);
	}//Fin union()
}




