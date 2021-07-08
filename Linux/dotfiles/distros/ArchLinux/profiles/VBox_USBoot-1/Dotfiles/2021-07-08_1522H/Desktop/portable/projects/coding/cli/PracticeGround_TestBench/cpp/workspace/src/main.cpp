/*
 * PracticeGround & TestBench Utility
 * Project Name: PracticeGround_TestBench [CLI]
 * Code Name: Proj Automaton
 * Author: Asura
 * Created by: 2021-04-20 15:30H, Asura
 * Modified by: 
 *      2021-04-20 1530H : Asura
 *      2021-04-21 0959H : Asura
 *      2021-04-21 1147H : Asura
 *      2021-04-24 0842H : Asura
 *      2021-05-11 1220H : Asura
 * Changelogs: 
 *      2021-04-20 1530H : Created source file
 *      2021-04-21 0959H : 
 *          Created class 'Debug'
 *          Created subclasses 'Debug' > 'Tools'
 *          Created functions [split, strip_filename, strip_ext, strip_path]
 *          Created #define DEBUG
 *      2021-04-21 1147H : 
 *          Created class 'GUI'
 *      2021-04-24 0842H : 
 *          - Copied and moved current (now previous) release with the class 'GUI' to a seperate project workspace for GUI programming PracticeGround/TestBench folder
 *              - That folder will be the GUI-based release
 *              - This folder will be the CLI-based release
 *          - Removed class 'GUI' from current release
 *          - Focus on CLI
 *          - Differences between this and GUI variant:
 *              - GUI release/version may contain functions added into/removed from this CLI library depending on update schedule 
 *              - CLI release/version will contain CLI functions added into the GUI project if applicable
 *          - Potential changes may be made if developments towards GUI frameworks-as-a-Library are made.
 *              > At the moment, because using GUI frameworks (i.e. Widgets) are not possible/working when used as a Library,
 *                  this will be seperated for code efficiency maximization.
 *      2021-05-11 1220H :
 *      	- Changed documentations
 *      	- Created a "extlib.h" header file
 *      	- Transferred all internal functions as of this update to extlib.h
 */


/* C Libraries */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* C++ Libraries */
#include <iostream> // Input Output Stream Utility
#include <fstream>  // Both Read & Write File Stream Utility
#include <string>
#include <cstdlib>
#include <cstdio>
#include <unistd.h> // For POSIX; constants etc.
#include <sys/stat.h>
using std::cout;
using std::cin;
using std::endl;
using std::string;
using std::to_string;
using std::getline;
using std::ofstream; // Output File Stream; Write-only
using std::ifstream; // Input File Strem; Read-only
using std::ios;      // For ios::append, ios::write, ios::read, ios::trunc etc.   

/* Definitions */
#define NEWLINE endl
#define ENDLINE ;
#define REDIR_IN <<     //Redirect In
#define REDIR_OUT >>    //Redirect Out
#define PIPE |
#define AND &&
#define OR  ||
#define START_CODE  {
#define END_CODE    }
#define START_PARAM (
#define END_PARAM   )
#define RETURN_NULL void
#define RUN_MODE    "Debug"    // Runtime mode: {'Debug' : For Debugging mode, 'Release' : For Release mode}

/* Functions */
#include "extlib.h"

/* Classes */
class Debug
{
    /*
     * Debug Class
     */
    private:
    public:
        // Global Variables
        string cs_Name = "";
        string run_mode = RUN_MODE;

        // Functions
        Debug()
        {
            // Constructor
            cs_Name = "Debug";
            run_mode = RUN_MODE;
            cout << cs_Name << " " << "linked." << endl;

            // Startup Message
            if (RUN_MODE == "Debug")
            {
                cout << "RUNTIME Mode: " << "DEBUG ENABLED" << endl;
            }
            else if (RUN_MODE == "Release")
            {
                cout << "RUNTIME Mode: " << "RELEASE" << endl;
            }
        }
        ~Debug()
        {
            // Destructor
            cout << cs_Name << " " << "unlinked." << endl;
        }
        void print_runtime_mode()
        {
            if (run_mode == "Debug")
            {
                cout << "[DEBUG]" << endl;
            }
            else if (run_mode == "Releae")
            {
                cout << "[RELEASE]" << endl;
            }
        }

