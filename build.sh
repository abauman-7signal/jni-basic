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

createHeaderForNativeInterface
buildNativeLibrary
buildJniLibrary
