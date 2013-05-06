//simple recursive branch
class Branch {
  Vec3D pt, newPt; 
  Vec3D v, newV;
  int d;
  Branch child;
  int id;

  Branch(Vec3D pt, Vec3D v, int d, int id) {
    this.pt = pt; 
    this.v = v;
    this.d = d;
  }
  //actual recursive part
  void grow() {
    d--;
    if (d>0) {
      boolean chk = true;
      int count = 0;
      if (random(1)<1.0) {
        newPt = pt.add(v);
        newV = v.copy();
        float m = v.magnitude();
        newV.addSelf(new Vec3D(random(-10, 10), random(-10, 10), random(0, 20)));
        //newV.addSelf(new Vec3D(0, 0, random(20)));
        newV.scaleSelf(random(0.3, 0.8)); 
        //newV.limit(m*0.95); 
        child = new Branch(newPt, newV, d, 0);
        child.grow();
        branches.add(child);
      }
      if (random(1)<0.4) {
        newPt = pt.add(v);
        newV = v.copy();
        float m = v.magnitude();
        newV.addSelf(new Vec3D(random(-20, 20), random(-20, 20), random(-10, 20)));    
        newV.scaleSelf(random(0.3, 0.8)); 
        //newV.limit(m*0.99);
        child = new Branch(newPt, newV, d, 0);
        child.grow();
        branches.add(child);
      }
    }
  }

  void render() {
    stroke(255-d*15);
    strokeWeight(d);
    line(pt.x, pt.y, pt.z, pt.add(v).x, pt.add(v).y, pt.add(v).z);
  }
}

