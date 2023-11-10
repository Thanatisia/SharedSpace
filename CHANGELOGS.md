# CHANGELOGS

## Table of Contents
> [date       time, author, Notes]
+ [2021-05-23 2154H, Asura, v0.1.0](#2021-05-23-2154H)
+ [2021-05-23 2220H, Asura, v0.2.0](#2021-05-23-2200H)
+ [2021-05-23 2322H, Asura, v0.3.0](#2021-05-23-2322H)
+ [2023-10-14 1150H, Asura](#2023-10-14-1150H)
+ [2023-10-21 2136H, Asura](#2023-10-21-2136H)
+ [2023-10-22 2232H, Asura](#2023-10-22-2232H)
+ [2023-10-24 1105H, Asura](#2023-10-24-1105H)
+ [2023-10-31 2322H, Asura](#2023-10-31-2322H)
+ [2023-11-05 1556H, Asura](#2023-11-05-1556H)
+ [2023-11-06 1549H, Asura](#2023-11-06-1549H)
+ [2023-11-06 1559H, Asura](#2023-11-06-1559H)
+ [2023-11-06 1637H, Asura](#2023-11-06-1637H)
+ [2023-11-08 1747H, Asura](#2023-11-08-1747H)
+ [2023-11-09 1631H, Asura](#2023-11-09-1631H)
+ [2023-11-09 2044H, Asura](#2023-11-09-2044H)
+ [2023-11-10](#2023-11-10)

## Version History
```
Version Syntax : Update yyyy-mm-dd HHMM(H), Author
```

### 2021-05-23 2154H
- Created 
    - README
- Added 
    - Basic Information (Description)
    - To Note

### 2021-05-23 2200H
- Added 
  - Documentations
      - Getting Started
      - Help
  - Authors
  - Version History (Changelogs)
  - License
  - Acknowledgements

### 2021-05-23 2322H
- Added
  - Documentations
    - Folders
- Modified
  - Indentation of [Documentations]
    - "<h3></h3>" to "###" 

- v0.3.1, 2021-06-15 2004H, Asura
    - Modified
      - Added new method to download individual files

- v0.3.2, 2021-06-25 1245H, Asura
    - Modified
      - Seperated 'wget' and 'curl'

- v0.4.0, 2022-04-22 0926H, Asura
    - Initiated basic refactoring of Docs folder

- Update 2022-08-11 1013H, Asura
    - Refactored and updated the Version Syntax from *Version Syntax: <breaking>.<feature>.<fix>* => *Update yyyy-mm-dd HHMM(H), Author*
    - Performed general overhaul on Root directory README and in '~/Docs'
    - Created CHANGELOGS files in Root directory and '~/Docs'
    - Created folder 'Temporary' to store all temporary files to be moved within the pipeline   

- Update 2023-02-13 2338H, Asura
    ```
    - Added
        - Docs/Programming/Designing/program_designer.md : A Software Development Project Documentation template

    - Deleted
        - Files/
        - Linux/
        - Projects/
        - Scripts/
        - Windows/

    - Migrated
        - Files/PC Parts List.txt => Docs/Computers/Computer Hardware/PC Parts List.md
        - Files/Skeleton/CONTRIBUTING.md => Docs/Git/CONTRIBUTING.md
        - Files/Plans => Docs/Programming/Files/Plans
        - Linux/dotfiles => Docs/Linux/ricing/Dotfiles
        - Linux/scripts => Docs/Programming/Shellscript/My-Scripts
        - Projects/Programming/C/Practice_1 => Docs/Programming/Languages/C/Code-Snippets/HelloWorld
        - Projects/Programming/C++/autoutils => Docs/Programming/Languages/CPP/Code-Snippets/HelloWorld
        - Projects/Programming/Artificial Intelligence/ => Docs/Programming/Artificial Intelligence/Ideas
        - Projects/Programming/Template_Folder/C => Docs/Programming/Languages/C/Templates/Project structure/Project_Name
        - Projects/Programming/Template_Folder/C++ => Docs/Programming/Languages/CPP/Templates/Project structure/Project_Name
        - Projects/Scripting/Batch => Docs/Programming/Languages/Batch/Code-Snippets/Startup Workspace
        - Projects/Scripting/Python/Fiverr/csv_reader/ => Docs/Programming/Languages/Python/Examples/Code-Snippets/CSV-Reader
        - Projects/Scripting/Python/PersonalDBMS => Docs/Programming/Languages/Python/Examples/Code-Snippets/PersonalDBMS
        - Projects/Scripting/Python/SimpleGUI => Docs/Programming/Languages/Python/Examples/Code-Snippets/Simple-GUI
        - Projects/Scripting/Template_Folder/Python => Docs/Programming/Languages/Python/Templates/Project structure/Project_Name
        - Projects/Templates/Software Development/Programming/libs/tests.py => Docs/Programming/Languages/Python/Examples/Code-Snippets/Unit Tests
        - Scripts/Batch/Portable-Scripts => Docs/Programming/Languages/Batch/My-Scripts
        - Templates => Docs/Programming/Files/Templates
        - Temporary/curl_repositories.sh,gits.sh,textdl.sh => Docs/Programming/Shellscript/My-Scripts

    - Moved
        - Docs/layout.md => layout.md

    - Modified
        - Renamed Docs/Computers/Computer Hardware/parts-list.txt => Docs/Computers/Computer Hardware/PC Parts List.md
        - CHANGELOGS.md
        - README.md
        - Docs/README.md
    ```

- 2023-08-29 1342H, Asura
    ```
    [New]
    - Added folders into 'Docs/CyberSecurity' 
        - Network Security: for all Network Security-related documentations and guides
            - Added folder 'Protocols' for all protocol information
                - Added folder 'IPSec'
        - Roles: for all files and information pertaining to various roles within cybersecurity
            - Added folder 'Cryptography' for Cryptographical-roles and skillsets such as Cryptographers and Cryptanalysts
    - Added folder 'Spoofing' into 'Docs/CyberSecurity/Techniques' for spoofing-related techniques such as ip spoofing
    - Added a playbook for Home Lab in 'Docs/Home Lab'
    - Added a playbook for using x11vnc VNC server in 'Docs/Linux/Guides/Server/VNC-Servers/x11vnc'
    - Added folder 'Staged Build' in 'Docs/Linux/Linux-From-Scratch' for storing all guides and steps for Linux From Scratch (LFS)
    - Added compilation guide for package 'binutils' in 'Docs/Linux/packages/package-compile-guides'
    - Added guide for generating new project from scratch in tty/command line (generating-new-project-from-scratch.md) in 'Docs/Programming/Mobile-App-Development/Android/Project'
    - Added folder 'templates' for storing all Android Project workspace/filesystem structure templates files in 'Docs/Programming/Mobile-App-Development/Android/Project/'
    - Added 'buildx' manual for using the new and recommended 'docker buildx build' over 'docker buildx' in 'Docs/Technology/Containers/Docker/Guides/Manuals'
    - Added a playbook for Docker in 'Docs/Technology/Containers/Docker'
    - Added code snippets for multiarchitecture virtual machine startup with QEMU/KVM in 'Docs/Virtual Machines/QEMU-KVM/Snippets'
    - Added a playbook for Virtual Machine hypervisor QEMU/KVM

    [Updates]
    - Updated setup guide for NoVNC (+ Websockify)
        - Fix Repository URL for Websockify (websockify/websockify => novnc/websockify)
    - Updated 'docker' command manual with extra options (build), extra usage and snippets
    ```

### 2023-10-14 1150H
- New
    + Added new document 'networking-types.md' at 'Docs/Linux/Guides/Networking'
    + Added new document 'monitoring.md' at 'Docs/Linux/Guides/System Administration'
    + Added new document 'tail.md' at 'Docs/Linux/commands'
    + Added new document 'package-name-reference.md' at 'Docs/Linux/packages'
    + Added new document 'formatting.md' at 'Docs/Programming/Languages/Python/Guides/Types/string'
    + Added new document 'playbook.md' at 'Docs/Programming/Shellscript'
    - Added new folder 'Guides' for QEMU/KVM in 'Docs/Virtual Machines/QEMU-KVM/'
        + Added new files 'Headless-Using-QEMU.md', 'Headless-Using-Virsh.md (WIP)' at 'Docs/Virtual Machines/QEMU-KVM/Guides/Headless'
        + Added new files 'bridge-networking.md' at 'Docs/Virtual Machines/QEMU-KVM/Guides/Networking/Using qemu-system'
        + Added new files 'differences.md' at 'Docs/Virtual Machines/QEMU-KVM/Guides'
- Updates
    + Added new tips and tricks to 'Docs/Virtual Machines/QEMU-KVM/Snippets/development-workflow-with-vm.md'

### 2023-10-21 2136H
- New
    - Added new document 'find.md' at 'Docs/Linux/commands'
    - Added new document 'project-filesystem-structure.md' in 'Docs/Programming/Languages/C'
    - Added new document 'README.md' in 'Docs/Virtual Machines/QEMU-KVM/Guides/Networking/Using qemu-system'
    - Added new document 'ports.md' in 'Docs/Virtual Machines/QEMU-KVM/Guides/Networking/Using qemu-system'
    - Added new folder 'Shin Megami Tensei V' for SMT V Game Guides in 'Docs/Gaming/Games/Platforms/Nintendo Switch (NSW)'
        + Added new document 'strategies.md' at 'Docs/Gaming/Games/Platforms/Nintendo Switch (NSW)/Shin Megami Tensei V/Game Guides'
    - Added new folder 'SSH' for SSH documentations in 'Docs/Linux/Guides/System Administration'
        + Added new document 'adding-key-entries-into-known-hosts.md' at 'Docs/Linux/Guides/System Administration/SSH'
    - Added new folder 'Guides' for C# in 'Docs/Programming/Languages/C#'
        - Added new subfolder 'Compilation' for C# Compilation-related documentations
            - Added new subfolder 'Linux' for C# Linux-related compilation documentations
                + Added new files 'mono.md' at 'Docs/Programming/Languages/C#/Guides/Compilation/Linux'
            - Added new subfolder 'Steps' for C# compilation steps
                + Added new files 'compiling-from-command-line.md', 'compiling-gui-from-command-line.md' at 'Docs/Programming/Languages/C#/Guides/Compilation/Steps'
            - Added new subfolder 'Windows' for C# Windows-related compilation documentations
                + Added new files 'csc.md' at 'Docs/Programming/Languages/C#/Guides/Compilation/Windows'
    - Added new folder 'Templates' for C# in 'Docs/Programming/Languages/C#'
        + Added new files 'project-sources.md' at 'Docs/Programming/Languages/C#/Templates'
    - Added new folder 'utilities' for C in 'Docs/Programming/Languages/C/'
        + Added new files 'gcc.md' at 'Docs/Programming/Languages/C/utilities'
- Updates
    - Split documentation, syntaxes from 'Docs/Virtual Machines/QEMU-KVM/Guides/Networking/Using qemu-system/bridge-networking.md' into 
        + 'Docs/Virtual Machines/QEMU-KVM/Guides/Networking/Using qemu-system/README.md' : for a general README and basic startup information that then leads into the specifics (i.e. ports or bridge networking) and
        + 'Docs/Virtual Machines/QEMU-KVM/Guides/Networking/Using qemu-system/ports.md'  : for QEMU/KVM Port Management and Utility
    - Added new Environment Variables into 'Docs/Linux/Files/environment-variables.md'
    - Added Wi-Fi Profile usages in 'Docs/Operating Systems/Windows/commands/netsh.md'
    - Added extra options in 'Docs/Operating Systems/Windows/commands/wmic.md'

### 2023-10-22 2232H
- New
    - Added new folder 'dpkg' at 'Docs/Linux/package-manager'
    - Added new document 'operational-flow.md' at 'Docs/Home Lab'
- Updates

### 2023-10-23 1049H
- New
    - Added new folder 'Webservers' at 'Docs/Home Lab/Services and Tools' for all WebServers
        - Added new folder 'Jupyter Server' for Jupyter Server setup and documentations at 'Docs/Home Lab/Services and Tools/Webservers'

- Updated

### 2023-10-24 1105H
- New
    + Added new folder 'manuals' for holding manuals to Jupyter(Labs)-related actions in 'Docs/Home Lab/Services and Tools/Webservers/Jupyter Server/docs'
    + Added new document 'quickstart-and-operational-flow.md' at 'Docs/Virtual Machines/VirtualBox/Command-Line'
- Updates
    + Updated Jupyter Documentations 'README.md' at 'Docs/Home Lab/Services and Tools/Webservers/Jupyter Server/docs'

### 2023-10-31 2322H
- New
    - Added new document 'README.md' at 'Docs/Linux/Guides/Setup'
    - Added new folder 'Data Structures and Algorithms' for DSA information at 'Docs/Programming'
    - Added new folder 'Resources' for containing resources at 'Docs'

- Updates
    - Updated git command documentation 'git.md' at 'Docs/Git/commands'
    - Updated image in 'README.md' at 'Docs/Home Lab/Services and Tools/Webservers/Jupyter Server/docs/containerization/docker/images/Base-Notebook'

### 2023-11-05 1556H
- New
    - Added new folder 'Guides' for Proxmox-related documentations at 'Docs/Linux/Guides/Server/Home Lab/Proxmox'
        - Added new installation guide for installing Proxmox from scratch/bootstrapping via Command Line (like ArchLinux)
    - Added new document 'syntax-equivalence.md' at 'Docs/Programming'

### 2023-11-06 1549H
- New
    + Added new document 'systeminfo.md' for documentation of windows command 'systeminfo' at 'Docs/Operating Systems/Windows/commands' 
- Updates
    + Updated 'wmic.md' at 'Docs/Operating Systems/Windows/commands/wmic.md b/Docs/Operating Systems/Windows/commands' with new usage information and options

### 2023-11-06 1559H
- New
    - Added new folder 'System-Administration' in 'Docs/Operating Systems/Windows/Guides/'
        - Added new folder 'maintenance-and-servicing' in 'Docs/Operating Systems/Windows/Guides/System-Administration' for maintenance, servicing and diagnostics-related information
            + Added new document 'utilities.md' in 'maintenance-and-servicing' for all utilities

### 2023-11-06 1637H
- Updates
    + Updated 'wmic.md' at 'Docs/Operating Systems/Windows/commands' with options and usages about sysadmin - checking maximum supported physical memory (RAM) on motherboard

### 2023-11-07 1736H
- New
    - Added new folder 'Static Website' in 'Docs/Programming/Web-Development' for Static Web Development (No Database, No Server)
        - Added new folder 'Static Site Generators' in 'Static Website' for static site generators
            - Added new folder 'Hugo' for Static Site Generator framework 'hugo'
                + Added new document 'README.md' for 'Hugo'

### 2023-11-08 1747H
- New
    - Added new folder 'design-snippets' for CSS Snippets and examples for designs in 'Docs/Programming/Web-Development/Guides'
    - Added new folder 'Basics' for CSS Basics and fundamentals in 'Docs/Programming/Web-Development/Languages/CSS'
    - Added new folder 'layouts' for containing CSS layout documentations, guides, snippets and usage examples in 'Docs/Programming/Web-Development/Languages/CSS/Guides'

### 2023-11-09 1631H
- New
    - Added new folder 'Ideas' for containing ideas regarding different unique usages such as 'starting GUI applications in VNC server from tty' in 'Docs/Linux'

### 2023-11-09 2044H
- Updates
    - Updated document 'README.md' in 'Docs/Linux/Ideas/starting-GUI-apps-from-tty'
        - Rearranged order of operation in 'steps'
            + Moved step 5 (GUI Applications) to the last step
        - Added new troubleshooting and documentation

### 2023-11-10
#### 0841H
- Updates
    - Updated document 'README.md' in 'Docs/Linux/Ideas/starting-GUI-apps-from-tty'
        - Added new troubleshooting and documentation
        - Added new finding and notes
#### 0902H
- Updates
    + Testing new CHANGELOGS format
    + Updated 'keybindings.md' in 'Docs/Operating Systems/Windows/Tips-and-Tricks' with Windows Keybindings
#### 1253H
- New
    - Added new folder 'commands' in 'Docs/Linux/packages/Display Server/xorg' for Xorg-related packages, functions and commands
        - Added new document 'Xvfb.md' for documentations regarding the X Display Server - Virtual Framebuffer (Xvfb) renderer utility
- Updates
    + Updated x11vnc 'README.md' in 'Docs/Linux/Guides/Server/VNC-Servers/x11vnc' with new options usable with X Virtual Framebuffer (Xvfb)

