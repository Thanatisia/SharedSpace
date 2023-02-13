/*
Header file name: extlib.h
Created: 2021-05-11 1226H
Modified: 
	2021-05-11 1226H, Asura
Containing: 
	All functions to be used by main.cpp and
	All useful functions
*/

void void_func()
{

}

int int_func()
{
        int res = 0;
        return res;
}

char char_func()
{
        char res = 'a';
        return res;
}


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




