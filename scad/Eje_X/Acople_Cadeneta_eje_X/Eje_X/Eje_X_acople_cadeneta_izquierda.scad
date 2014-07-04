
//---------------------------------------------------------------
//--  Eje X acople cadeneta izquierda.  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------


//--Engache de cadeneta parte macho

module enganche_macho(){
h=13;	    //alto
l=25;	    //longitud
a=16; 	 //ancho
b=12;	    //distancia entre anclaje hembra y macho [(l/2)-(h/2)]*2
rh=2.8;	 //radio agujero anclaje hembra
rm=1.8;	 //radio cilindro anclaje macho
ah=1.5;	 //anchura anclaje hembra=altura cilindro anclaje macho=grosor pared de anclajes

//hueco interno
difference()
{
	//cuerpo
	union(){

		difference(){

			hull(){	

				translate([0,b/2,0])cylinder(h=a+0.5, r=h/2, $fn=100, center=true);
				translate([0,-b/2,0])cylinder(h=a, r=h/2, $fn=100, center=true);
			}
			//agujero anclaje hembra
			translate([0,(b/2)+1.5,0])cylinder(h=a+3, r=rh, $fn=100, center=true);	

			//rebaje anclaje macho con otro eslabon
			translate([0,-b/2,a/2])cylinder(h=ah*2, r=(h/2)+0.4, $fn=100, center=true);
			translate([0,-b/2,-a/2])cylinder(h=ah*2, r=(h/2)+0.4, $fn=100, center=true);	

			//rebaje horizontal
			translate([-h/2,((-a/2)+rm),0])cube(size=[(a/2)-rm-0,(a/2)+rm,a+1], center=true);

			//aplanado externo
			translate([0,(-l/2)-1,0])cube(size=[h+1,4,a+1], center=true);

			//aplanado diagonal
			translate([-1.5,(-l/2)-1,0])rotate([0,0,-55])cube(size=[h+1,4,a+1], center=true);	

	
		translate([-11.2,14,0])
		cylinder(r=16,h=17.1, center=true, $fn=100);	
		}
		//cilindro anclaje macho
		translate([0,(-b/2)-1,0])cylinder(h=a, r=rm, $fn=100, center=true);
	}
	translate([0,0,0])cube(size=[h-(ah*2),l*20,a-(ah*4)], center=true);

	//hueco macho
	translate([0,(-l/4)*2+rm,0])cube(size=[h+20,l/2,a-(ah*4)], center=true);
}
}



//--Engache de cadeneta parte hembra

module enganche_hembra(){
h=13;	    //alto
l=25;	    //longitud
a=16; 	 //ancho
b=12;	    //distancia entre anclaje hembra y macho [(l/2)-(h/2)]*2
rh=2.8; 	 //radio agujero anclaje hembra
rm=1.8;	 //radio cilindro anclaje macho
ah=1.5;	 //anchura anclaje hembra=altura cilindro anclaje macho=grosor pared de anclajes

translate([0,-b/2,0])cube([13,14,16], center=true);

//hueco interno
difference()
{
	//cuerpo
	union(){

		difference(){

			hull(){	
				translate([0,b/2,0])cylinder(h=a+0.5, r=h/2, $fn=100, center=true);
				translate([0,-b/2,0])cylinder(h=a, r=h/2, $fn=100, center=true);
			}
			//agujero anclaje hembra
			translate([0,(b/2)+1.5,0])cylinder(h=a+3, r=rh, $fn=100, center=true);		
		}
		//cilindro anclaje macho
		translate([0,(-b/2)-1,0])cylinder(h=a, r=rm, $fn=100, center=true);
	}
	translate([0,0,0])cube(size=[h-(ah*2),l*20,a-(ah*4)], center=true);

	//hueco hembra
	translate([0,(l/4)*2-rh,0])cube(size=[h+20,l/2,a-(ah*2)+0.5], center=true);
	translate([0,l/4,0])cube(size=[h-(ah*2),(l/2)-2,a-(ah*2)+0.5], center=true);	
}
}

//--Chaflan cilíndrico

module chaflan(){
	
difference(){
	translate([6,0,6])
	cube([12,18,12],center=true);

	rotate([90,0,0])
	cylinder(r=6, h=19, center=true, $fn=100);
	}
}

//-- Enganches

difference(){
	translate([-30,0,-3.5])
	rotate([90,90,180])
	enganche_hembra();

	translate([-25,0,-5])
	cube([21,13.5,12], center=true);

	translate([-18,0,-11])
	rotate([90,0,0])
	cylinder(r=12, h=20, center=true, $fn=100);
}


difference(){
	translate([20,-7.2,-3.5])
	rotate([90,-90,-90])
	enganche_macho();
	
	translate([20,0,-5])
	cube([10,23,13], center=true);

	translate([20,-5,-9.4])
	cube([20,10,5], center=true);
}

//-- Puente

difference(){
	
	translate([6,0,2])
	cube([74,16,2],center=true);

	translate([37,0,-3])
	chaflan();
}

//--Columna

difference(){
	
	translate([35.5,0,-31.5])
	cube([15,16,65],center=true);

	//Ornamento	

	translate([43,0,-12.5])
	rotate([0,45,0])
	cube([7,17,7],center=true);

	translate([37,0,-3])
	chaflan();

	translate([37,0,-58])
	rotate([180,0,0])
	chaflan();

	translate([34,0,-58])
	rotate([180,0,180])
	chaflan();

	//Encaje	

	translate([35.5,-3,-25])
	cube([16,11,25],center=true);

	translate([35.5,-7.8,-42.5])
	rotate([55,0,0])
	cube([16,20,11],center=true);

	//Taladros	

	translate([37,0,-27])
	rotate([90,0,0])
	cylinder(r=1.8, h=20, center=true, $fn=100);

	translate([37,0,-58])
	rotate([90,0,0])
	cylinder(r=1.8, h=20, center=true, $fn=100);

	//Embutimiento de tornillos

	translate([37,6.6,-27])
	rotate([90,0,0])
	cylinder(r=3.3, h=3, center=true, $fn=100);

	translate([37,6.6,-58])
	rotate([90,0,0])
	cylinder(r=3.3, h=3, center=true, $fn=100);

	//Polea motor

	translate([21,15,-42])
	rotate([90,0,0])
	scale([1,1.3,1])
	cylinder(r=12, h=30, cenrter=true, $fn=200);

	
}