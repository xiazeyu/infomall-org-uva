---
title: "Rivanna"
linkTitle: "Rivanna"
weight: 9
description: >
  Rivanna
---

{{% pageinfo %}}
Rivanna
{{% /pageinfo %}}

## Presentations

* SLURM: <https://docs.google.com/presentation/d/1Xt4kOtQpvl1JTDETJkOS-OMi8csZsJJw03xGus3QLA0>

## Set up the connection (mac/Linux)

You should check [MobaXterm](https://www.rc.virginia.edu/userinfo/rivanna/logintools/mobaxterm/) first if using windows.

Once you are added to the group, you will receive an invitation email to set up the password for research computing support portal. This password is also the password that you will use to log in the system. 

After the password is ready, you can try to log in through the [Web-based access](https://www.rc.virginia.edu/userinfo/rivanna/login/) to make sure you have the proper access already.

Then let’s [configure your ssh key-based authentication](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server). The first step is to generate you ssh key pair with the command `ssh-keygen`. After that, if you have already installed `OpenSSH`, the most recommended way is to use a included tool `ssh-copy-id` to make your life easier.

```bash
ssh-copy-id username@rivanna.hpc.virginia.edu
```

You will need your above mentioned password when using `ssh-copy-id`. Your username is typically your computing id.

Then, you should be ready to connect through

```bash
ssh -Y username@rivanna.hpc.virginia.edu
```

After this, I would recommend setting up your [VS code with Remote-SSH](https://code.visualstudio.com/docs/remote/ssh) plugin.

## Example Config file

TODO: add a example config file

## Know where you are at

Typically, You should have access to two places: `/home/<username>` and `/scratch/<username>`

Your `~` alias is linked to `/home/<username>`where your configuration files are located like `~/.ssh` , `~/.bashrc`and `~/.zshrc`

The difference is explained [here](https://www.rc.virginia.edu/userinfo/rivanna/storage/).

## Load modules

```bash
module spider cmake # check whether cmake is available and details
```

Load the needed module (you can add version info). Note that some modules are dependent on other modules (`clang/10.0.1` depends on `gcc/9.2.0` so `gcc` needs to be loaded first.

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

```bash
rivanna$ ijob -c number_of_cpus -A group_name -p queue_name --gres=gpu:gpu_model:number_of_gpus --time=day-hours:minutes:seconds
# example: request a 1 cpu unit with 1 a100 gpu for 10 minutes in 'dev' partition
rivanna$ ijob -c 1 -A bii_dsc_community -p gpu --gres=gpu:a100:1 --time=0-00:10:00
```

Different partition has different available resources and charging rate. `dev` is free but limited to 1 hour for each session and no GPU is available. Use `qlist` to check partitions and `qlimits` check the limits.

## Utilities

Many useful commands can be found in Gregor's book at <https://cloudmesh-community.github.io/pub/vonLaszewski-linux.pdf>

TODO: a table of useful commands and descriptions

`allocations`: check available account and balance

`hdquota`: check storage you has used

`du -h --max-depth=1`: check which directory uses most space

## Other useful scripts

## Some suggestions

When compile large projects, you may face very slow compilation speed which might be caused by the limited memory size on the front end (head node). You can try to use FastX node which have larger memory and could be much faster.
