##############################
# Linux Audio Control - ALSA #
##############################

: "
	To get hardware
		amixer

	Hardware Types:
		Master
		Microphone
		Headphone

	Controls
		amixer set '<Hardware>' playback n+ : To increase volume
		amixer set '<Hardware>' playback n- : To decrease volume
		amixer set '<Hardware>' toggle		: To toggle between Mute <-> Unmute

		amixer sset '<Hardware>' on			: To enable Hardware
"

toggle_hardware()
{
	# Code here
	
}

main()
{
	echo "Hello World"
}

if [[ "${BASH_SOURCE[@]}" == "" ]]; then
	main
fi