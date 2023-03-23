---
title: "OSMI"
date: 2020-03-20
weight: 2
description: >
  OSMI
---

## MLCommons OSMI Benchmark

OSMI-Bench explores the optimal deployment of machine-learned surrogate (MLS) models in rotorcraft aerodynamics on high-performance computers (HPC). In this benchmark, we test three rotorcraft models for optimal deployment configurations, including, Long Short Term Memory (LSTM), Convolutional Neural Network (CNN), and Temporal Convolutional Neural Network (TCNN) models with 2M, 44M, and 212M trainable parameters respectively [1]. Surrogate models trained on synthetic data were selected because we are solely focused on inference efficiency not model accuracy. We are now running the benchmark on the Rivanna HPC at the University of Virginia to find the optimal deployment scenario for each model, and we plan to develop more models to benchmark, such as a transformer-encoder natural language model. We are also investigating the relationship between batchsize, GPU, and concurrency and inference throughput/time. We will soon explore running the load balancers used in the OSMI-Bench framework, such as Python concurrent.futures threadpool, HAProxy and mpi4py, on Rivanna.

## Deliverables

* gitrepo[https://github.com/laszewsk/osmi]
* report (TBD)
* paper (TBD)

## Timeline

* 31 March 2023: Graph the relationship between configuration and inference performance for each model, complete OSMI-Bench documentation for Rivanna
* 15 April: Run load balancer on Rivanna
* 1 May 2023: Develop and benchmark new models

## References

1. Wesley Brewer et al. "Production Deployment of Machine-Learned Rotorcraft Surrogate Models on HPC", 2021 IEEE/ACM Workshop on Machine Learning in High Performance Computing Environments (MLHPC), 15 November 2021, 10.1109/MLHPC54614.2021.00008, [https://ieeexplore.ieee.org/document/9652868]
