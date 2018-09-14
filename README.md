### Running native code in Java
Uses JNI to call a library that implements code that runs on the native platform.

Based on http://mrjoelkemp.com/2012/01/getting-started-with-jni-and-c-on-osx-lion/.

The above example starts with the Java class that contains a method declared to be
a native interface to the platform. The example then uses a Java command line tool
to generate a C++ header that declares the method signature that needs to be
implemented in C++. The C++ code was then added followed by compiling and linking
the code to create the `.jnilib`.


### Prerequisites
* JDK is installed
* GNU g++ is installed. This was already the case since I was developing on a Mac.


### Building the Simplified Project
    $ ./build.sh


### Running the Simplified Project
    $ java HelloWorld

should print the following to standard out: `Oh JNI, how cumbersome you are!`


### Getting it to work by compiling from cygwin for Windows

It required changes to the build.sh script so created a new build script for Windows.

Used the following tutorial to help: https://www3.ntu.edu.sg/home/ehchua/programming/java/JavaNativeInterface.html

To build (from cygwin command prompt):
1. invoke `./buildForWin.sh`

To run (from Windows command prompt -- NOT cygwin):
1. copy `cygwin1.dll` to this folder
2. invoke: `java -cp .\ -Djava.library.path=.\ HelloWorld`
