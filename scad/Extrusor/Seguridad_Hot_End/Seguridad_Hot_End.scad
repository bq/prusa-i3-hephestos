
//---------------------------------------------------------------
//--  Soporte ventilador.  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------


//--Adaptador para Tobera

translate([2,0,0])
union(){
difference(){
	translate([15.05,0,0])
	cube([4.5,20,7.5],center=true);

	translate([14,0,0])
	rotate([90,0,90])
	cylinder(r=3,h=3.1,$fn=6,center=true);
	
	translate([14,0,0])
	rotate([90,0,90])
	cylinder(r=1.5,h=8.1,$fn=200,center=true);

}

hull(){

translate([14.3,11.4,0])
cube([3,3,7.5],center=true);

translate([31,10.3,0])
cube([3,1,7.5],center=true);
}

hull(){

translate([14.3,-11.4,0])
cube([3,3,7.5],center=true);

translate([31,-10.3,0])
cube([3,1,7.5],center=true);
}

    translate([15.3,13,0])
	scale([1,1.5,1])
	cylinder(r=2.5,h=7.5,$fn=200,center=true);

	translate([15.3,-13,0])
	scale([1,1.5,1])
	cylinder(r=2.5,h=7.5,$fn=200,center=true);

}

//-- Boquilla

module boquilla(){

//Cono

difference(){

	hull(){
		
		cylinder(r=25,h=7.5,$fn=200, center=true);
		translate([0,0,-13.5])
		cylinder(r=11.5,h=4,$fn=200, center=true);
	}
	
	
	hull(){
		
		cylinder(r=23,h=7.55,$fn=200, center=true);
		translate([0,0,-13.5])
		cylinder(r=9.5,h=4.05,$fn=200, center=true);
	}
	
	//Huecos para ventilación

	translate([25,0,0])
	cube([30,24,40],center=true);

	translate([11.5,0,0])
	scale([1,1,1])
	cylinder(r=12,h=40,$fn=200,center=true)
	
	translate([-19,0,0])
	cube([40,8,40],center=true);

	translate([0,0,-7])
	rotate([90,0,0])
	scale([1,1.7,1])
	cylinder(r=4.5,h=60, $fn=200, center=true);

	translate([-10,-10,-7])
	rotate([90,0,135])
	scale([1,1.7,1])
	cylinder(r=4.5,h=30, $fn=200, center=true);

	translate([-10,10,-7])
	rotate([90,0,45])
	scale([1,1.7,1])
	cylinder(r=4.5,h=30, $fn=200, center=true);

	translate([7,10,-4])
	rotate([90,0,145])
	scale([1,1.7,1])
	cylinder(r=2.5,h=35, $fn=200, center=true);

	translate([7,-10,-4])
	rotate([90,0,-145])
	scale([1,1.7,1])
	cylinder(r=2.5,h=35, $fn=200, center=true);

}
}



difference(){
	boquilla();

	//Huecos para ventilación

	translate([-19,0,3.7])
	cube([20,15,15],center=true);

	translate([-19,0,-3])
	rotate([0,90,0])
	cylinder(r=7.5,h=20, $fn=200, center=true);

	translate([0,0,-2])
	cube([8.5,50,6],center=true);
	
	translate([-10,-10,-2])
	rotate([0,0,135])
	cube([8.5,50,6],center=true);

	translate([-10,10,-2])
	rotate([0,0,45])
	scale([1,1.7,1])
	cube([8.5,30,6],center=true);

	translate([7,10,-1.5])
	rotate([0,0,145])
	cube([5,35,5],center=true);

	translate([7,-10,-1.5])
	rotate([0,0,-145])
	cube([5,35,5],center=true);
}


