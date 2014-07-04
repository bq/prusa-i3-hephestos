

//---------------------------------------------------------------
//--  Llave fija impresa 10 (M6) - 13 (M8) - 17 (M10) .  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------


X = 0;
Y = 1;
Z = 2;


//-- Size of the logo in the dxf file
size_ini = [106.8, 91.8];

//-- Original width of the b and q lines
width = 15;

module bq_logo(lx = 12, h = 2)
{
  s = lx / size_ini[X];

  linear_extrude(height=h)
    scale([s, s, 1])
    import("bq-logo2d.dxf", layer="lines");


}


// Diametros tuercas metricas ISO 4032

DTM6 = 11.05;
DTM8 = 14.38;
DTM10 = 18.90;


// Incremento revolucionario
INCREMENTO = 0.4;

valorZ=8;

//--Lave fija

difference(){
	union(){
		difference() {
		
		union(){  
			cube([80,16,valorZ], center=true);
			
			translate([43,0,0])
			cylinder(r=14.5, h=valorZ, center=true, $fn=100);
			
			translate([-43,0,0])
			cylinder(r=12.5, h=valorZ, center=true, $fn=100);
			
			cylinder(r=10, h=valorZ, center=true, $fn=100);
			
		}
		
		 translate([-61.8,0,0.5])
		 cube([20,40,valorZ+1], center=true);
		
		 translate([62.8,0,0.5])
		 cube([20,40,valorZ+1], center=true);
		
		 // Tuerca M8
		 translate([-48,0,0.5])
		 rotate([0,0,60])
		 cylinder(h=valorZ+1, r=(DTM8*0.5)+INCREMENTO-0.1, $fn=6 , center=true);
		
		 // Tuerca M6
		 translate([0,0,0.5])
		 rotate([0,0,90])
		 cylinder(h=valorZ+1, r=(DTM6*0.5)+INCREMENTO+0.2, $fn=6 , center=true);
		
		 // Tuerca M10
		 translate([48,0,0.5])
		 rotate([0,0,60])
		 cylinder(h=valorZ+1, r=(DTM10*0.5)+INCREMENTO-0.2, $fn=6 , center=true);


	}
}

translate([18,0,3.1])
bq_logo();

}
  





