## High Performance Data Engineering with Cylon on Amazon Web Services

In recent years the data engineering discipline has been greatly impacted by Artificial Intelligence (AI) and Machine Learning (ML). The effect has ushered in research related to the speed, performance, and optimization of such processes[2]. To meet these ends, many frameworks have been proposed.  One such framework is CylonData[1].  CylonData represents an architecture where performance critical operations are moved to a highly optimized library. Moreover, the architecture provides the capability to leverage the performance associated with in-memory data and distributed operations and data across processes, a key requirement related to processing large data engineering  workloads at scale. Such benefits are realized, for example, in the conversion from tabular or table format to tensor format required for ML/DL or via the use of relational algebraic expressions such as joins, select, project, etc. More specifically Cylon is described as "...a fast, scalable distributed memory data parallel library for processing structured data...”[1].  While CylonData has focused on a MPI implementation using HPC ML resources, the research work here is to port this to a serverless compute infrastructure within AWS services such as AWS Lambda, ECS, EC2, Route 53, ALB, and EFS.  Once this is completed we will be achieving two things. First, we will be showcasing this work will be available not only on HPC but also on AWS serverless and serverful compute resources.  Second, we will be able to provide an extensive benchmark comparison between HPC and Serverless/Serverful Computing to showcase the strengths and weaknesses of both approaches.


## Deliverables

* https://github.com/cylondata/cylon
* report (TBD)
* paper (TBD)

## Timeline

* 1, April 2023: Merge of UCC/UCX Bootstrapping to cylondata/man
* 25, April 2023: Execution of Serverful Cylon Delivered via ECS Infrastructure using OpenMPI
* 10, May 2023: Prototype of Servlerless delivery of cylon library via AWS Lambda Layers
* 30, May 2023: Serverless Cache infrastructure fascade prototype and support via abstraction in the cylon source 

## References
1. "Cylon." cylondata/cylon, https://github.com/cylondata/cylon/.  Accessed 9 September 2022.
2.  "Cylon Library for Fast & Scalable Data Engineering." Cylon Blog, https://supun-kamburugamuve.medium.com/cylon-library-for-fast-scalable-data-engineering-bf74742fe5d1.  Accessed 9 September 2022.