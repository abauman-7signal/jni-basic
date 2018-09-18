#!/bin/sh

MODULE=HelloWorld

function displayMessage() {
  echo --------------------------------------------------
  echo "  ${1}"
  echo --------------------------------------------------
}

function processStatusOfLastCommand() {
  if [ $? -ne 0 ] ; then
    echo "F A I L E D"
    exit 1
  fi
}

function createHeaderForNativeInterface() {
  displayMessage "C R E A T I N G    J N I    H E A D E R  =>  ${MODULE}"
  javac -verbose -h . ${MODULE}.java
  processStatusOfLastCommand
}

function buildNativeLibrary() {
  displayMessage "B U I L D I N G    D L L  =>  ${MODULE}"
  gcc -v -D__int64="long long" -Wall -Wl,--add-stdcall-alias -shared -I. -I"${JAVA_HOME}\include" -I"${JAVA_HOME}\include\win32" -o ${MODULE}.dll ${MODULE}.cpp
  processStatusOfLastCommand
}

function buildJniLibrary() {
  displayMessage "B U I L D I N G    J A V A    A P P  =>  ${MODULE}"
  javac -verbose ${MODULE}.java
  processStatusOfLastCommand
}

createHeaderForNativeInterface
buildNativeLibrary
# buildJniLibrary