        // Classes
        class Tools
        {
            /*
             * Debugging Tools
             */
            private:
            public:
                // Global variables
                
                // Functions
                
                // Classes
        };
};

class PracticeGround
{
    private:
    public:
        // Global Variables
        string cs_Name = "";

        // Functions
        PracticeGround()
        {
            // Constructor
            cs_Name = "PracticeGround";
            cout << cs_Name << " " << "linked." << endl;
        }
        ~PracticeGround()
        {
            // Destructor
            cout << cs_Name << " " << "unlinked." << endl;
        }
        void HelloWorld()
        {
            cout << cs_Name << "!" << endl;
        }
};

class TestBench
{
    private:
    public:
        // Global Variables
        string cs_Name = "";

        // Functions
        TestBench()
        {
            // Constructor
            cs_Name = "TestBench";
            cout << cs_Name << " " << "linked." << endl;
        }
        ~TestBench()
        {
            // Destructor
            cout << cs_Name << " " << "unlinked." << endl;
        }
        void HelloWorld()
        {
            cout << cs_Name << "!" << endl;
        }
};



int main(int argc, const char *argv[])
{
    /* --- Startup/Initialization */
  
    /*
     *  Input
     */

    /* Local Variables */

    // Integer Variables
    int exit_Code = 0;

    // String variables
    string reply = "";
    string line = "";
    string out_File = "";

    // Other variables
    ofstream fwrite;

    // Initialize Classes
    PracticeGround pg;
    TestBench tb;
    Debug debugger; // IF run mode is 'debug'; To initialize Debug

    /*
     * Processing 
     */
    cout << endl;

    // Print all command line variables
    cout << "Your command line arguments: " << endl;
    for(int i = 0; i < argc; i++)
    {
        cout << "   " << to_string(i) << " : " << argv[i] << endl;
    }

    // Get Command Line Variables
    if( argc > 1)
    {
        // Size is more than 1
        // Get output file name (Argument [1])
        out_File = argv[1];
    }
    else
    {
        // Default values
        out_File = "resources/out/out.txt";
    }

    // Validation: Check if folder exists
    string file_name = split(out_File, "name"); // Extract the file name from out_File
    string fldr_Path = split(out_File, "path"); // Extract the intended filter from out_File
    // Debug
    if(RUN_MODE == "Debug")
    {
        // cout << "[DEBUG]" << endl;
        debugger.print_runtime_mode();
        cout << "File Name: " << file_name << endl;
        cout << "Folder Path: " << fldr_Path << endl;
    }
    bool fldr_Exists = chk_path_Exists(fldr_Path);
    if( fldr_Exists == 0 )
    {
        // Folder does not exist
        // Create
        string cmdstr="mkdir -p " + fldr_Path;
        autocmd(cmdstr);
    }

    // cout << endl;
    print("", true);

    cout << "Hello World!" << endl;
    print_Help();

    /* Preparations */
    // Write newline to file
    fwrite.open(out_File, ios::out|ios::app);
    fwrite << "\n";
    fwrite.close();
    
    // While Loop
    while( exit_Code != 1 )
    {
        // Codes to run
        // while havent quit
        /*  
         *  - can be used as 
         *    - a notebook
         *    - Line recorder
         *    - Recording program
        */
        line = get_msg("> ");
        if (line.length() > 0)
        {
            cout << "   Your input: " << line << endl;

            // Optional Commands to execute
            // { ^c : quit, ^h : help} etc.
            if( line == "^c" )
            {
                // Exit
                reply = get_msg("Please enter 'q' to confirm quit: ");
                if (reply == "q")
                {
                    exit_Code = 1;
                }
                else
                {
                    cout << "Quit cancelled." << endl;
                }
            }
            else if ( line == "^h")
            {
                // Help Menu
                print_Help();
            }
            else
            {
                /* Write to file
                 * - Open File
                 * - Write to File
                 * - Close File
                 */
                fwrite.open(out_File, ios::out|ios::app);
                fwrite << line << "\n";
                fwrite.close();
            }
        }
        else
        {
            cout << "   No Input" << endl;
        }
    }

    /*
     * Sanitization and Cleaning up
     */
    cout << endl << "Sanitizing and Cleaning up..." << endl;
    sanitization();
    cout << endl;

    /*
     * Output
     */
    return exit_Code;
}


