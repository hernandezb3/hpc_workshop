# navigating hpc
date # gets date and timestamp

hostname # show the system's host name i.e., check the node

pwd # pwd = print working directory
# cd = change directory
cd .. # change to parent
cd ../.. # change to parent of parent
cd ollama # change to ollama folder
cd "home/$USER" # change to node of user
# by default files are stored in home/$USER

# ls = list
ls # list files in the working directory
ls -a # list all files, including hidden ones
ls -lh # list files and their sizes
lsmod # view loaded modules
# mkdir = make directory
mkdir test # create a new folder called test
# rmdir = remove directory
rmdir test # remove the folder called test
# rm = remove file
rm goodreads_20.csv # remove the file called goodreads_20.csv
# mv = move: move files and directories from one directory to another
mv output shared # move output.csv from scratch to shared
cat # print the contents of a file

# df = disk space usage
df -k # check the storage of the partition

# request an interactive job
# srun = requests an interactive job (aka drop in)
# -t = time allocation (30 minutes)
# -n = number of nodes (1)
# -c = number of cores (8)
# --mem = ram (64 GB)
# --pty = scripting language (bash)
srun -t 0:30:00 -n 1 -c 8 --mem=64G --pty bash
hostname

# load software
module avail
module avail apptainer
module avail python
module avail r
# list out loaded modules
module list
# remove all modules
module purge
# remove incompatible packages
module unload python
module unload gcc
# add apptainer and python
module load apptainer
module load python/3.12.2 

git clone https://github.com/hernandezb3/llama-on-uconn-hpc.git # clone this repo
git fetch # retrieve changes without affecting the local repository
git pull # retrieve changes and synchronize local repository

# ctrl + c to kill a running command