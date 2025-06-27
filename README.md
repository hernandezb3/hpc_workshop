# Installing Software on HPC
This repository was built for the "Installing Software on UConn Storrs HPC" which covers how to request interactive jobs on UConn Storrs High Performance Computing (HPC). Including how to get set up, make job requests, transfer files to and from your HPC account, and install software. 

For a YouTube video of the workshop [click here](https://www.youtube.com/embed/rhH3Alengow?si=yLbsLA9urqYwKWFx)

## Context and Pre-Requisites
- Personal Device:
    - Mac Operating System (OS)
    - [VS Code](https://code.visualstudio.com) Interactive Development Environment (IDE)
- UConn Account:
    - UConn NetID and Password
    - [Cisco Duo](https://kb.uconn.edu/space/IKB/10789815076/Setting+up+a+Mobile+Phone+for+2FA) Two-Factor Authentication (2FA)
- HPC:
    - [UConn Storrs HPC Account](https://login.uconn.edu/cas/login?service=https%3A%2F%2Fhpc.uconn.edu%2Fwp-login.php%3Fprivacy%3D2%26redirect_to%3Dhttps%253A%252F%252Fhpc.uconn.edu%252Fstorrs%252Faccount-application%252F)
    - [Cisco AnyConnect](https://kb.uconn.edu/space/IKB/10907091023/Set+Up+Cisco+AnyConnect+VPN) Virtual Private Network (VPN)
    - [XQuartz](https://www.xquartz.org) Secure SHell (SSH) Client and X11 Window System
    - [FileZilla]() File Transfer Protocol (FTP)
    - [Docker Account](https://www.docker.com)

Follow the steps in the UConn Storrs HPC's [Getting Started](https://kb.uconn.edu/space/SH/26694811668/Getting+Started) guide.

## Intro to HPC
*High Performance Computing* (HPC) facilities have clusters of powerful processors that can run compute-intensive workloads. The UConn Storrs HPC facility is equipt with 8 partitions. Each *partition* has a set of compute nodes with like-features. For example, some nodes may require priority access, while others have similar hardware. Combinations of processing units and memory are referred to as compute nodes. These compute nodes are physical resources with finite *processing units* (also called cores) and *memory*. 

*Processing units* process and execute instructions - they're the brain of a computer. There are two types of processing units available on UConn Storrs HPC, *Central Processing Units* (CPUs) and *Graphics Processing Units* (GPUs). CPUs are general purpose processors so they're build to handle a range of tasks. GPUs are optimized for running tasks with graphics, like running a video game. They're going to be more powerful processing units than CPUs and while they're built for graphics, they can be used to run other tasks. 

When the proccessing unit runs, it uses *memory*, i.e., Random Access Memory (RAM), to temporarily store information and programs it needs readily available. This is different from a storage drive (SD), like a hard drive, which is for long term storage. 

For example: When a .csv file is saved to your computer, it's stored in the storage drive. If you open it in Excel, the file is moved to RAM and the CPU works to run the Excel program and access the data file from RAM.

## Job Requests
Since UConn Storrs HPC are a cluster of shared resources, there is a program called SLURM that determines how resources are allocated. 

There are two ways to request resources from UConn Storrs HPC, an interactive job (srun) or a scheduled job (sbatch). The demo requests an interactive job, so we can drop-in to HPC to send inputs and recieve outputs from HPC in real time. For more information about job types, see Step 5 in UConn Storrs HPC's [Getting Started](https://kb.uconn.edu/space/SH/26694811668/Getting+Started) guide. 

The job request is where to specify what resources we'd like to use on HPC. You can also request to be assigned to a node in a specific partition. For more information about the UConn Storrs HPC partitions and how to incorporate them into the job request, see [here](https://kb.uconn.edu/space/SH/26032963610/Partitions+%2F+Storrs+HPC+Resources#I.-Partitions-of-the-Storrs-HPC)  

See the [SLURM Guide](https://kb.uconn.edu/space/SH/26032963685/SLURM+Guide) for more examples of how to request jobs on HPC.

## Installing Software
There are currently 3 ways to install software on HPC, the one we cover here is using a container. 

A *container* is an isolated environment to run an application. Within the container is anything necessary e.g., files, packages, etc. run the application. A container is built from an image, which contains the instructions for how to build the envrionment. The *image* can be thought of as an template or instructional manual for building a container. 

Images can be manually built, but Docker, a containerization service, contains a library of prebuilt images. Apptainer, the container module used by UConn Storrs HPC, is compatible with Docker, so with Apptainer we can pull images from the Docker library to build containers. We will reference the Ollama image from the Docker library to build the Ollama container.