---
title: "Data Compiler"
date: 2020-03-20
weight: 2
description: >
  Optimizing Large-Scale Deep Learning by Data Movement-Aware Compiler
---


## Optimizing Large-Scale Deep Learning by Data Movement-Aware Compiler

Projet Members

* [Tianle Zhong](https://luosuu.github.io/) 

## Project Summary

This project aims to address the data movement, as a known major efficiency bottleneck of distributed training[1], by designing a tensor compiler[2] which can acquire and optimize the data movement graph and scheduling at the compilation time so that the execution becomes fully static for higher performance. Such Ahead-of-Time(AOT) optimization also enables opportunities for auto-parallelism and pipelining like [3, 5]. The current exploration is about leveraging Multi-Level Intermediate Representation (MLIR)[4] to include data movement information into the compilation passes.

## Deliverables

* Proposal: WIP
* GitHub repo: not ready for open access
* Report: TBD
* Paper: TBD

## Timeline

1. 15 April 2023: Define a MLIR dialect which can describe data movement of deep learning
2. 1 June 2023: Figure out the optimization over the dialect converting and lowering passes
3. 15 July 2023: Prototype the backend code generation for real-world tests

## Reference

1. Ivanov, Andrei, et al. "Data movement is all you need: A case study on optimizing transformers." *Proceedings of Machine Learning and Systems* 3 (2021): 711-732. available at https://arxiv.org/abs/2007.00072
2. Kjolstad, Fredrik, et al. "The tensor algebra compiler." *Proceedings of the ACM on Programming Languages* 1.OOPSLA (2017): 1-29. available at https://dl.acm.org/doi/10.1145/3133901
3. Yuan, Jinhui, et al. "Oneflow: Redesign the distributed deep learning framework from scratch." *arXiv preprint*. https://arxiv.org/abs/2110.15032
4. Vasilache, Nicolas, et al. "Composable and modular code generation in MLIR: A structured and retargetable approach to tensor compiler construction." *arXiv preprint*. https://arxiv.org/abs/2202.03293
5. Zheng, Lianmin, et al. "Alpa: Automating Inter-and {Intra-Operator} Parallelism for Distributed Deep Learning." *16th USENIX Symposium on Operating Systems Design and Implementation (OSDI 22)*. available at https://arxiv.org/abs/2201.12023
