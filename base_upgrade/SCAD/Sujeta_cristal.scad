//---------------------------------------------------------------
//--  Sujeta Cristal.  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------


difference(){

	union(){

	translate([0,0,0.1])
	cylinder(r=4.4, h=4.8, center=true, $fn=200);
	
		hull(){

			minkowski(){
 		
				 
				translate([0,6,2.5])
				cube([12,4,2],center=true);

				translate([0,0,1.2])
				 cylinder(r=2,h=0.5,center=true, $fn=200);
			}
	
			translate([0,0,2.5])
			cylinder(r=4.4, h=0.1, center=true, $fn=200);
	
		}
	
	}

cylinder(r=1.7, h=19, center=true, $fn=200);

translate([0,0,6])
cylinder(r=3, h=10, center=true, $fn=200);

}