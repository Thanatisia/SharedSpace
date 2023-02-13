/*
 * PracticeGround & TestBench Utility
 * Project Name: PracticeGround_TestBench [GUI]
 * Code Name: Proj Automaton X
 * Author: Asura
 * Created by: 2021-04-20 15:30H, Asura
 * Modified by: 
 *      2021-04-20 1530H : Asura
 *      2021-04-21 0959H : Asura
 *      2021-04-21 1147H : Asura
 *      2021-04-24 0842H : Asura
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
 *          - Copied and moved from the current release with the class 'GUI' to this seperate project workspace for 
 *              GUI programming PracticeGround/TestBench folder
 *              - This folder will be the GUI-based release
 *              - That folder will be the CLI-based release
 *          - Focus on GUI
 *          - Differences between this (GUI) and CLI variant:
 *              - GUI release/version may contain functions added into/removed from this CLI library depending on update schedule 
 *              - CLI release/version will contain CLI functions added into the GUI project if applicable
 *          - Potential changes may be made if developments towards GUI frameworks-as-a-Library are made.
 *              > At the moment, because using GUI frameworks (i.e. Widgets) are not possible/working when used as a Library,
 *                  this will be seperated for code efficiency maximization.
 * TODO:
 *      2021-04-24 0853H:
 *          - Recreate the below main function to use wxWidget functions for the time being 
 *              - May change from wxWidgets to other frameworks if required.
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

/* GUI External Libraries
 * For compilers that support precompilation, include "wx/wx.h" 
 */
// wxWidgets Libraries
#include <wx/wxprec.h>
#include <wx/string.h>
#include <wx/init.h>
#ifndef WX_PRECOMP
    #include <wx/wx.h>
#endif

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

/* Return 'boolean' functions */
bool chk_path_Exists(const string &path)
{
    /*
     * Checks if path exists
     * - Returns '0' if it doesnt exist
     * - Returns '1' if it exists
     */
    struct stat buffer;

    // Use 'stat' to access the path and check with the buffer
    // If it exists
    return (stat(path.c_str(), &buffer) == 0);
}

/* Return 'string' functions */
string get_msg(string out_msg)
{
    // Get user input
    string line="";
    cout << out_msg;
    getline(cin, line); 
    return line;
}

bool compare_str(string src, string keyword)
{
    /*
     * Checks if keyword is in the string
     * ::Params
     *  src
     *      Type: String
     *      Desc: Target/Source string
     *      Usage
     *  keyword
     *      Type: String
     *      Desc: Keyword to check with the string
     */

    /* Input */
    bool ret_code = false;
    int found = 0;

    /* Processing */
    found = src.find(keyword);
    if(found != string::npos)
    {
        // Exists
        ret_code = true;
    }

    /* Output */
    return ret_code;
}

string strip_filename(string src)
{
    /*
     * Strips the filename from a path string
     * ::Params
     *  src
     *      Type: String
     *      Desc: The source path string to split
     */
    /* Input */
    // Variables
    string res = "";

    /* Processing */
    
    // Remove directory if present
    // Do this before extension removal incase directory has a period character.
    const size_t last_slash = src.find_last_of("\\/");
    if(string::npos != last_slash)
    {
        src.erase(0, last_slash + 1);
    }
    
    // Remove Extension if present
    const size_t period = src.rfind('.');
    if ( string::npos != period )
    {
        src.erase(period);
    }
    
    /* Output */
    res = src;

    return res;
}

string strip_ext(string src)
{
    /*
     * Strips the extension from a path string
     * ::Params
     *  src
     *      Type: String
     *      Desc: The source file string
     */

    /* Input */

    /* Processing */
    
    // Remove directory if present
    // Do this before extension removal incase directory has a period character.
    const size_t last_period = src.find_last_of(".");
    if(string::npos != last_period)
    {
        src.erase(0, last_period + 1);
    }
/*    
    // Remove Extension if present
    const size_t period = src.rfind('.');
    if ( string::npos != period )
    {
        src.erase(period);
    }
 */

    /* Output */
    return src;
}

