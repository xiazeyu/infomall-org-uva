---
title: "Rivanna and singularity"
linkTitle: "Singularity"
weight: 100
description: >-
     Singularity.
---

## Singularity

### build.def

Here shows an example head of `buid.def` file to build image based on [NVIDIA NGC PyTorch container](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch).

```
Bootstrap: docker
From: nvcr.io/nvidia/pytorch:23.02-py3
```

Following the head of definition file, there are several sections for
different set up purposes, which you should refer to
<https://docs.sylabs.io/guides/3.7/user-guide/definition_files.html#sections>

### Creating the Singularity Image

In order for you to create a singularity container from the
`build.def` file please login to either of the following special nodes
on Rivanna:

* `biihead1.bii.virginia.edu` 
* `biihead2.bii.virginia.edu`

For example: 

```bash
ssh $USER@biihead1.bii.virginia.edu
```

where $USER is your computing ID on Rivanna.

Now that you are logged in to the special node, you can create the
singularity image with the following command:

```bash
sudo /opt/singularity/3.7.1/bin/singularity build output_image.sif build.def
```

Note: **It is important that you type in only this command. If you modify
the name output_image.sif or build.def the command will not work and you will
recieve an authorization error.**

In case you need to rename the image to a better name please use the `mv` command.


In case you also need to have a different name other then build.def the following commands are recommended. We assime you use `myimage.def` and `myimage.sif`. Bet is to include it into a makefile such as:

```
BUILD=myimage.def
IMAGE=myimage.sif

image:
	cp $BUILD build.def
	sudo /opt/singularity/3.7.1/bin/singularity build output_image.sif build.def
	cp output_image.sif $IMAGE
	make -f clean

clean:
	rm -rf build.def output_image.sif
	
```

Placing it in a	`Makefile` will now allow you to use the command

```bash
make image
```

and the image `myimage.sif` will be created. with make clean you will
delete the temporary files `build.def and `output_image.sif`
	


### Why NVIDIA NGC?

Because it is tested and guaranteed for reliability and peformance by
NVIDIA, which is the most widely adopted reference environment (base
image) for building images using NVIDIA GPU. Besides PyTorch, it also
provides images for TensorFlow and many HPC applications.

## Work with Singularity container

reference: <https://www.rc.virginia.edu/userinfo/rivanna/software/containers/>


### Run GPU images

To use NVIDIA GPU with Singularity, `--nv` flag is needed.

```basg
singularity exec --nv output_image.sif python myscript.py
```

Since Python is defined as the default command to be excuted and
singularity passes the argument(s) after the image name,
i.e. myscript.py, to the Python interpreter. So the above singularity
command is equivalent to

```bash
singularity run --nv output_image.sif myscript.py
```

### Run Images Interactively

```bash
ijob  -A mygroup -p gpu --gres=gpu -c 1
module purge
module load singularity
singularity shell --nv output_image.sif
```

## Singularity Filesystem on Rivanna

The following paths are exposed to the container by default

* /tmp
* /proc
* /sys
* /dev
* /home
* /scratch
* /nv
* /project

### Adding Custom Bind Paths

For example, the following command adds the /scratch/$USER directory as an overlay without overlaying any other user directories provided by the host:

```bash
singularity run -c -B /scratch/$USER output_image.sif
```

To add the /home directory on the host as /rivanna/home inside the container:

```bash
singularity run -c -B /home:/rivanna/home output_image.sif
```

## Additional Suggestions

Manage images like

```
<your-path>/singularity-images/<env-name>/output_image.sif
```
