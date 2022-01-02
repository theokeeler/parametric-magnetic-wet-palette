// Copyright 2022 Theo Keeler (https://github.com/theokeeler/parametric-magnetic-wet-palette)
// This software is licensed under a Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License

include <PaletteShapes.scad>

// Base size of the palette in mm
$base_size = 150;

// Thickness of the lid walls in mm
$wall_size = 5;

// Wall tolerance in mm
$tolerance = 0.2;

// Palette Depth in mm
$depth = 10;

// Corner Radius in mm
$radius = 5;

union(){
    difference() {        
        palette_shape($base_size + $wall_size, $depth, $radius);
        translate([0,0,1])palette_shape($base_size + $tolerance, $depth, $radius);
    }
}