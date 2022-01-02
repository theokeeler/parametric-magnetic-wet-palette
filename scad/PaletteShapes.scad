// Copyright 2022 Theo Keeler (https://github.com/theokeeler/parametric-magnetic-wet-palette)
// This software is licensed under a Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License

$fn = $preview ? 36 : 360;

module palette_pillars(width, height, corner_radius) {
    half_width = width/2 - corner_radius;
        translate([-1*half_width, -1*half_width, 0])cylinder(h = height, r = corner_radius, center = true);
        translate([half_width, -1*half_width, 0])cylinder(h = height, r = corner_radius, center = true);
        translate([half_width, half_width, 0])cylinder(h = height, r = corner_radius, center = true);
        translate([-1*half_width, half_width, 0])cylinder(h = height, r = corner_radius, center = true);
}

module palette_shape(width, height, corner_radius) {
    hull() {
        palette_pillars(width, height, corner_radius);
    }
}