string strip_path(string src)
{
    /*
     * Strips the filepath from a path string
     * ::Params
     *  src
     *      Type: String
     *      Desc: The source file string
     */

    /* Input */

    /* Processing */
    
    // Find last period
    const size_t last_period = src.find_last_of("/\\/");
    if(string::npos != last_period)
    {
        // Found last period
        // src.erase(0, last_period + 1);
        src.erase(last_period);
    }
/*    
    // Remove Extension if present
    const size_t period = src.rfind('.');
    if ( string::npos != period )
    {
        src.erase(period);
    }
 */

    /* Output */
    return src;
}

string split(string src, string filter)
{
    /*
     * ::Params
     *  src
     *      Type: String
     *      Desc: The source file path you want to split
     *      Usage:
     *          split("/path/to/file.extension")
     *  filter
     *      Type: String
     *      Desc: The Filter you want to extract from the source
     *      Usage: 
     *          'path' : Extract the path from a source
     */

    /* Input */
    // Initialize
    string res = "";

    /* Process */
    if(filter == "path")
    {
        //res = filesystem.path.absolute(src);
        res = strip_path(src);
    }
    else if(filter == "name")
    {
        res = strip_filename(src);
    }
    else if(filter == "extension")
    {
        res = strip_ext(src);
    }

    /* Output */
    return res;
}

/* Return 'void' functions */
void print(string msg="", bool newline=false)
{
    /*
     * print() function
     */
    if(newline)
    {
        cout << msg << endl;
    }
    else
    {
        cout << msg;
    }
}

void print_Help()
{
    // Print Help menu
    cout << "Please enter" << endl;
    cout << "   " << "'^c' to quit" << endl;
    cout << "   " << "'^h' to print help" << endl;
}

void sanitization()
{
    // Sanitize all global variables 
    // and Clean-up garbage via garbage collection
    cout << "Sanitization complete." << endl;
}

int autocmd_int(string cmdstr)
{
    /*
     * A auto-command executor wrapper 
     * to execute system commands using system()
     *  Returns retCode (int type)
     */
    const char *cmd = cmdstr.c_str();
    int retCode = 0;
    retCode = system(cmd);
    return retCode;
}

void autocmd(string cmdstr)
{
    /*
     * A auto-command executor wrapper 
     * to execute system commands using system()
     *  - Just execute, does not return
     */
    const char *cmd = cmdstr.c_str();
    system(cmd);
}

string autocmd_str(string cmdstr)
{
    /*
     * A auto-command executor wrapper 
     * to execute system commands using system()
     *  Returns retCode (int type)
     */
    const char *cmd = cmdstr.c_str();
    string retstr = "";
    retstr = system(cmd);
    return retstr;
}

void multicmd()
{
    /*
     * A auto-command executor (same as autocmd()) that 
     * executes multiple commands through the following seperators
     *  && : For Success
     *  || : For Error
     *  &  : Back-to-Back execution
     * via system()
     */
    
}

/* Classes */
class GUI
{
    /*
     * GUI Class - for GUI-based utilities, tools, widgets etc.
     */
    private:
    public:
        // Global Variables
        string cs_Name = "";
        
        // Functions
        GUI()
        {
            // Constructor
            class_startup();

            cout << cs_Name << " " << "linked." << endl;
        }
        ~GUI()
        {
            // Destructor
            cout << cs_Name << " " << "unlinked." << endl;
        }
        void initialize()
        {
            /*
             * Initialize
             *  Variables
             *  Classes
             */
            cs_Name = "GUI";
        }

        void class_startup()
        {
            /*
             * Startup
             *  - Initialize
             */
            initialize();
        }
        
        // Classes
        class frameworks
        {
            private:
            public:
                // Global Variables
                string cs_Name = "";

                // Functions
                frameworks()
                {
                    /*
                     * Constructor 
                     */
                    class_startup();
                    cout << cs_Name << " " << "linked." << endl;
                }

                ~frameworks()
                {
                    /*
                     * Destructor 
                     */
                    cout << cs_Name << " " << "unlinked." << endl;
                }

                void initialize()
                {
                    /*
                     * Initialize
                     *  Variables
                     *  Classes
                     */
                    cs_Name = "Frameworks";
                }

