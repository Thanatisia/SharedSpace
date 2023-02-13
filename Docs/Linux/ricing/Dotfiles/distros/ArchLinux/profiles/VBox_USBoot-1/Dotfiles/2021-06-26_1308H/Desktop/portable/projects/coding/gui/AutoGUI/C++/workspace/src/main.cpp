/*
 * Cross AutoGUI
 * Project Name: Proj Automaton 
 * Code Name: Code Alias
 * Author: Asura
 * Created by: 2021-05-11 1210H, Asura
 * Modified by: 
 *      2021-05-11 1210H, Asura
 * Changelogs: 
 *      2021-05-11 1210H, Asura :
 *      	Created Source file
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

/* External Libraries */

/* 
 * GUI Frameworks
 */
// wxWidgets
#include <wx/string.h>
#include <wx/wxprec.h>
#include <wx/crt.h>
#ifndef WX_PRECOMP
    #include <wx/wx.h>
#endif

/* Functions */


/* Classes */
class MyFrame : public wxFrame
{
    private:
    public:
        const wxString& gui_Title = "Hello wxWidgets";
        int gui_entry_Xaxis = 50;
        int gui_entry_Yaxis = 50;
        int gui_Width = 800;
        int gui_Height = 600;
        MyFrame() :
            // Import Class to describe the constructor
            wxFrame(
                    NULL, 
                    wxID_ANY, // ID of window
                    wxT("Hello wxWidgets"), // title bar
                    wxPoint(50,50), // starting x,y axis
                    wxSize(800,600) // Size of Window
            )
            {
                // Constructor
                wxPanel* mainPane = new wxPanel(this);
                wxBoxSizer* sizer = new wxBoxSizer(wxHORIZONTAL);

                // Add Widgets here 
                mainPane->SetSizer(sizer);
            }
};

class MyApp : public wxApp
{
    private:
        wxFrame* m_frame;
    public:
        // Events
        bool OnInit()
        {
            m_frame = new MyFrame();
            m_frame->Show();
            return true;
        }
};

int main(int argc, char **argv)
{
        cout << "Hello World!" << endl;

        for(int i=0; i < argc; i++)
        {
            cout << to_string(i) << " : " << argv[i] << endl;
        }

        //MyApp* app = new MyApp();
        //wxApp::SetInstance(app);
    
        wxPuts(wxT("A wxWidgets console application"));

		//return wxEntry(argc, argv);
}


