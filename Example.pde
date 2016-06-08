import java.util.Arrays;
import java.util.*; 
import java.util.ArrayList;

    
abstract class Vector3Abstract implements Cartesian4Interface {
    
    public static final int X = 0;
    public static final int Y = 1;
    public static final int Z = 2;
    
    public float vector[] = new float[] {0,0,0};
    public void Vector3Abstract(){}
    
    /* the following are "concrete methods" */
    // Getter methods
    public float x(){ return this.vector[X]; }
    public float y(){ return this.vector[Y]; }
    public float z(){ return this.vector[Z]; }
    public float w(){ return 1.0;}
    
    // Setter methods
    public void x(float x){ this.vector[X] = x; }
    public void y(float y){ this.vector[Y] = y; }
    public void z(float z){ this.vector[Z] = z; }
    public void w(float w){ }
    
    public String toString()
    {
      return this.vector.toString();
    }
    
}

  class Point3d extends Vector3Abstract implements Cartesian4Interface, GeometryDrawable{
    public Point3d (float x, float y, float z){
      // use the setter methods
      this.x(x);
      this.y(y);
      this.z(z);
    }
    public Point3d add(Cartesian4Interface other){
      return new Point3d(this.x() + other.x(), this.y() + other.y(), this.z() + other.z());
    }
    
    public void draw(){}
    
    /*static Random(float scale){
      return new Point3d(random(-scale, scale), random(-scale, scale), random(-scale, scale)); 
    }*/
  }
  
  class Triangle implements GeometryDrawable{
    
    // declare an emtpy Array of 3 points, that will only except Point3d Objects
    public final Point3d[] points; // note I've made it public and final
    // instance method
    public Triangle(Point3d a, Point3d b, Point3d c){
      this.points = new Point3d[] {a,b,c};
    }
    public void draw(){}
    
    public String toString()
    {
      return this.points.toString();
    }
    
    /*public static Random(float scale){
     return new Triangle(Point3d.Random(scale), Point3d.Random(scale),Point3d.Random(scale) );  
    }*/
  }
  
  class Mesh implements GeometryDrawable{
    // an ArrayList Allows you to add Elements, 
    private ArrayList <Triangle> trianglesList = new ArrayList <Triangle>();
    public void draw(){}
    
    public void addTriangle (Triangle triangle){
      this.trianglesList.add( triangle );
    }
    
    //An Array in Java is much easier to use than a List, so we'll convert
    public Triangle[] triangles()
    {
      int len = this.trianglesList.size();
      Triangle[] trianglesArray = new Triangle[len];
      
      // now loop through all the triangles in the List and put them in the Array
      for (int i=0; i < len; i++){
        trianglesArray[i] = this.trianglesList.get(i);
      }
      
      return trianglesArray;
    }
    
    public String toString()
    {
      return this.triangles().toString();
    }
    
    
  }
  
  Mesh mesh = new Mesh();
  mesh.addTriangle( new Triangle( new Point3d(0,0,0), new Point3d(1,0,0), new Point3d(1,1,0) ) );
  print(mesh.triangles()[0] );