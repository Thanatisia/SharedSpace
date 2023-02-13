/*
 * Program Title
 * Project Name: 
 * Code Name: 
 * Author: 
 * Created by: yyyy-mm-dd HH:MMH, <Author>
 * Modified by: 
 *      yyyy-mm-dd HHMMH : <Author>
 * Changelogs: 
 *      yyyy-mm-dd HHMMH : <Changes>
 * TODO:
 *      yyyy-mm-dd HHMMH : <tasks>
 */

/* C Libraries */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* C++ Libraries */
#include <iostream>
#include <string>
#include <cstdlib>
#include <cstdio>
using std::cout;
using std::cin;
using std::endl;
using std::string;
using std::to_string;

int main(int argc, const char *argv[])
{
        cout << "Hello World!" << endl;

        for(int i=0; i < argc; i++)
        {
            cout << to_string(i) << " : " << argv[i] << endl;
        }

        return 1;
}

