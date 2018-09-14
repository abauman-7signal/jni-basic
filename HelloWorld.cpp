#include <stdio.h>
#include "HelloWorld.h"

JNIEXPORT void JNICALL
Java_HelloWorld_print(JNIEnv *, jobject){
    printf("Oh JNI, how cumbersome you are!\n");
    return;
}
