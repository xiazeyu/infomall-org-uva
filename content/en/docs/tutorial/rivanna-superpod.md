---
title: "Rivanna Pod"
linkTitle: "Rivanna Pod"
weight: 9
description: >
  Rivanna
---

{{% pageinfo %}}

This documentation is so far only useful for betatesters. In this
group we have

* Gregor von Laszewski

{{% /pageinfo %}}

Dear GPU beta testers,
 
Thank you for signing up as beta testers for the new GPU *POD* on
Rivanna. We appreciate your patience during the longer-than-expected
installation phase. This email will unveil some details about the new
hardware and provide instructions on access and usage.
 
 
 
## Introducing the NVIDIA DGX BasePOD

You might have seen/heard the term *SuperPOD* in our earlier
communications or from other sources. Since then the vendor has
rebranded the specific type purchased by UVA as *BasePOD,* which as of
today is comprised of 10 DGX A100 nodes 8 A100 GPU devices and 2 TB
local node memory (per node) 80 GB GPU memory (per GPU device) I’ll
just refer to it as the *POD* for the remainder of the email.
 
Unbeknown to most users, these nodes have been up and running on
Rivanna since last summer as regular GPU nodes. We are pleased to
inform you that the following Advanced Features have now been enabled
on the POD:

* NVLink for fast multi-GPU communication
* GPUDirect RDMA Peer Memory for fast multi-node multi-GPU communication
* GPUDirect Storage with 200 TB IBM ESS3200 (NVMe) SpectrumScale storage array
 
What this means to you is that the POD is ideal for the following scenarios:

* The job needs multiple GPUs and/or even multiple nodes.
* The job (can be single- or multi-GPU) is I/O intensive.
* The job (can be single- or multi-GPU) requires more than 40 GB GPU
  memory. (We have 12 A100 nodes in total, 10 of which are the POD and
  2 are regular with 40 GB GPU memory per device.)
 
Detailed specs can be found in the official document (Chapter 3.1):
 
* <https://docs.nvidia.com/dgx-basepod-reference-architecture-dgx-a100-and-dgx-h100.pdf>
 
 
## Accessing the POD
 
### Allocation

As a token of appreciation, we have created a *superpodtest*
allocation such that you may run benchmarks and tests without spending
your own allocation. A single job can request up to 4 nodes with 32
GPUs. Before running multi-node jobs, please make sure it can scale
well to 8 GPUs on a single node.
 
We kindly ask you to keep other beta testers and the general users in
mind by refraining from dominating the queue with high-throughput jobs
through this allocation.
 
If you are the PI and wish to delegate the testing work to someone
else in your group, you are welcome to provide one or two names with
their computing IDs.
 
Slurm script
Please include the following lines:

```
#SBATCH -p gpu
#SBATCH --gres=gpu:a100:X # replace X with the number of GPUs per node
#SBATCH -C gpupod
#SBATCH -A superpodtest
 ```

### Open OnDemand

In *Optional: Slurm Option* write:

```
-C gpupod
```

### Remarks

Many of you may have already used the POD by simply requesting an A100
node, since 10 out of the total 12 A100 nodes are POD nodes. Hence, if
you do not see any performance improvement, do not be disappointed.
As we expand our infrastructure, there could be changes to the Slurm
directives and job resource limitations in the future. Please keep an
eye out for our announcements.
 
 
## Usage examples
 
### Deep learning

We will be migrating toward NVIDIA’s NGC containers for deep learning
frameworks such as PyTorch and TensorFlow, as they have been heavily
optimized to achieve excellent multi-GPU performance. These containers
have not yet been installed as modules but can be accessed under
/share/resources/containers/singularity:

* pytorch_23.03-py3.sif
* tensorflow_23.03-tf1-py3.sif
* tensorflow_23.03-tf2-py3.sif

(NGC has their own versioning scheme. The PyTorch and TensorFlow
versions are 2.0.0, 1.15.5, 2.11.0, respectively.)
 
The singularity command is of the form:

```
singularity run --nv /path/to/sif python /path/to/python/script
```

**Warning:** Distributed training is not automatic! Your code must be
parallelizable. If you are not familiar with this concept, please
visit:

* TF distributed training <https://www.tensorflow.org/guide/distributed_training>
* PyTorch DDP <https://pytorch.org/docs/stable/notes/ddp.html>
 
### MPI codes

Please check the manual for your code regarding the relationship
between the number of MPI ranks and the number of GPUs. For
computational chemistry codes (e.g. VASP, QuantumEspresso, LAMMPS) the
two are oftentimes equal, e.g.

```
#SBATCH --gres=gpu:a100:8
#SBATCH --ntasks-per-node=8
```

If you are building your own code, please load the modules nvhpc and
cuda which provide NVIDIA compilers and CUDA libraries. The compute
capability of the POD A100 is 8.0.
 
For documentation and demos, refer to the *Resources* section at the
bottom of this page: <https://developer.nvidia.com/hpc-sdk>
 
 
We will be updating our website documentation gradually in the near
future as we iron out some operational specifics. GPU-enabled modules
are now marked with a (g) in the *module avail* command as shown
below:


TODO: output from maodule avail to be included
 
 