                void class_startup()
                {
                    /*
                     * Startup
                     *  - Initialize
                     */
                    initialize();
                }
                
                // Classes
                class wxwidget
                {
                    private:
                    public:
                        // Global Variables
                        string cs_Name = "";
                        wxInitializer wxInit;

                        // Functions
                        wxwidget()
                        {
                            /*
                             * Constructor
                             */
                            class_startup();
                            cout << cs_Name << " " << "linked." << endl;
                        }
                        ~wxwidget()
                        {
                            /*
                             * Destructor
                             */
                            cout << cs_Name << " " << "unlinked." << endl;
                        }
                        int initialize()
                        {
                            /*
                             * Initialize
                             *  Variables
                             *  Classes
                             */
                            cs_Name = "wxwidgets";

                            // Validate Initialization
                            if(!wxInit)
                            {
                                fprintf(stderr, "   Failed to initialize the wxWidgets library");
                                return -1;
                            }
                            else
                            {
                                cout << "   Successfully initialized the wxWidgets library" << endl;
                                return 1;
                            }
                        }
                        void class_startup()
                        {
                            /*
                             * Startup
                             *  - Initialize
                             */
                            initialize();
                        }
                        void setup()
                        {
                            /*
                             * Framework setup checks
                             * 1. Install Pre-Requisites:
                             *     Linux: wxgtk
                             *      1.1. Check if wxgtk exists:
                             *         1.1.1. If not: Download Git
                             *            git clone --recurse-submodules https://github.com/wxWidgets/wxWidgets.git
                             *         1.1.2. mkdir buildgtk
                             *         1.1.3. cd buildgtk
                             *         1.1.4. ../configure --with-gtk
                             *         1.1.5. make
                             *         1.1.6. sudo make install (permanent)
                             *         1.1.7. ldconfig
                             *     Windows: native wxMSW
                             *     MacOS: wxOSX
                             * 2. Test build 
                             *      g++ mysrc.cpp `wx-config --libs --cxxflags` -o myout.exe
                             * 3. Ensure that 'wx-config' works
                             */
                            int ret_code = autocmd_int("wx-config --version");
                            if(ret_code == 1)
                            {
                                // Error
                                string cmd_str = "\
                                mkdir -p ~/Desktop/git;\
                                cd ~/Desktop/git &&\
                                git clone --recurse-submodules http://github.com/wxWidgets/wxWidgets.git &&\
                                cd wxWidgets &&\
                                mkdir buildgtk &&\
                                cd buildgtk &&\
                                ../configure --with-gtk &&\
                                make &&\
                                sudo make install &&\
                                ldconfig \
                                ";
                                ret_code = autocmd_int("echo " + cmd_str);
                                cout << "Command: " << to_string(ret_code) << endl;
                            }
                            else
                            {
                                // Success

                            }
                        }
                        void HelloWorld()
                        {

                        }   
                        void test_str()
                        {
                            // Test wxWidget

                            // 1. wxString (wx/string.h)
                            wxString str1 = wxT("Linux");
                            wxString str2 = wxT("Operating");
                            wxString str3 = wxT("System");
                            wxString emptystr = wxT(" ");
                            
                            wxString str = str1 + emptystr + str2 + emptystr + str3;

                            wxPuts(str);
                        }
                        void test_int()
                        {
                            int flowers = 21;
                            wxString str = "";
                            wxString newline = "\n";
                            str.Printf(wxT("There are %d red roses."), flowers);
                            wxPuts("Test" + str + newline);
                        }
                };
        }; 
};

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



//int main(int argc, const char *argv[])
int main(int argc, char **argv)
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
    GUI gui;
    GUI::frameworks gui_Frameworks;
    GUI::frameworks::wxwidget wx;

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

    // GUI Test
    print("Testing wxWidget");
    wxInitializer wxInit;
    if(wxInit != -1)
    {
        cout << endl << "Success" << endl;
        
        // Start program
        int flowers = 21;
        wxString str;
        str.Printf(wxT("There are %d red roses."), flowers);
        wxPuts(str);
    }
    else
    {
        cout << "Error" << endl;
    }

    print("", true);

    cout << "Hello World!" << endl;
    print_Help();
    
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


