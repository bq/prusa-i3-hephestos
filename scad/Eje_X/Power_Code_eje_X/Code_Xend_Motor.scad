// Created from Code_Xend_Motor.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

include <Code_Config.scad>;

/**************************/
// Parámetros de la pieza  /
/**************************/

// Soporte para la tuerca del tornillo que regula
// la altura con el final de carrera
// { true = Añadir } { false = Quitar }
TorFinal = true;	
dTaTorfinal = 3.6 ;	// Diámetro del taladro
hTuer = 5.8 ; 		// Distancia entre caras de la tuerca

// Tuerca varilla roscada del eje Z
hTuZ = 7.96744 ;	// Distancia entre caras de la tuerca (7.96744)

// Características de los tornillos de sujeción del motor
dTaTorMo = 3.3 ;	// Diámetro del taladro para el paso del tornillo (3.3)
dTaHaTorMo = 5.7 ;	// Diámetro del alojamiento de la cabeza del tornillo (5.7)

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
			translate([25, -6.5, 0])
			cylinder(h = 58, r = 11);
			// Aplanado del cilindro anterior
			translate([14, -6.5, 0])
			cube([22, 10.6, 58]);
			// Alojamiento para la tuerca del eje Z
			translate([8, -6.5, 0])
			varros();
		}
		union(){
			// Alojamiento para los cojinetes lineales
			translate([25, -6.5, -1])
			cylinder(h = 60, r = dCoLi/2);
			// Ranura del alojamiento
			translate([25, -7.5, 0.5])
			rotate( 110, [0, 0, 1])
			cube([1, 11, 58]);
		}	
	}
}

// Alojamiento para el paso de la correa 
module tensor(){
	difference(){
		// Vaciado interior
		cube([42, 10, 30]);
		// Chaflanes superiores
		union(){
			translate([-1, 3, 30])
			rotate( 135, [1, 0, 0])
			cube([44, 3, 5]);
			translate([-1, 7, 30])
			rotate( -45, [1, 0, 0])
			cube([44, 5, 3]);
		}
	}
}

// Chaflán de 120º de la correa
module tencha(){
	// Chaflán inferior
	translate([0, 0, 0])
	rotate( 60, [0, 1, 0])
	cube([19, 19, 8]);
	// Chaflán superior
	rotate( 30, [0, 1, 0])
	cube([8, 19, 19]);
}

// Alojamiento y taladro para los tornillos del motor
module tormotor(){
	// Taladro del tornillo
	translate([0, 1, 0])
	rotate( 90, [1, 0, 0])
	cylinder(h = 8, r = dTaTorMo/2);
	// Alojamiento para la cabeza del tornillo
	translate([0, -6, 0])
	rotate( 90, [1, 0, 0])
	cylinder(h = 12, r = dTaHaTorMo/2);
}

// Soporte del motor paso a paso (Parte superior)
module sopmotorA(){
	// Parte en forma de cuña
	difference(){
		// Rectángulo de la pieza inicial
		cube([14.5, 17, 36]);
		union(){
			// Chaflán superior derecho 
			translate([14.5, -1, 34])
			rotate( -45, [0, 1, 0])
			cube([3, 19, 3]);
			// Chaflán inferior 
			translate([14.5, -1, 26])
			rotate( 120, [0, 1, 0])
			cube([30, 19, 14]);
			// Vaciado interior
			translate([-1, 3.5, 4.15])
			cube([16, 10, 20.7]);
			// Taladro para el tornillo del motor (Superior)
			translate([9, 17, 30])
			tormotor();

		}
	}
	// Parte plana trasera
	difference(){
		translate([0, 7, 3.5])
		cube([18.5, 10, 19.5]);
		union(){
			// Redondeo
			translate([18.5, 18, 8])
			rotate( 90, [1, 0, 0])
			cylinder(h = 12, r = 6);
			// Vaciado del redondeo
			translate([12.5, 6, 8])
			cube([7, 12, 16]);
			// Vaciado interior
			translate([-1, 3.5, 4.15])
			cube([16, 10, 20.7]);
		}
	}
	// Chaflán de la parte interior
	difference(){
		// Cubo base
			translate([-8, 2.5, -3.85])
			cube([8, 12, 8]);
		// Chaflán
			translate([0, 1.5, 4.15])
			rotate( -45-90, [0, 1, 0])
			cube([8, 14, 12]);
	}
}

// Soporte del motor paso a paso (Parte inferior)
module sopmotorB(){
	difference(){
		// Rectángulo base
		cube([46, 10, 19.5]);
		union(){
			// Chaflán inferior
			translate([42, -1, 0])
			rotate( 33.69, [0, 1, 0])
			cube([4, 12, 8]);
			// Chaflán superior derecho 
			translate([46, -1, 17.5])
			rotate( -45, [0, 1, 0])
			cube([3, 12, 3]);
			// Unión mediante el comando hull del redondeo y el chaflán
			hull(){
				// Chaflán superior izquierda 
				translate([34, -1, 17.5])
				rotate( -45, [0, 1, 0])
				cube([3, 12, 3]);
				// Redondeo
				translate([18.5, 11, 23.5])
				rotate( 90, [1, 0, 0])
				cylinder(h = 12, r = 6);
			}
			// Taladro para los tornillos del motor (Izquierdo)
			translate([9, 10, 14.5])
			tormotor();
			// Taladro para los tornillos del motor (Derecho)
			translate([40, 10, 14.5])
			tormotor();
		}
	}
}

// Soporte para el tornillo del final de carrera
module soptorfinal(){
	difference(){
		// Rectángulo base
		translate([-8.2, 0, -14])
		cube([8.2, 8, 14]);
		union(){
			// Taladro para el paso del tornillo
			translate([-4.23, 4, -15])
			cylinder(h = 16, r = dTaTorfinal/2);
			// Alojamiento de la tuerca
			translate([-4.23, 4, 0])
			hexagono(hTuer,6);
			// Chaflán inferior
			translate([-9, 0, -4])
			rotate( -140.27, [1, 0, 0])
			cube([10, 8, 14]);
		}
	}
}

// Unimos los diferentes módulos que forman la pieza
// Y aplicamos algunas operaciones comunes
module pieza(){
	// Soporte del motor paso a paso (Parte superior)
	translate([40, 0, 15.5])
	sopmotorA();
	// Soporte del motor paso a paso (Parte inferior)
	translate([40, 7, 0])
	sopmotorB();
	difference(){
		// Bloque principal de la pieza
		bloque();
		// Operaciones 
		union(){
			// Alojamiento de la varilla inferior
			translate([-1, 8.5, 6])
			varilla(42);
			// Alojamiento de la varilla superior
			translate([-1, 8.5, 51])
			varilla(42);
			// Alojamiento para el paso de la correa
			translate([-1, 3.5, 15])
			tensor();
			// Chaflán de 120º del paso de la correa
			translate([8.66, -1, 30])
			mirror([ 1, 0, 0 ])
			tencha();
			// Agujero superior
			translate([33.5, 2, 55])
			cylinder(h = 4, r = 2.55);
		}	
	}
	// Soporte para la rosca del tornillo 
	// que regula la altura con el final de carrera
	if ( TorFinal == true ){
		translate([44, -7.9, 51.5])
		soptorfinal();
	}
	
}

// Generamos la pieza!!

	pieza();	
