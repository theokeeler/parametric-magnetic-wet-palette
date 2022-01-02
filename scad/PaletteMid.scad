// Copyright 2022 Theo Keeler (https://github.com/theokeeler/parametric-magnetic-wet-palette)
// This software is licensed under a Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License
include <PaletteShapes.scad>

// Base size of the palette in mm
$base_size = 150;

// Thickness of the body walls in mm
$wall_size = 5;

// Wall tolerance in mm
$tolerance = 0.2;

// Palette Depth in mm. Mid body will be 30% of this.
$depth = 10;

// Corner Radius in mm
$radius = 5;

// Magnet radius in mm
$magnet_radius = 3;

// Magnet height in mm
$magnet_height = 2;

// Magnet horizontal tolerance in mm. This is intentionally tight for a friction fit.
$magnet_tolerance = 0;

// Internal calculated values
// Mid body depth is 30% of the palette height so it should fit cleanly on the magnet pillars but not hit the lid.
mid_body_depth = $depth*0.3;

// Magnet pillar values. Offsets by 1mm into the wall.
magnet_pillar_size = $base_size - $wall_size + 1;

difference() {
    union(){
        difference() {        
            palette_shape($base_size - $wall_size - $tolerance, mid_body_depth, $radius);
            palette_shape($base_size - $wall_size*2, mid_body_depth + 0.1, $radius);
        }
        
        intersection(){ 
            palette_pillars(magnet_pillar_size, mid_body_depth, $radius);
            palette_shape($base_size - $wall_size - $tolerance, mid_body_depth, $radius);
        }
    }
    
    // We force a 0.5mm floor for the magnets; Making this taller would make the magnetic catch weaker.
    translate([0,0,0.5])palette_pillars(magnet_pillar_size - ($magnet_radius + $magnet_tolerance + 1), $magnet_height + $tolerance, $magnet_radius + $magnet_tolerance);
}