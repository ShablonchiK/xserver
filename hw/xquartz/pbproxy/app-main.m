/* app-main.m
 $Id: main.m,v 1.29 2007-04-07 20:39:03 jharper Exp $
 
 Copyright (c) 2002, 2008 Apple Computer, Inc. All rights reserved. */

#include "pbproxy.h"
#import "x-selection.h"

#include <pthread.h>
#include <unistd.h> /*for getpid*/
#include <Cocoa/Cocoa.h>

static void signal_handler (int sig) {
    _exit(0);
}

int main (int argc, const char *argv[]) {
    printf("pid: %u\n", getpid());
    
    x_init ();
    
    signal (SIGINT, signal_handler);
    signal (SIGTERM, signal_handler);
    signal (SIGPIPE, SIG_IGN);

    [NSApplication sharedApplication];
    [NSApp run];
    
    return 0;
}