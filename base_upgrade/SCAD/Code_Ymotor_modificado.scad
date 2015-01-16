// Created from Code_LevelExtruder.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

include <Code_Config.scad>;

/**************************/
// Parámetros de la pieza  /
/**************************/

hBase = 10 ;	// Altura de la base (10)

dExtru = 40 ;	// Radio central del extrusor (40)

// Los dos taladros del soporte para el motor
dTaSo = 3.2 ;	// Diámetro del taladro (3.2)
dTaCh = 6 ; 	// Diámetro del zócalo (6)

dTor = 3.2 ; 	// Diámetro del tornillo del soporte (6.3)

module vaciadoEx(){
	// Vaciado exterior (Eje X)
	translate([3, -1, -1])
	cube([32.2, 6, hBase+2]);
	// Vaciado exterior (Eje Y)
	translate([-1, 17.5, -1]) 
	cube([2.7, 34, hBase+2]);
}

// Vaciado interior
module vaciadoIn(){
	translate([34, 19.5, -1])
	cube([14, 32, hBase+2]);
	translate([18.7, 17.5, -1])
	cube([16, 34, hBase+2]);
	translate([18.7, 23.5, -1])
	cylinder(h = hBase+2, r = 6, $fn=100);
	translate([12.7, 23.5, -1])
	cube([7, 15.5, hBase+2]);
	translate([14.7, 37, -1])
	cube([7, 14.5, hBase+2]);
}

// Chaflanes de la pieza en sentido anti-horario 
// empezando en por el del [0,0,0]
module chaflanes(){
	translate([0, 5, -1])
	chamfer(6, hBase+2, 2);
	translate([37.2, 0, -1])
	chamfer(14, hBase+2, 3);
	translate([46.7, 17.5, -1])
	chamfer(3, hBase+2, 0);
	translate([34.7, 17.5, -1])
	chamfer(3, hBase+2, 0);
	translate([12.7, 39, -1])
	chamfer(3, hBase+2, 3);
	translate([12.7, 51, -1])
	chamfer(3, hBase+2, 3);
	translate([1.7, 47, -1])
	chamfer(6, hBase+2, 0);
	translate([1.7, 17.5, -1])
	chamfer(3, hBase+2, 1);
}

// Taladro y zócalo para los tornillos de soporte del motor
module TMotor(){
	// Taladro para el tornillo
	cylinder(h = hBase+2, r = dTaSo/2, $fn=100);
	// Vaciado para la cabeza
	translate([0, 0, 7.5])
	cylinder(h = hBase-5.5, r = dTaCh/2, $fn=100);
	translate([0, -dTaCh/2, 7.5])
	cube([6, dTaCh, hBase-5.5]);
}

// Redondeo grande entre la sujeción y soporte
module redondeo(){
	difference(){
		// Relleno
		translate([3, 15, hBase])
		cube([32.2, 5, 5]);
		// Vaciado
		translate([0, 20, hBase+5])
		rotate( 90, [0, 1, 0])
		cylinder(h = 38, r = 5, $fn=100);	
	}
}

// Base de la pieza en el plano X-Y
module base(){
	difference(){
		union(){
			// Base de la pieza
			cube([46.7, 51, hBase]);
			// Redondeo entre la base y la sujecion
			redondeo();
		}
		union(){
			vaciadoEx();
			vaciadoIn();
			chaflanes();
			// Taladro de soporte del motor en el eje Y
			translate([9.7, 45, -1])
			TMotor();
			// Taladro de soporte del motor en el eje X
			translate([40.7, 14, -1])
			rotate( 90, [0, 0, 1])
			TMotor();
		}
	}
}

// Bloque de sujeción en el plano X-Z
module sujecion(){
	// Comando hull para unir todas las superficies 
	hull(){
		// Cilindros superiores
		translate([10, 0, 16])
		rotate( -90, [1, 0, 0])
		cylinder(h = 10, r = 10, $fn=100);
		translate([22.2, 0, 16])
		rotate( -90, [1, 0, 0])
		cylinder(h = 10, r = 10, $fn=100);
		// Cubo de la base
		cube([32.2, 10, 1]);
	}
}

// Vaciado y taladro para el tornillo de sujeción
module TTornillo(){
	// Taladro para el tornillo
	translate([22.2, -1, 16])
	rotate( -90, [1, 0, 0])
	cylinder(h = 9, r = dTor/2, $fn=100);
	// Vaciado para la cabeza 
	translate([22.2, 7, 16])
	rotate( -90, [1, 0, 0])
	cylinder(h = 6, r = 3, $fn=100);	
	
	
}


// Unimos todos los bloques para crear la pieza
module pieza(){
	difference(){
		union(){
			// Base de la pieza
			base();
			// Soporte para el tornillo
			translate([3, 5, hBase-10])
			sujecion();
		}
		union(){
			// Taladro y zocalo para el tornillo del soporte
			translate([2, 5, 0])
			TTornillo();
			translate([-8, 5, 0])
			TTornillo();
			translate([45,0,5])
			rotate([0,0,45])
			cube([20,10,11],center=true);
			translate([0,50,5])
			rotate([0,0,45])
			cube([20,10,11],center=true);
		}
	}
}

// Generamos la pieza!!

	pieza();