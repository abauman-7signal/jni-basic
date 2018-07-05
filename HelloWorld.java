public class HelloWorld {

  static {
    System.loadLibrary("HelloWorld");
  }

  public native void print();

  public static void main(String[] argv) {
    new HelloWorld().print();
  }
}
