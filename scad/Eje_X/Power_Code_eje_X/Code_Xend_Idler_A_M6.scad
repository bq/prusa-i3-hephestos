// Created from Code_Xend_Idler_A_M6.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

include <Code_Config.scad>;

/**************************/
// Parámetros de la pieza  /
/**************************/

// Tuerca varilla roscada del eje Z
hTuZ = 7.96744 ;	// Distancia entre caras de la tuerca (7.96744)

// Tuerca del tensor
hTuTen = 10.2 ;		// Distancia entre caras de la tuerca (10.2)


// Alojamiento de las varillas lisas ( h = longitud )
module varilla(h){
	// Comando hull() para crear los chaflanes
	hull(){
		// Parte cilíndrica
		rotate( 90, [0, 1, 0])
		cylinder(h = h, r = dVaLi/2);
		// Parte plana superior
		translate([0, -2.5/2, 0])
		cube([h, 2.5, 4.51]);
	}
}

// Alojamiento de la tuerca de la varilla roscada
module varros(){
	rotate( 90, [0, 0, 1])
	difference(){
		union(){
			// Hexágono base
			translate([0, 0, 4])
			hexagono(13.8564,8);
			// Aplanado
			translate([0, -8, 0])
			cube([7, 16, 8]);
		}
		union(){
			// Alojamiento de la tuerca
			translate([0, 0, 8])
			hexagono(hTuZ,10);
			// Taladro para la varilla 
			translate([0, 0, -1])
			cylinder(h = 5, r = 3.1);
		}
	}

}

// Bloque rectangular y alojamiento de los cojinetes lineales
module bloque(){
	difference(){
		union(){
			// Bloque rectangular base
			cube([40, 17, 58]);
			// Cilindro para los cojinetes lineales
			translate([15, -6.5, 0])
			cylinder(h = 58, r = 11);
			// Aplanado del cilindro anterior
			translate([4, -6.5, 0])
			cube([22, 10.6, 58]);
			// Alojamiento para la tuerca del eje Z
			translate([32, -6.5, 0])
			varros();
		}
		union(){
			// Alojamiento para los cojinetes lineales
			translate([15, -6.5, -1])
			cylinder(h = 60, r = dCoLi/2);
			// Ranura del alojamiento
			translate([15, -6.5, 0.5])
			rotate( -107.48, [0, 0, 1])
			cube([1, 11, 58]);
		}	
	}
}

// Alojamiento achaflanado de la tuerca del tensor
module tuercatensor(){
	//rotate( 90, [0, 0, 1])
	difference(){
		union(){
			difference(){
				// Hexágono base
				rotate( 90, [0, 0, 1])
				hexagono(17,10);
				// Eliminación del pico inferior sobrante
				translate([8, -4, -6])
				cube([3, 8, 12]);
			}
			// Chaflán entre el aplanado y el bloque
			hull(){
				// Aplanado del hexágono
				translate([0, -8.5, 0])
				cube([8.24, 17, 5]);
				// Base para el chaflán
				translate([0, -8.5, -5])
				cube([16.9, 17, 5]);
			}
			
		}
		union(){
			// Alojamiento de la tuerca
			rotate( 90, [0, 0, 1])
			translate([0, 0, 5])
			hexagono(hTuTen,8);
		}
	}
}

// Alojamiento para el tensor 
module tensor(){
	difference(){
		// Vaciado interior
		cube([36, 10, 30]);
		// Chaflanes superiores
		union(){
			translate([-1, 3, 30])
			rotate( 135, [1, 0, 0])
			cube([38, 3, 5]);
			translate([-1, 7, 30])
			rotate( -45, [1, 0, 0])
			cube([38, 5, 3]);
		}
	}
}

// Chaflán de 120º del tensor
module tencha(){
	// Chaflán inferior
	translate([0, 0, 0])
	rotate( 60, [0, 1, 0])
	cube([19, 19, 8]);
	// Chaflán superior
	rotate( 30, [0, 1, 0])
	cube([8, 19, 19]);

}

// Unimos los diferentes módulos que forman la pieza
// Y aplicamos algunas operaciones comunes
module pieza(){
	difference(){
		union(){
			// Bloque principal de la pieza
			bloque();
			// Alojamiento para la tuerta del tensor
			translate([0, 8.5, 30])
			rotate( 180, [0, 0, 1])
			rotate( 90, [0, 1, 0])
			tuercatensor();
		}
		// Operaciones 
		union(){
			// Alojamiento de la varilla inferior
			translate([-1, 8.5, 6])
			varilla(42);
			// Alojamiento de la varilla superior
			translate([-1, 8.5, 51])
			varilla(42);
			// Taladro para el tornillo del tensor
			translate([-2, 8.5, 30])
			rotate( 90, [0, 1, 0])
			cylinder(h = 10, r = 3.4);
			// Alojamiento para el tensor
			translate([5, 3.5, 15])
			tensor();
			// Chaflán de 120º del tensor
			translate([31.33975, -1, 30])
			tencha();
			
		}	
	}
}

// Generamos la pieza!!

	pieza();	
