# Grub - Configurations and Customization - Writing your own Themes

```
This is still in development

please do not refer to this file for the time being
```

## Information
### Folders
+ /etc/default : Contains System defaults
	- the /etc/default handles default configurations including the tty
		- Your bootloader handles the initial boot-up launch/setup process such as (and including)
			+ TTY Resolution
			+ Starting up operating systems registered by the Boot manager
+ /boot/grub : Grub boot configurations and resources such as fonts, themes, aritecture and config file

### Files
+ System Default Grub Configuration File (Manual Editable) : /etc/default/grub
+ Grub system-generated configuration file (Autogenerated) : /boot/grub/grub.cfg

### General Steps
- Make Modifications to '/etc/default/grub'
    ```console
    sudo $EDITOR /etc/default/grub
    ```
    
- Re-generate your Grub configurations
    ```console
	sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

- Changing Theme
	- Information
		+ When using a theme: Your splash image will usually not be displayed
	- Setup
		- Edit '/etc/default/grub'
			+ grub user share themes folder : "/usr/share/grub/themes/[theme-name]/theme.txt"
			```console
			# sudo $EDITOR /etc/default/grub
			GRUB_THEME="/path/to/gfxtheme"
			```
		- Regenerate grub.cfg after making changes
			```console
			sudo grub-mkconfig -o /boot/grub/grub.cfg
			```
			- If is successful
				+ User will see "Found theme: [path/to/theme/theme.txt]" in the terminal after the command is executed
		- Reboot system
			```console
			sudo reboot now
			```



## Wiki


        
## Resources
+ [ArchWiki - GRUB - Setting the framebuffer resolution](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks#Setting_the_framebuffer_resolution)
+ [GNU Documentations - GRUB - GFXMODE](https://www.gnu.org/software/grub/manual/grub/html_node/gfxmode.html)
+ [GNU Documentations - GRUB - Theme File Format](https://www.gnu.org/software/grub/manual/html_node/Theme-file-format.html)
