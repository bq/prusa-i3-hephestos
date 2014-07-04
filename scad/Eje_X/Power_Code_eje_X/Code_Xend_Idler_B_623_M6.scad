// Created from Code_Xend_Idler_B_623_M6.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

include <Code_Config.scad>;

/**************************/
// Parámetros de la pieza  /
/**************************/

dTor = 6.2 ; 	// Diámetro del tornillo del tensor (6.2)

// Los dos taladros del soporte para el tornillo de la polea
dToSo = 3.3 ;	// Diámetro del taladro (3.3)
dToCh = 6 ; 	// Diámetro del zócalo (6)
dToTu = 5.8 ; 	// Tamaño de la tuerca (5.8)

// Creamos la mitad de la base
module mbase(){
	// Redondeo y chaflan mediante el comando hull
	hull(){
		// Bloque de la base
		translate([-14, -9.5, 0])
		cube([28, 9.5, 8]);
		// Redondeo superior 
		translate([0, 0, 10])
		rotate( 90, [1, 0, 0])
		cylinder(h = 9.5, r = 5);	
	}
}

// Operaciones para la media base
module mbaseope(){
	// Vaciado interior
	translate([-9.5, -6, -1])
	cube([19, 7, 17]);
	// Taladro para el tornillo
	translate([0, -5, 10])
	rotate( 90, [1, 0, 0])
	cylinder(h = 5, r = dToSo/2);
}

// Base de la pieza
module base(){
	difference(){
		union(){
			// Media base en -Y 
			mbase();
			// Media base en +Y
			mirror([ 0, 1, 0 ])
			mbase();
		}
		union(){
			// Media parte de las operaciones en -Y 
			mbaseope();
			// Media parte de las operaciones en +Y 
			mirror([ 0, 1, 0 ])
			mbaseope();
			// Zócalo para la cabeza del tornillo
			translate([0, 9.5, 10])
			rotate( 90, [1, 0, 0])
			hexagono(dToTu,3);
			// Zócalo para la tuerca
			translate([0, -10, 10])
			rotate( -90, [1, 0, 0])
			cylinder(h = 2, r = dToCh/2);
		}
	}
}

// Medio soporte
module msoporte(){
	difference(){
		// Bloque principal del soporte
		translate([0, -4.7, 0])
		cube([14, 9.4, 40]);
		// Chaflán superior del soporte
		translate([10.634, -6, 40])
		rotate( 45 , [0, 1, 0])
		cube([5, 12, 5]);
	}
}

module msoporteope(){
	// Parte inferior redondeada
	hull(){
		// Bloque inferior
		translate([-1, -6, -1])
		cube([10.5, 12, 10]);
		// Redondeo interior 
		translate([0, 6, 10])
		rotate( 90, [1, 0, 0])
		cylinder(h = 12, r = 9.5);	
		// Bloque del medio
		translate([-1, -6, 17.6])
		cube([7, 12, 1]);
	}
	// Parte superior con chaflán
	hull(){
		// Bloque del medio
		translate([-1, -6, -1])
		cube([7, 12, 31.26]);
		// Bloque superior
		translate([-1, -6, 31])
		cube([6, 12, 1]);
	}
	
}

// Base de la pieza
module soporte(){
	difference(){
		union(){
			// Medio soporte en +X 
			msoporte();
			// Medio soporte en -X 
			mirror([ 1, 0, 0 ])
			msoporte();
		}
		union(){
			// Media parte de las operaciones en +X
			msoporteope();
			// Chaflanes a lo largo del eje Z
			translate([14, 1.7, 0])
			chamfer(5,41,0);
			translate([14, -1.7, 0])
			chamfer(5,41,2);
			// Media parte de las operaciones en -X 
			mirror([ 1, 0, 0 ])
			msoporteope();
			// Taladro superior para el tensado
			translate([0, 0, 32 + 0.3]) // Se añade un 0.3 para poder imprimir el puente
			cylinder(h = 10, r = dTor/2);
		}
	}
}

// Unimos la base y el soporte para crear la pieza
module pieza(){
	base();
	soporte();
}

// Generamos la pieza!!

	pieza();
