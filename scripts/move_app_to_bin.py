from genericpath import isdir, isfile
from os import getcwd, mkdir, remove, rename
from platform import system

cwd = getcwd()

if system() == "Windows":
  if not isdir(cwd + "\\bin"):
    mkdir(cwd + "\\bin")
elif system() == "Linux":
  if not isdir(cwd + "/bin"):
    mkdir(cwd + "/bin")

def move(old, new):
  if isfile(old):
    if isfile(new): 
      remove(new)
    rename(old, new)
  else:
    print(old + " does not exist")

if system() == "Windows":
  move(
    cwd + "\\build\\host\\host.exe",
    cwd + "\\bin\\host.exe"
  )
elif system() == "Linux":
  raise("Linux not implemented!")
