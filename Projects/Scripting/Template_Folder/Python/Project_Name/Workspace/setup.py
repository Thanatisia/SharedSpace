"""
Setup Process
- Install if not installed
	pip
	target module
"""

import os
import sys
import subprocess

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
		cmd="{} -m pip --version".format(sys.executable)
		child = subprocess.Popen(cmd, stdout=subprocess.PIPE)
		streamdata = child.communicate()[0]
		rc = child.returncode
		return rc
	
	def validate_pkg(self, package_name):
		"""
		Check if package exists
		"""
		# cmd="{} -c \"import {}\"".format(sys.executable, package_name)
		cmd = [sys.executable, '-c', "\"import {}\"".format(package_name)]
		child = subprocess.Popen(cmd, stdout=subprocess.PIPE)
		streamdata = child.communicate()[0]
		rc = child.returncode
		return rc

	def install(self, package_name):
		"""
		Install package using pip
		"""
		subprocess.check_call([sys.executable], "-m", "pip", "install", package_name)

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