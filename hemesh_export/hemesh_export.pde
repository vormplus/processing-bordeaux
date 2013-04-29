import processing.opengl.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

void setup()
{
    size( 600, 600, OPENGL );
    
    // create the geodesic geometry
    HEC_Geodesic geo = new HEC_Geodesic().setRadius( 150 ).setLevel( 0 );
    
    // create a mesh from the geometry
    mesh = new HE_Mesh( geo );    
    
    // add some noise
    HEM_Noise noi = new HEM_Noise().setDistance( 10 );
    mesh.modify( noi );
    
    // extrude the mesh
    HEM_Extrude ext = new HEM_Extrude().setDistance( 10 ).setChamfer( 0.5 );
    mesh.modify( ext );
    
    // lattice
    HEM_Lattice lat = new HEM_Lattice().setWidth( 8 ).setDepth( 8 );
    mesh.modify( lat );
    
    // subdivide
    HES_CatmullClark cc = new HES_CatmullClark();
    mesh.subdivide( cc, 2 );
    
    // export the mesh
    HET_Export.saveToSTL( mesh, sketchPath("mymodel.stl"), 1.0 );
    
    // create the renderer
    render = new WB_Render( this );
}

void draw()
{
    background( 0 );
    lights();

    translate( width/2, height/2 );
    rotateY( radians( frameCount ) );
    rotateX( radians( frameCount ) );
    
    // draw the faces of the mesh
    noStroke();
    fill( 255 );
    render.drawFaces( mesh );
    
    // draw the edges of the mesh
    stroke( 0 );
    noFill();
    render.drawEdges( mesh );    
}
