from genericpath import isdir
from os import getcwd
from shutil import rmtree

cwd = getcwd()

if isdir(cwd + "/build"):
  rmtree(cwd + "/build")
