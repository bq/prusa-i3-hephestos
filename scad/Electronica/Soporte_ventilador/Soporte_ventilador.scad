
//---------------------------------------------------------------
//--  Soporte ventilador.  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------

//--Chaflan cilíndrico

module chaflan(){

	difference(){

		translate([6,0,6])
		cube([12,16,12],center=true);

		rotate([90,0,0])
		cylinder(r=6, h=17, center=true, $fn=100);
	}
}

//--Resta del marco

module marco_resta(){

translate([0,0,00])
difference(){

	translate([0,24,-53])
	rotate([45,0,0])
	cube([ancho+20,6,90], center=true);

	translate([0,13.5,-55])
	cylinder(r=(ancho+12)/2+0.5, h=40, center=true, $fn=150);

	translate([0,24,-53])
	rotate([45,0,0])
	cube([ancho,7,95], center=true);

	translate([0,-5,-23])
	rotate([45,0,0])
	cube([ancho+13,8,53], center=true);

}}



//--Soporte ventilador

ancho=55;


rotate([5,0,0])
difference(){
	
	union(){
		
		difference(){
		
			union(){
		
				//Marco prusa

				hull(){		
					cube([ancho,5,60], center=true);
					translate([0,-5,0-27.5],center=true)
					cube([68.5,5,5],center=true);
				}
		
				//Marco ventilador
				translate([0,24,-53])
				rotate([45,0,0])
				cube([ancho+15,5,70], center=true);
		
				
				//Refuerzo ventilador
				translate([0,49.5,-74.5])
				cube([ancho,5,10],center=true);

				//Refuerzo ventilador	
				translate([0,45,-72.25])
				cube([ancho,5,5.5],center=true);

				translate([30,0,-27.5])
				cube([8,5,5], center=true);

				translate([-30,0,-27.5])
				cube([8,5,5], center=true);		
			}

		translate([37.5,-3,5])
		cube([20,14,60], center=true);		
	
		translate([-37.5,-3,5])
		cube([20,14,60], center=true);

		translate([0,-20,-25])
		cube([ancho-10,60,100], center=true);
		
		translate([0,13.5,-55])
		cylinder(r=(ancho+5)/2+0.5, h=40, center=true, $fn=150);

		translate([0,40,-95])
		rotate([90,0,0])
		cylinder(r=24, h=80, center=true, $fn=150);

      marco_resta();
	
		//chaflanes base

		translate([28,0,-31])
		chaflan();

		translate([-28,0,-31])
		rotate([0,0,180])
		chaflan();

		}

	//Esquinas marco

	translate([-22,-0.5,24.5])
	rotate([85,0,0])
	cylinder(r=5, h=5, center=true, $fn=100);

	translate([22,-0.5,24.5])
	rotate([85,0,0])
	cylinder(r=5, h=5, center=true, $fn=100);
	}

		//Taladros marco
		translate([21.5,0,25])
		rotate([85,0,0])
		cylinder(r=1.8, h=20, center=true, $fn=100);
		
		translate([-21.5,0,25])
		rotate([85,0,0])
		cylinder(r=1.8, h=20, center=true, $fn=100);

		//Tuercas embutidas
		translate([21.5,2,25])
		rotate([85,0,0])
		cylinder(r=3.5,h=3.1,$fn=6,center=true);
		
		translate([-21.5,2,25])
		rotate([85,0,0])
		cylinder(r=3.5,h=3.1,$fn=6,center=true);
		
		//Taladros ventilador
		translate([20,50,-75])
		rotate([90,0,0])
		cylinder(r=1.8, h=20, center=true, $fn=100);
		
		translate([-20,50,-75])
		rotate([90,0,0])
		cylinder(r=1.8, h=20, center=true, $fn=100);

		//Tuercas empotradas
		translate([-20,39,-75])
		rotate([90,0,0])
		cylinder(r=3.5,h=20,$fn=6,center=true);

		translate([20,39,-75])
		rotate([90,0,0])
		cylinder(r=3.5,h=20,$fn=6,center=true);
		
		//Chaflanes marco
		translate([21.5,0,24])
		chaflan();

		translate([-21.5,0,24])
		rotate([0,0,180])
		chaflan();

		//Chaflanes ventilador
		translate([21.5,50,-73.5])
		rotate([0,90,0])
		chaflan();

		translate([-21.5,50,-73.5])
		rotate([0,90,180])
		chaflan();

		translate([-21.5,46,-74])
		rotate([-90,0,90])
		chaflan();

		translate([21.5,46,-74])
		rotate([-90,0,0])
		chaflan();	
}

	
