# Processing Bordeaux Workshop - 2013.04.30

Code &amp; documentation from the Processing Bordeaux workshop.

## Different types of 3D printing

You can print your 3D models in different qualities, materials, and sizes. We'll take a look at some of the most widely used techniques for 3D printing.

### Selective Laser Sintering

* https://vimeo.com/14737152
* http://en.wikipedia.org/wiki/Selective_laser_sintering

### Fused Deposition Modeling

* https://vimeo.com/14292165
* http://en.wikipedia.org/wiki/Fused_deposition_modeling
* Technique used by Makerbot http://www.makerbot.com/, Ultimaker http://www.ultimaker.com/

### Stereolitography

* https://vimeo.com/13939214
* http://en.wikipedia.org/wiki/Stereolithography
* Used by the Formlabs Form 1 printer — http://formlabs.com/

## Introduction to HE_Mesh

HE_Mesh is a Processing library for mesh creation and manipulation created by Frederik Vanhoutte. You can download the library right over here: http://hemesh.wblut.com/

### Creators

Creators are the building blocks to create 3D geometry with HE_Mesh. There are a lot of basic shapes available, like boxes, spheres, cones, cylinders, … Alternatively, you can also create custom meshes if you calculate the vertices and faces yourself.

#### Code Examples

* hemesh_cube
* hemesh_geodesic

### Displaying Meshes

To display a mesh on the screen, you need to use the WB_Render class. You'll use this class most of the times to display the faces or edges, but it can also be used to display vertices, vertex normals or face normals.

#### Code Examples

* hemesh_render

### Subdividors

Subdividors are used to split every face in your model into more faces, usually to create a smoother model. The CatmullClark subdivider is probably the one you'll use the most.

### Modifiers

Modifiers are used to change the geometry of your mesh. These can be used to create a lattice, or to extrude the faces along their normal.

### Exporting Meshes

To save your mesh for 3D printing, you'll need to use the HET_Export class and save your model as an STL file.

### Using the HE_Mesh documentation

HE_Mesh is a big library with lots of options. The good thing is that it also comes with examples for most of the creators, modifiers and subdividors. You can find these sketches in the examples folder of the library.

In the reference folder, you'll find the full Java documentation of the library. These are handy if you want to see the methods that are available to use to create geometry.

## Introduction to Toxiclibs

TODO: Corneel writes some introduction...


## Tools for Repairing Meshes

### Meshlab

http://meshlab.sourceforge.net/

### Netfabb

http://www.netfabb.com/


## Software used for 3D printing

### ReplicatorG
http://replicat.org/

### Pleasant3D
http://www.macupdate.com/app/mac/32803/pleasant3d

## Makerbot Troubleshooting



