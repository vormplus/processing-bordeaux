//Processing Bordeaux April 2013
//Toxiclibs VolumetricBrush for 3D Printing

//Corneel Cannaerts 

//import libraries
import toxi.geom.*;
import toxi.volume.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import processing.opengl.*;
import peasy.*;

PeasyCam cam;
VolumetricSpace volume;
VolumetricBrush brush;
IsoSurface surface;
WETriangleMesh wemesh;
ToxiclibsSupport gfx;

ArrayList <Branch> branches;

//dimensions of volumetric array
int DIMX=256;
int DIMY=256;
int DIMZ=256;

//variables for volumetric brush
float density=0.5;
float ISO_THRESHOLD = 0.1;
Vec3D SCALE=new Vec3D(1, 1, 1).scaleSelf(250);

void setup() {
  size(900, 600, OPENGL);
  cam = new PeasyCam(this, 400);
  gfx=new ToxiclibsSupport(this);
  wemesh=new WETriangleMesh();
  generate();
}


void draw() {
  background(0);
  noFill();
  for (Branch b : branches) {
    b.render();
  }
  strokeWeight(0.5);
  fill(255, 150);
  stroke(255, 150);
  gfx.mesh(wemesh);
  noFill();
  box(250);
}


//generate a tree 
void generate() {
  branches = new ArrayList<Branch> ();
  Branch b = new Branch(new Vec3D(0, 0, -125), new Vec3D(0, 0, 17), 15, 0);
  branches.add(b);
  b.grow();
}


void keyPressed() {
  if (key=='s') {
    saveFrame("recursive"+random(200)+".jpg");
  }
  else if (key=='b') {
    brushIt();
  }
  else if (key=='r') {
    generate();
  }
  else if (key == 'l' || key == 'L') {
    new LaplacianSmooth().filter(wemesh, 1);
  }
  else if (key == 'e' || key == 'E') {
    try {
      String fileID="tree-"+(System.currentTimeMillis()/1000);
      FileOutputStream fs;
      fs=new FileOutputStream(sketchPath(fileID+".stl"));
      wemesh.saveAsSTL(fs, false);
      fs=new FileOutputStream(sketchPath(fileID+".obj"));
      wemesh.saveAsOBJ(fs);
    } 
    catch(Exception e) {
      e.printStackTrace();
    }
    // exit();
  }
}

//make a mesh around the tree
void brushIt() {
  volume=new VolumetricSpaceArray(SCALE, DIMX, DIMY, DIMZ);
  brush=new RoundBrush(volume, SCALE.x/2);
  surface=new ArrayIsoSurface(volume);  
  wemesh=new WETriangleMesh();
  
  Vec3D v;
  for (Branch b : branches) {
    //map the depth of recursion to the brushsize
    float d = map(b.d, 0, 15, 1, 4);
    brush.setSize(d);     
    //brush.setSize(2);
    
    //get end point of branch
    Vec3D ept = b.pt.copy().add(b.v.copy());
    
    //interpolate between start and end point using lerp
    for (float i=0; i<1; i+=0.05) {     
      float x = lerp(b.pt.x, ept.x, i);
      float y = lerp(b.pt.y, ept.y, i);
      float z = lerp(b.pt.z, ept.z, i);
      v = new Vec3D(x, y, z);
      
      //draw at along the branch
      brush.drawAtAbsolutePos(v, density);
    }
  }
  
  //close the volume and generate mesh
  volume.closeSides();  
  surface.reset();
  surface.computeSurfaceMesh(wemesh, ISO_THRESHOLD);
}

