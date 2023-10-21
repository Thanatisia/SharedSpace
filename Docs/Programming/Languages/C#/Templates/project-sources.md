# C# Project Source Templates

## CLI
- Simple C# source code
    - Explanations
        + 'using [Library]' : Import the libraries/modules
        - `namespace Your_Project_NameSpace`       : Specify your project's namespace; Each namespace may contain multiple applications
            - `public class Your_Application_Name` : Specify your application's name in the namespace
                - `public static void Main(string[] args)` : This is your main function (aka runner/launcher function); This is where the compiler will look at first on compile-time to begin figuring out where, what and how to compile
                    + string[] args : This contains a string array of undefined size containing your Command Line Arguments for CLI argument parsing
    ```cs
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    namespace Your_Project_NameSpace
    {
        public class Your_Application_Name
        {
            public static void Main(string[] args)
            {
                Console.WriteLine("{0} args specified", args.Length);
            }
        }
    }
    ```

## GUI
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

