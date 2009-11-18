// -*- c-basic-offset : 4 -*-

#include <Analysis.h>

#include <iostream>

using namespace std;

int main(int argc, char *argv[]) {

    Analysis *checker = NULL;

    if ( argc != 2 ) {
        cout << "usage:  analysis FILENAME" << endl;
        return -1;
    }

    checker = new Analysis(argv[1]);

    checker->compute();
    checker->analyse();

    delete checker;
}
