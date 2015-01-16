//---------------------------------------------------------------
//--  Eje Y final de carrera base larga.  (c) Pedro de Oro Martín
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------

ancho=15;

module chaflan(x=5){
difference(){

translate([x,5,0]) cube([10,10,ancho+1],center=true);

cylinder(r=5,h=ancho+2,center=true, $fn=200);

}
}

difference(){

union(){

difference(){
translate([27,7.75,5])cube(size=[40,9.5,ancho], center=true);//lado base

translate([42,7.5,5])
chaflan(x=5);
}

translate([21,1.5,5])cube(size=[52,3,ancho], center=true);//central
translate([2,11,5])cube(size=[10,3,ancho], center=true);//lado pestaña

//pestaña
difference()
{
	translate([-4.35,11,5])cylinder(h=ancho, r=3, $fn=4, center=true);
	translate([-4.5,14,5])cube(size=[3,3,ancho+1], center=true);

}

translate([52,0,0])
difference()
{
	translate([-10.15,-2,5])cube(size=[10.3,12.5,ancho], center=true);//tornillo
	translate([-14,-4,5])rotate([0,90,0])cylinder(h=3.1, r=3.25, $fn=6, center=true);//tuerca
	translate([-9,-4,5])rotate([0,90,0])cylinder(h=30, r=1.7, $fn=100, center=true);//tuerca

}

}

translate([23,-2,5])
scale([1.4,1,1])
cylinder(r=10,h=17,center=true,$fn=200);

translate([7.65,2.5,5])
rotate([0,0,-90])
scale([0.5,0.5,1])
chaflan(x=8);
	
}