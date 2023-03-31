---
title: "Rivanna and singularity"
linkTitle: "Singularity"
weight: 100
description: >-
     Singularity.
---

## Singularity

Links

special nodes to create images on rivanna: `biihead1.bii.virginia.edu` and `biihead2.bii.virginia.edu`

the exact command to build singularity image:

```bash
sudo /opt/singularity/3.7.1/bin/singularity build output_image.sif build.def
```

## build.def

Here shows an example head of `buid.def` file to build image based on [NVIDIA NGC PyTorch container](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch).

```
Boostrap: docker
From: nvcr.io/nvidia/pytorch:23.02-py3
```

Following the head of definition file, there are several sections for different set up purposes, which you should refer to <https://docs.sylabs.io/guides/3.7/user-guide/definition_files.html#sections>

### Why NVIDIA NGC?

Because it is tested and guaranteed for reliability and peformance by NVIDIA, which is the most widely adopted reference environment (base image) for building images using NVIDIA GPU. Besides PyTorch, it also provides images for TensorFlow and many HPC applications.

## Work with Singularity container

reference: <https://www.rc.virginia.edu/userinfo/rivanna/software/containers/>


### Run GPU images

To use NVIDIA GPU with Singularity, `--nv` flag is needed.

```basg
singularity exec --nv output_image.sif python myscript.py
```

Since Python is defined as the default command to be excuted and singularity passes the argument(s) after the image name, i.e. myscript.py, to the Python interpreter. So the above singularity command is equivalent to

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