---
title: "Rivanna"
linkTitle: "Rivanna"
weight: 9
description: >
  Rivanna
---

{{% pageinfo %}}

Rivanna is the University of Virginia’s High-Performance Computing
(HPC) system. As a centralized resource and has many software packages
available. Currently, the Rivanna supercomputer has 603 nodes with
over 20476 cores and 8PB of various storage. Rivanna has multiple
nodes equipped with GPUs including RTX2080, RTX3090, K80, P100, V100,
A100-40GB, A100-80GB.

{{% /pageinfo %}}

## Communication

We have a team discord at: uva-bii-community

<https://discord.gg/uFKJ5TUv>

please subscribe if you work on rivanna and are part of the
bii_dsc_community.


## Rivanna at UVA


The official Web page for Rivanna is located at 

* <https://www.rc.virginia.edu/userinfo/rivanna/overview/>

In case you need support you can ask the staff using a ticket system
at

* <https://www.rc.virginia.edu/support/> 
* This page also contains zoom office hours [Tue 3-5 pm](https://virginia.zoom.us/j/304271094?pwd=Szdib1kzK1QySlE4eGRGL1BiclpLUT09),  [Thu 10-12 pm](https://virginia.zoom.us/j/723009972?pwd=SWJMV09xMUp6M0lJY04yRXIwM1ZNdz09)

It is important that before you use Rivanna to attend a seminar that
upon request is given every Wednesday. To sign up, use the link:

* [Wednesday 3-4 pm Introduction](https://www.rc.virginia.edu/form/support-request/?category=Rivanna&request_title=Intro%20to%20Rivanna%20Orientation%20Session&description=I%27d%20like%20to%20reserve%20a%20seat%20for%20the%20next%20%22Intro%20to%20Rivanna%,%203-4pm.)

Please note that in this introduction we will provide you with
additional inforamation that may make the use of Rivanna easier.  We
encourage you to add to this information and share your tips,

## Getting Permissions to use Rivanna

To use Rivanna you need to have special authorization. In case you
work with a faculty member you will need to be added to a special
group (or multiple) to be able to access it. The faculty member will
know which group it is. This is managed via the
[group management portal](https://virginia.service-now.com/its/?id=itsweb_kb_article&sys_id=ea1dffc7db3ac744f032f1f51d96193a)
by the faculty member. Please do not use the previous link and instead
communicate with your faculty member first.

* *Note: For BII work conducted with Geoffrey Fox or Gregor von
  Laszewski, please contact Gregor at <laszewski@gmail.com>*


TODO: IS THIS THE CASE?

Once you are added to the group, you will receive an invitation email
to set up password for the research computing support portal.
If you do not recive such an email, please visit the support portal at

TBD

This
password is also the password that you will use to log into the
system.

END TODO IS THIS THE CASE

After your account is set up, you can try to log in through the
[Web-based access](https://www.rc.virginia.edu/userinfo/rivanna/login/).
Please test it to make sure you have the proper access already.

However, we will typically notuse the online portal but instead use
the more advanced batch system as it provides  significant advantages
for you when managing multiple jobs to Fivanna.

## Accessing an HPC Computer via command line

If you need to use  X11 on Rivanna you can finde documentation at
the rivanna documentation.
In case you need
to run
[jupyter](https://www.rc.virginia.edu/userinfo/rivanna/software/jupyterlab/)
notebooks directly on Rivanna, please consult with the Rivanna
documentation.

### VPN (required)

You can access rivanna via ssh only via VPN.  UVA requires you to use
the VPN to access any computer on campus.  VPN is offered by IT
services but oficially only supported for
[Mac and Windows](https://virginia.service-now.com/its/?id=itsweb_kb_article&sys_id=f24e5cdfdb3acb804f32fb671d9619d0).

However, if you have a Linux machine you can follow the
[VPN install instructions for Linux](https://www.rc.virginia.edu/userinfo/linux/uva-anywhere-vpn-linux/).
If you have issues installing it, attend an online support session
with the Rivanna staff.

### Access via the Web Browser

Rivanna can be accessed right from the Web browser. Although this may
be helpful for those with systems where a proper terminal can not be
accessed it can not leverage the features of your own desktop or
laptop while using for example advanced editors or keeping the file
system of your machine in sync with the HPC file system.

Therefore, practical experience shows that you benefit while using a
terminal and your own computer for software development.

Additiional documentation by the rivanna system staff is provided at 

* <https://www.rc.virginia.edu/userinfo/rivanna/ood/overview/>

### Access Rivanna from macOS and Linux

To access Rivanna from macOS, use the terminal and use ssh to connect
to it. We will provide an in depth configuration tutorial on this
later on. We will use the same programs as on Linux and Windows so we
have to only provide one documentation and it is uniform across
platforms.

Please remember to use 

```bash
$ ssh-agent
$ ssh-add
```


To activate ssh in your terminal

### Access Rivanna from Windows

While exploring the various choices for accessing Rivanna from Windows
you can use [putty](https://www.putty.org/) and
[MobaXterm](https://www.rc.virginia.edu/userinfo/rivanna/logintools/mobaxterm/).

However, most recently a possible better choice is available while
using [gitbash](https://gitforwindows.org/). Git bash is trivial to
install. However, you need to read the configuration options
carefully. **READ CAREFULLY** Let us know your options so we can add
them here.

To simplify the setup of a Windows computer for research we have
prepared a separate

* [help page to set up your Windows computer](https://github.com/cybertraining-dsc/reu2022/blob/main/project/windows-configuration.md).

It addresses the installation of gitbash, Python, PyCharm (much better
than VSCode), and other useful tools such as chocolate.

With git bash, you get a bash terminal that works the same as a Linux
bash terminal and which is similar to the zsh terminal for a Mac.

## Set up the connection (mac/Linux)

The first thing to do when trying to connect to Rivanna is to create
an ssh key if you have not yet done so.

To do this use the command

```bash
ssh-keygen
```

Please make sure you use a passphrase when generating the key. Make
sure to not just skip the passphrase by typing in ENTER but instead
use a real not easy to guess passphrase as this is best practice and
not in violation violation of security policies. You always can use 
use `ssh-agent` and `ssh-add` so you do not have to repeatedly enter
your passphrase.

The `ssh-keygen` program will generate a public-private keypair in the
directory `~/.ssh/id_rsa.pub` (public key) and `~/.ssh/id_rsa`. Please
never share the private key with anyone.

Next, we need to add the public key to Rivanna's
`rivanna:~/.ssh/authorized_keys file`. The easiest way to do this is
to use the program `ssh-copy-id`.

```bash
ssh-copy-id username@rivanna.hpc.virginia.edu
```

Please use your password when using `ssh-copy-id`. Your username is
your UVA computing id. Now you should be ready to connect with

```bash
ssh username@rivanna.hpc.virginia.edu
```

## Commandline editor

Sometimes it is necessary to edit files on Rivanna. For this, we
recommend that you learn a command line editor. There are lots of
debates on which one is better. When I was young I used vi, but found
it too cumbersome. So I spend one-day learning emacs which is just
great and all you need to learn. You can install it also on Linux,
Mac, and Windows. This way you have one editor with very advanced
features that is easy to learn.

If you do not have one day to familiarize yourself with editors such
as emacs, vim, or vi, you can use editors such as nano and pico.

The best commandline editor is emacs. It is extremely easy to learn when using
just the basics. The advantage is that the same commands also work in
the terminal.

| Keys     | Action |
| --- | --- |
| CTRL-x c | Save in emacs  |
| CTRL-x q | Leave |
| CTRL-x g | If something goes wrong | 
| CTRL a   | Go  to beginning line |
| CTRL e   | Go to end of line | 
| CTRL k   | Delete till end of line from curser |
| cursor   | Just works  ;-) |



## PyCharm

The best editor to do python development is pyCharm. Install it on
your desktop. The education version is free.

## VSCode

An inferior editor for python development is VSCode. It can be
configured to also use a
[Remote-SSH](https://code.visualstudio.com/docs/remote/ssh) plugin.

## Moving data from your desktop to Rivanna

To copy a directory use `scp`

If only a few lines have changed use `rsync`

To mount Rivannas file system onto your computer use `fuse-ssh`.
This will allow you to for example use pyCharm to directly edit files on Rivanna.

Developers however often also use GitHub to push the code to git and
then on Rivanna use pull to get the code from git. This has the
advantage that you can use pyCharm on your local system while
synchronizing the code via git onto Rivanna.

However often scp and rsync may just be sufficient.

## Example Config file

Replace abc2de with your computing id

place this on your computer in `~/.ssh/config`

```
ServerAliveInterval 60

Host rivanna
     User abc2de
     HostName rivanna.hpc.virginia.edu
     IdentityFile ~/.ssh/id_rsa.pub
     
Host b1
     User abc2de
     HostName biihead1.bii.virginia.edu
     IdentityFile ~/.ssh/id_rsa.pub
     
Host b2
     User abc2de
     HostName biihead2.bii.virginia.edu
     IdentityFile ~/.ssh/id_rsa.pub
```

Adding it allows you to just ssh to the machines with 

```
ssh rivanna
ssh b1
ssh b2
```

## Rivanna's filesystem

The file systems on Rivanna have some restrictions that are set by
system wide policies that you need to be inspecting:

* TODO: add link here

we distinguish 

* home directory: `/home/<uvaid>` or `~`
* `/scratch/bii_dsc_community/<uvaid>`
* `/project/bii_dsc_community/projectname/<uvaid>`

Y
In your home directory, you will find system directories and files such as 
`~/.ssh` , `~/.bashrc`and `~/.zshrc`

The difference in the file systems is explained at 

* <https://www.rc.virginia.edu/userinfo/rivanna/storage/>.

## Dealing with limited space under HOME

As we conduct research you may find that the file spece in your home
directory is insufficient. This is especially the case when using
conda. Therefore, it is recommended that you create softlinks from
your home directory to a location where you have more space. This is
typically soemwhere under `/project`.

We describe next how to relocate some of the directories to `/project`

In `~/.bashrc`, add the following lines, for creating a project
directory. 

```bash
$ vi ~/.bashrc

$ PS1="\w \$"
$ alias project='cd /project/bii_dsc_community/$USER'
$ export PROJECT="/project/bii_dsc_community/$USER"
```

At the end of the .bashrc file use 

```bash
$ cd $PROJECT
```

So you always cd directly into your project directory instead of home.

The home directory only has 50GB. Installing everything on the home
directory will exceed the allocation and have problems with any
execution.  So it’s better to move conda all other package
installation directories to $PROJECT.

First explore what is in your home directory and how much space it
consumes with the following commands.

```bash
cd $HOME
$ ls -lisa
$ du -h .
```

Select from this list directories that you want to  move (thise that
you not already have moved).

Let us assume you want to move the directories `.local`,
`.vscode-server`, and `.conda`.
Imporatnt is that you want to make sure that .conda and .local are
moved as they may include lots of files and you may run out of memory
quickly.
Hence you do next the following.


```bash
$ cd $PROJECT
$ mv ~/.local .
$ mv ~/.vscode-server .
$ mv ~/.conda .
```

Then create symbolic links to the home directory installed folder. 

```bash
$ cd $PROJECT
$ ln -s $PROJECT/.local ~/.local
$ ln -s $PROJECT/.vscode-server ~/.vscode-server
$ ln -s $PROJECT/.conda ~/.conda
```

Check all symbolic links:

```
$ ls -lisa

20407358289   4 lrwxrwxrwx    1 $USER users          40 May  5 10:58 .local -> /project/bii_dsc_community/djy8hg/.local
20407358290   4 lrwxrwxrwx    1 $USER users          48 May  5 10:58 .vscode-server -> /project/bii_dsc_community/djy8hg/.vscode-server
```

In case you use python venv, do not place them in home but under
project.

```
module load python3.8
python -m venv $PROJECT/ENV3
source $PROJECT/ENV3/bin/activate
```

If you succesd, you can also place the source line in your .bashrcs
file.

In case you use conda and python, we also recommend that you create a
venv from the conda pythin, so you have a copy of that in ENV3 and if
something goes wrong its easy to recreate from your default
python. Thise that use that path ought to improve how to do this here.






## Load modules

Modules are preconfigured packages that allow you to use a specific
software to be loaded into your environment without needing you to
install it from source.
To find out more about a particular package such as cmake you can use
the command

```bash
module spider cmake # check whether cmake is available and details
```

Load the needed module (you can add version info). Note that some
modules are dependent on other modules (`clang/10.0.1` depends on
`gcc/9.2.0` so `gcc` needs to be loaded first.

```bash
# module load gcc/9.2.0 clang/10.0.1
module load clanggcc
module load cmake/3.23.3 git/2.4.1 ninja/1.10.2-py3.8 llvm cuda/11.4.2
```

check currently loaded modules

```bash
module list
```

clean all the modules

```bash
module purge
```

## Request GPUs to use interactively

TODO: explain what -A is

```bash
rivanna$ ijob -c number_of_cpus
              -A group_name
	      -p queue_name
	      --gres=gpu:gpu_model:number_of_gpus
	      --time=day-hours:minutes:seconds
```

An example to request 1 cpu with 1 a100 gpu for 10 minutes in 'dev' partition is

```bash
rivanna$ ijob -c 1 -A bii_dsc_community -p gpu --gres=gpu:a100:1 --time=0-00:10:00
```


Rivanna has different partitions with different resource availability
and charging rate. `dev` is free but limited to 1 hour for each
session/allocation and no GPU is available. To list the different
partions use `qlist` to check partitions 


| Queue          | Total   | Free    | Jobs    | Jobs    | Time       | SU     |    
| ---------------| --------| --------| --------| --------| -----------| --- |
| **(partition)**    | **Cores**   | **Cores**   | **Running** | **Pending** | **Limit**      | **Charge** |
| bii            | 4640    | 4306    | 38      | 1949    | 7-00:00:00 | 1  |    
| standard       | 5644    | 1391    | 706     | 12      | 7-00:00:00 | 1  |    
| dev            | 456     | 426     | 2       | 1       | 1:00:00    | 0  |    
| parallel       | 5680    | 364     | 32      | 21      | 3-00:00:00 | 1  |    
| instructional  | 2320    | 2180    |         |         | 3-00:00:00 | 1  |    
| largemem       | 208     | 123     | 10      | 2       | 4-00:00:00 | 1  |    
| gpu            | 2372    | 1745    | 67      | 1       | 3-00:00:00 | 3  |    
| bii-gpu        | 608     | 554     |         | 4       | 3-00:00:00 | 1  |    
| bii-largemem   | 288     | 171     |         | 1       | 7-00:00:00 | 1  |

To list the limits, use the command `qlimits`


| Queue           | Maximum    | Maximum        | Minimum      | Maximum       | Maximum       | Default       | Maximum          | Minimum     |
|-----------------|------------|----------------|--------------|---------------|---------------|---------------|------------------|-------------|
| **(partition)** | **Submit** | **Cores(GPU)** | **Cores**    | **Mem/Node**  | **Mem/Core**  | **Mem/Core**  | **Nodes**    	  | **Nodes**   |
| 	 	  | 	       | **per User**   | **per Job**  | **in MB**     | **in MB**     | **in MB**     | **per Job**   	  | **per Job** |
| bii             | 10000      | cpu=400        |              | 354000+       |               | 9400          | 112              |             |
| standard        | 10000      | cpu=1000       |              | 255000+       |               | 9000          | 1                |             |
| dev             | 10000      | cpu=16         |              | 127000+       | 9000          | 6000          | 2                |             |
| parallel        | 2000       | cpu=1000       | 4            | 384000        | 9600          | 9000          | 25               | 2           |
| instructional   | 2000       | cpu=20         |              | 112000+       |               | 6000          | 5                |             |
| largemem        | 2000       | cpu=32         |              | 1000000+      | 64000         | 60000         | 2                |             |
| gpu             | 10000      | gres/gpu=32    |              | 128000+       | 32000         | 6000          | 4                |             |
| bii-gpu         | 10000      |                |              | 384000+       |               | 9400          | 12               |             |
| bii-largemem    | 10000      |                |              | 1500000       |               | 31000         | 2                |             |

## Linux commands for HPC

Many useful commands can be found in Gregor's book at 

* <https://cloudmesh-community.github.io/pub/vonLaszewski-linux.pdf>

The following additional commands are quite useful on HPC systems

| command | description|
| --- | --- |
| `allocations`| check available account and balance |
| `hdquota` | check storage you has used
| `du -h --max-depth=1` | check which directory uses most space |

## SLURM Batch Parameters

We present next a number of default parameters for using a variety of
GPUs on rivanna. Please note that you may need to adopt some
parameters to adjust for cores or memory according to your
application.

### Running on v100

```
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=MYNAME
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err
```


### Running on a100-40GB

```
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=MYNAME
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err
```
 

### Running on special fox node a100-80GB

```
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=MYNAME
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err
#SBATCH --reservation=bi_fox_dgx
#SBATCH --constraint=a100_80gb
```




## Some suggestions

When compiling large projects, you may neeed to make surue you have
enough time and memory to conduct such compiles. This can be best
achieved by using an interactive node, possibly from the large memory
partition. 


## References

* Presentation about [SLURM on rivanna](https://docs.google.com/presentation/d/1Xt4kOtQpvl1JTDETJkOS-OMi8csZsJJw03xGus3QLA0)
* [Tutorial on using Rivanna](https://github.com/cybertraining-dsc/reu2022/blob/main/project/hpc/rivanna-introduction.md)
* Gregors book chapters
  * <https://github.com/cloudmesh-community/book/tree/main/chapters>
* MPI with python: 
  * <https://cloudmesh.github.io/cloudmesh-mpi/report-mpi.pdf>
  * <https://github.com/cloudmesh/cloudmesh-mpi>
  * Tutorials about cybertraining: <https://cybertraining-dsc.github.io/docs/tutorial/>
  * Modules about cybertraining: <https://cybertraining-dsc.github.io/docs/modules/>

## Help Support

When requesting help from Gregor or anyone make sure to be completley
specify the issue, alot of things cannot be solved if you are not
clear on the issue and where it is occuring. Include:

* The issue you are encountering.
* Where it is occuring.
* What you have done to try to resolve the issue.

A good example is:

I ran application xyz, from url xyz on Rivanna. I placed code in
directory /project/.... or I placed the data in /project/... The
download worked and I placed about 600GB. However when I uncompress
the data with command xyz I get the error xyz. What should we do now?
