# C# - Compiling GUI Application Form from Command Line

## Components
### Compiler
- Windows
    - Used by Visual Studio
        + msbuild.exe (Previously; Deprecated)
        + [csc.exe](Windows/csc.md)
    - dotnet
        + dotnet
        + roslyn
- Linux
    + mono
    + dotnet sdk

## Setup
### Dependencies

### Pre-Requisites and Preparation
#### Windows
- Ensure that the compiler is recognized by the system path
    - Add the compiler's path into the system path
        - Temporarily
            + Using the '%PATH%' environment variable
                ```batchdos
                PATH=%PATH%;[compiler-path]
                ```
        - Permenantly
            - Using the environment variable setting
                + Open 'System Properties'
                + Click on the 'Advanced' Tab
                + Click on the 'Environment Variables' button
                - Under 'System Variables'
                    + Select the row 'Path'
                    + Append your path into the table
                    + Save
                + Restart command line

- To locate a list of all the available C# compilers in your system
    + There may be more than one installed on your system
    + The compilers will be installed under the 'Microsoft.NET' folder inside the 'WINDOWS' folder (found in the '%WINDIR%' environment variable)
    + Select the compiler of choice
    ```batchdos
    dir /s %WINDIR%\csc.exe
    ```

### Generating project filesystem structure
- C# GUI Application Form
    - Main Runner/Launcher
        + Example File Name: Program.cs
        ```cs
        using System;
        using System.Collections.Generic;
        using System.ComponentModel;
        using System.Drawing;
        using System.Threading.Tasks;
        using System.Windows.Forms;

        namespace Your_Project_Namespace
        {
            public class Your_Application_Name
            {
                /// <summary>
                /// The main entry point for the application.
                /// </summary>
                [STAThread]
                public static void Main()
                {
                    Application.EnableVisualStyles();
                    Application.SetCompatibleTextRenderingDefault(false);
                    Application.Run(new MyForm());
                }
            }
        }
        ```
    - Subsequent Application Forms
        - Form Frontend Class
            + Example File Name: form1.Designer.cs
            ```cs
            using System;
            using System.Collections.Generic;
            using System.ComponentModel;
            using System.Data;
            using System.Drawing;
            using System.Linq;
            using System.Text;
            using System.Threading.Tasks;
            using System.Windows.Forms;

            namespace Your_Project_Namespace
            {
                public partial class MyForm : Form
                {
                    /// <summary>
                    /// Required designer variable.
                    /// </summary>
                    private System.ComponentModel.IContainer components = null;
            
                    /// <summary>
                    /// Clean up any resources being used.
                    /// </summary>
                    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
                    protected override void Dispose(bool disposing)
                    {
                        if (disposing && (components != null))
                        {
                            components.Dispose();
                        }
                        base.Dispose(disposing);
                    }
            
                    #region Windows Form Designer generated code

                    /// <summary>
                    /// Required method for Designer support - do not modify
                    /// the contents of this method with the code editor.
                    /// </summary>
                    private void InitializeComponent()
                    {
                        /* 
                         * Place all your widgets and components to initialize here
                         */

                        // Initialize Widget variables here
                        this.button = new System.Windows.Forms.Button();
                        this.SuspendLayout();

                        // 
                        // Button
                        // 
                        this.button.Location = new System.Drawing.Point(98, 112);
                        this.button.Name = "button1";
                        this.button.Size = new System.Drawing.Size(75, 23);
                        this.button.TabIndex = 0;
                        this.button.Text = "Click Me";
                        this.button.UseVisualStyleBackColor = true;
                        this.button.Click += new System.EventHandler(this.btnClickThis_Click);
            
                        // 
                        // Form
                        // 
                        this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
                        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
                        this.ClientSize = new System.Drawing.Size(284, 261);
                        this.Controls.Add(this.button);
                        this.Name = "Form1";
                        this.Text = "Form1";
                        this.Load += new System.EventHandler(this.Form1_Load);
                        this.ResumeLayout(false);
                    }

                    #endregion
                    
                    private System.Windows.Forms.Button button;
                }
            }
            ```
        - Form Backend Class
            + Example File Name: form1.cs
            ```cs
            using System;
            using System.Collections.Generic;
            using System.ComponentModel;
            using System.Data;
            using System.Drawing;
            using System.Linq;
            using System.Text;
            using System.Threading.Tasks;
            using System.Windows.Forms;

            namespace Your_Project_Namespace
            {
                public partial class MyForm : Form
                {
                    public MyForm()
                    {
                        // Class Constructor
                        InitializeComponent();
                    }

                    ~MyForm()
                    {
                        // Class Destructor
                    }

                    private void Form1_Load(object sender, EventArgs e)
                    {
                        // On Form Page Load
                    }
                                
                    private void btnClickThis_Click(object sender, EventArgs e)
                    {
                        // On Button Click
                    }
                }
            }
            ```


## Compile steps
### Windows
#### Using the csc.exe compiler
- Useful Options
    + '/target:[output-file-type]' : Explicitly specify the targetted output file type to compile into
    + '/out:[output-file-name]' : Explicitly specify the output file name
    + '/nologo' : Remove logo

- Compile source into an executable
    - Information
        + This will compile your specified source files and output the executable binary in the folder
    - Compile
        ```cs
        csc.exe {options} [Main Runner/Launcher class file] [source-files ...]
        ```

- Compile using Response files (.rsp)
    - Information
        + Response files are used to set compiler options and directives, as well as to specify a set of source files to compile
        + Effectively, it is a build system/build configuration file you create and run directly instead of manually typing the csc options and files
    - Create a response file (.rsp) of any name
        + For example: hello.rsp
        ```
        {options}
        {options}
        ...
        [Main Runner/Launcher class file] [source-files] ...
        ```
    - Compile
        ```console
        csc @hello.rsp
        ```

### Linux
#### Using mono compiler

## Things to take note of

## Resources

## References
- Windows
    + https://tomasvera.com/programming/compiling-a-c-project-using-command-line-tools-tutorial
    + [MSDN - Command Line Building with csc.exe](http://msdn.microsoft.com/en-us/library/78f4aasd.aspx)
    + [MSDN - C# Compiler Options Listed by Category](http://msdn.microsoft.com/en-us/library/8a1fs1tb%28v=VS.71%29.aspx)
    + [Microsoft Learn - How to create a Windows Forms Application from the command line](https://learn.microsoft.com/en-nz/dotnet/desktop/winforms/how-to-create-a-windows-forms-application-from-the-command-line?view=netframeworkdesktop-4.8)
- Linux
    - 

## Remarks