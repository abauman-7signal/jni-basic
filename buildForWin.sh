#!/bin/sh

function createHeaderForNativeInterface() {
  javac -h . HelloWorld.java
}

function buildNativeLibrary() {
  gcc -v -D __int64="long long" -fPIC -Wall -Wl,--add-stdcall-alias -shared -lc -I. -I"${JAVA_HOME}\include" -I"${JAVA_HOME}\include\win32" -o HelloWorld.dll HelloWorld.cpp
}

function buildJniLibrary() {
  javac HelloWorld.java
}

createHeaderForNativeInterface
buildNativeLibrary
buildJniLibrary
