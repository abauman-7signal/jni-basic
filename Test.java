
public class Test {

  static {
    System.out.printf("Loading HelloWorld library...\n");
    System.loadLibrary("HelloWorld");
  }

  public native void print();

  public static void main(String[] argv) {
    System.out.printf("Invoking JNI method...\n");
    new HelloWorld().print();
  }
}
