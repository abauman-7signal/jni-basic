#!/bin/sh

DLL_MODULE=HelloWorld
FUNCTIONAL_TEST=Test

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
  displayMessage "C R E A T I N G    J N I    H E A D E R    &    C L A S S  =>  ${DLL_MODULE}"
  javac -verbose -h . ${DLL_MODULE}.java
  processStatusOfLastCommand
}

function buildNativeLibrary() {
  displayMessage "B U I L D I N G    D L L  =>  ${DLL_MODULE}"
  gcc -v -D__int64="long long" -Wall -Wl,--add-stdcall-alias -shared -I. -I"${JAVA_HOME}\include" -I"${JAVA_HOME}\include\win32" -o ${DLL_MODULE}.dll ${DLL_MODULE}.cpp
  processStatusOfLastCommand
}

function buildJniLibrary() {
  displayMessage "B U I L D I N G    J A V A    T E S T  =>  ${FUNCTIONAL_TEST}"
  javac -verbose ${FUNCTIONAL_TEST}.java
  processStatusOfLastCommand
}

createHeaderForNativeInterface
buildNativeLibrary
buildJniLibrary
