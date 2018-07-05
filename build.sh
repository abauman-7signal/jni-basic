#!/bin/bash

function createHeaderForNativeInterface() {
  javah -jni HelloWorld
}

function buildNativeLibrary() {
  g++ -I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/ -c HelloWorld.cpp -o HelloWorld.o
  g++ -dynamiclib -o libhelloworld.jnilib HelloWorld.o
}

function buildJniLibrary() {
  javac HelloWorld.java
}

#function packageLibraryIntoJar() {
#  cp build/lib/libhelloworld.jnilib build/com/sevensignal/helloworld
#  jar -cf build/helloworld.jar -C build com/sevensignal/helloworld
#}

#function buildFunctionalTest() {
#  javac -cp build/helloworld.jar:. -d build functional-test/java/com/sevensignal/mosfunctionaltester/TestJni.java
#}

createHeaderForNativeInterface
buildNativeLibrary
buildJniLibrary
#packageLibraryIntoJar
#buildFunctionalTest
