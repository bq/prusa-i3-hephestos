

//---------------------------------------------------------------
//--  Eje Z final de carrera.  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------


//-- Chaflan cilíndrico

module chaflan(){

	difference(){
		cylinder(h=30,r=3,$fn=100,center=true);

		translate([3,0,0])
		cylinder(h=30,r=3,$fn=100,center=true);
		
		translate([0,-5,0])
		cube([10,10,40], center=true);
	}
}

//-- Cuerpo

difference()
{
	translate([0,17.5,-0.5])
	cube(size=[26,41,5], center=true);

	translate([20,37.5,0])
	cube(size=[26,41,6], center=true);

	translate([-20,37.5,0])
	cube(size=[26,41,6], center=true);

	translate([9.5,0,-1])
	cylinder(h=35, r=2,center=true, $fn=100);

	translate([-9.25,0,-1])
	cylinder(h=35, r=2,center=true, $fn=100);

	translate([-13,8,0])
	chaflan();
	
	translate([11.3,10.5,0])
	rotate([0,0,245])chaflan();

//agujero para soldaduras

			translate([0,6.5,0])
			cube(size=[12,7,10], center=true);

//curvas esteticas

			translate([16,18,0])
			cylinder(h=30,r=9,$fn=100,center=true);

			translate([-16,18,0])
			cylinder(h=30,r=9,$fn=100,center=true);
		}


//-- Sujección varilla

difference()
{

  translate([0,3,7.05])
  rotate([90,0,0])
  cylinder(h=6, r=7.05, $fn=100);

  translate([0,5,7.05]) 
  rotate([90,0,0])
  cylinder(h=10, r=4.08, $fn=100);

  translate([0,0,11])
  cube(size=[5,8,10], center=true);	
}

