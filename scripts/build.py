from sys import argv
from os import getcwd, mkdir, remove, rename
from platform import system
from subprocess import run as system_run
from genericpath import isdir, isfile
from shutil import rmtree
from colorama import Fore, Back, Style

cwd = getcwd()
platform = system()

args = argv
args_len = len(argv)


def info(message: str):
    print(Fore.BLUE + "[INFO] " + Style.RESET_ALL + message)


def success(message: str):
    print(Fore.GREEN + "[SUCCESS] " + Style.RESET_ALL + message)


def warning(message: str):
    print(Fore.YELLOW + "[WARNING] " + Style.RESET_ALL + message)


def error(message: str):
    print(Fore.RED + "[ERROR] " + Style.RESET_ALL + message)
    raise Exception(message)


# Arguments shall be executed in this order if provided
arg_struct = {
    "clean": False,                 # -c --clean
    "CLEAN": False,                 # -C --CLEAN
    "create-build-folders": False,  # -g --create-build-folders
    "make": False,                  # -m --make
    "run": False                    # -r --run
}


def parse_args():
    for arg in args:
        if arg == "--clean" or (arg.count('-') == 1 and "c" in arg):
            arg_struct["clean"] = True
            continue
        if arg == "--CLEAN" or (arg.count('-') == 1 and "C" in arg):
            arg_struct["CLEAN"] = True
            continue
        if arg == "--create-build-folders" or (arg.count('-') == 1 and "g" in arg):
            arg_struct["create-build-folders"] = True
            continue
        if arg == "--make" or (arg.count('-') == 1 and "m" in arg):
            arg_struct["make"] = True
            continue
        if arg == "--run" or (arg.count('-') == 1 and "r" in arg):
            arg_struct["run"] = True
            continue


def create_build_folders():
    info("Creating build and bin folders")
    if not isdir(cwd + "/build"):
        mkdir(cwd + "/build")
        mkdir(cwd + "/build/lib")
        mkdir(cwd + "/build/host")
        mkdir(cwd + "/build/device")
        mkdir(cwd + "/build/device/huffman")
        mkdir(cwd + "/build/device/lempel_ziv_welch")

    if not isdir(cwd + "/bin"):
        mkdir(cwd + "/bin")


def move(old, new):
    if isfile(old):
        if isfile(new):
            remove(new)
        rename(old, new)
    else:
        print(old + " does not exist")


def clean():
    if arg_struct["clean"] is True:
        info("Cleaning build folder")
    elif arg_struct["CLEAN"] is True:
        info("Cleaning all build folders")
    else:
        error("Something went wrong with arg_struct")

    # Clean bin
    if isdir(cwd + "/bin") and arg_struct["CLEAN"] is True:
        rmtree(cwd + "/bin")
    elif not isdir(cwd + "/bin") and arg_struct["CLEAN"] is True:
        info("Bin folder does not exist.")

    # Clean build
    if isdir(cwd + "/build"):
        rmtree(cwd + "/build")
    else:
        info("Build folder does not exist")


def make():
    info("Running make...")
    p = system_run("make")
    if p.returncode != 0:
        error("Project build failed!")
    success("Project sucessfully built")


def appl_run():
    info("Running application...")
    if isfile("bin/appl"):
        system_run("bin/appl")
    else:
        error("Build application first!")


def main():
    parse_args()

    if arg_struct["clean"] == True or arg_struct["CLEAN"] == True:
        clean()

    if arg_struct["create-build-folders"] == True:
        create_build_folders()

    if arg_struct["make"] == True:
        make()

    if arg_struct["run"] == True:
        appl_run()


if __name__ == "__main__":
    main()
