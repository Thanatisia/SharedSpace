"""
Setup Process
- Install if not installed
	pip
	target module
"""

import os
import sys
import subprocess
import platform

### Check OS ###
os_platform = platform.system()
os_release = platform.release()
os_version = platform.version()

if not (os_platform == "Windows"):
	# Non-Windows, probably UNIX, Linux or MacOS

	def get_linux_info():
		# Get Linux Distro Information
		proc = subprocess.Popen(['uname', '-a'], stdout=subprocess.PIPE)
		out = proc.communicate()[0]
		linux_info = out.decode().rstrip('\n').split(' ')
		return linux_info
	
	def get_linux_distro():
		# Get Linux Distro
		linux_info = get_linux_info()
		linux_distro = linux_info[1]
		return linux_distro

	linux_distro = get_linux_distro()
else:
	# Windows
	linux_distro = "N/A"

### Pip ###
class Setup():
	""" Setup class (Initializing variables etc., checking etc.) """
	def check_pip(self):
		"""
		Check if pip is installed
		- if not installed (python -m pip error)
			curl -L https://bootstrap.pypa.io/get-pip.py -o get-pip.py
			python get-pip.py
		"""
		# Get Return Code
		# cmd="{} -m pip --version".format(sys.executable)
		cmd = [sys.executable, "-m", "pip", "--version"]
		child = subprocess.Popen(cmd, stdout=subprocess.PIPE)
		streamdata = child.communicate()[0]
		rc = child.returncode
		return rc
	
	def validate_pkg(self, package_name):
		"""
		Check if package exists
		"""
		# cmd="{} -c \"import {}\"".format(sys.executable, package_name)
		cmd = [sys.executable, '-c', "import {}".format(package_name)]
		child = subprocess.Popen(cmd, stdout=subprocess.PIPE)
		streamdata = child.communicate()[0]
		rc = child.returncode
		return rc

	def install(self, package_name):
		"""
		Install package using pip
		"""
		subprocess.check_call([sys.executable], "-m", "pip", "install", package_name)

	"""
	Linux-specific functions
	"""
	if not (os_platform == "Windows"):
		# Linux / UNIX / MacOS
		if linux_distro == "ArchLinux":
			# pacman
			def pkg_installed(self, package_name):
				"""
				Checks if package is installed
				| grep '^$package_name'
				"""
				rc = 0
				cmd = ["pacman", "-Qq"]
				child = subprocess.Popen(cmd, stdout=subprocess.PIPE)
				streamdata = child.communicate()[0]
				decoded_streamdata = streamdata.decode()
				list_installed_pkgs = decoded_streamdata.split('\n')[:-1]
				# rc = child.returncode
				rc = package_name in list_installed_pkgs
				return rc

			def install_pkg(self, package_name):
				"""
				Install package using package manager
				"""
				cmd = ["sudo", "pacman", "-S", package_name]
				subprocess.check_call(cmd)

setup = Setup()

def install_pip():
	"""
	Install pip if does not exist
	"""
	ret_code = setup.check_pip()
	if not (ret_code == 0):
		# If return code == 0 : Installed
		print("Pip is not installed, downloading...")
		os.system("curl -L https://bootstrap.pypa.io/get-pip.py -o get-pip.py")
		os.system("{} get-pip.py".format(sys.executable))

def install_if_not_exist(package_name):
	"""
	Install package if does not exist
	"""
	rc = setup.validate_pkg(package_name)
	if not (rc == 0):
		# If error, install
		print("Module [{}] does not exist, installing...".format(package_name))
		setup.install(package_name)


def full_setup(*pkgs):
	"""
	:: Params
		pkgs : The packages you want to check if exist
			Type : argv (Tuple)
	"""
	install_pip()
	install_if_not_exist("tk")
	if not (linux_distro == "N/A"):
		# ArchLinux
		try:
			# pkg_name = "tk"
			number_of_pkgs = len(pkgs)
			for i in range(number_of_pkgs):
				pkg_name = pkgs[i]	# Current Package
				install_check = setup.pkg_installed(pkg_name)
				if not (install_check):
					# True = Installed
					# False = Not Installed
					setup.install_pkg(pkg_name)
		except:
			print("You need to install these packages to proceed, exitting.")
			exit()