from setuptools import setup, find_packages

setup(
    name='name-of-package',
    version='version-number',
    description="project/package/module description here",
    author='author-name',
    author_email='author-git-email',
    packages=find_packages("src"), # Default: find_packages()
    package_dir={"": "src"},
    install_requires=[
        # List your dependencies here
        "flask"
    ],
    url='https://github.com/author/repository-name',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.11',
        'Programming Language :: Python :: 3.12',
        'Programming Language :: Python :: [python-version]',
    ],
    entry_points = {
        # Program Entry Point(s) and scripts
        'console_scripts' : [
            # [executable-name] = [package-name].[module (aka script-name)]:[function-to-execute]
            # Notes:
            #   - When installed, setuptools will install the mapped function in the attached script found in the specified package as an executable 
            #       - in '~/.local/bin' for host system, or 
            #       - in '[virtual-environment-name]/bin' in a python Virtual Environment
        ],
    },
)

