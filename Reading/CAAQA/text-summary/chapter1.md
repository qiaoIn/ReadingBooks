# Summary on Chapter1

## Introduction

> This text is about the architecture ideas and accompanying compiler improvements that made the incredible growth rate possible in the last century, the reasons for the dramatic change, and the challenges and initial promising approaches to architecture ideas, compilers, and interpreters for the 21st century. At the core is a quantitative approach to computer design and analysis that uses empirical observersions of programs, experimentation, and simulation as its tools.

![growth_in_processor_performance](http://7xrxoi.com1.z0.glb.clouddn.com/growth_in_processor_performance.png)

The figure above shows that the combination of architectural and organizational enhancements led to 17 years of sustained growth in performance at an annual rate of over 50% from 1986 to 2003. And the effect of this dramatic growth rate has been fourfold.
- enhanced the capability available to computer users;
- new classed of computers;
- the dominance of microprocessor-based computers across the entire range of computer design;
- software development, trade performance for productivity.

Since 2003, single-processor performance improvement has dropped to less than 22% per year, due to two reasons --
1. how to deal with power dissipation of aircooled chips;
2. the lack of more instruction-level parallelism to exploit efficiently.

> Indeed, in 2004 Intel canceled its high-performance uniprocessor projects and joined others in declaring that the road to high performance would be via **multiple processors per chip** rather than via faster uniprocessor.

为了获得更高性能的处理器，应当提高一个芯片上集成的核心数目，而不是加快单核处理器的速度。

Now that, we must switch from relying solely on instruction-level parallelism (ILP) to data-level parallelism (DLP) and thread-level parallelism (TLP), and also warehouse-scale computers and request-level parallelism (RLP).
- implicitly parallel: ILP;
- explicitly parallel: DLP, TLP, RLP.

## Classes of Computers

five different computing markets, each characterized by different applications, requirements, and computing technologies.
- personal mobile device (PMD);
- desktop;
- server;
- clusters/warehouse-scale computer;
- embedded.

### Classed of Parallelism and Parallel Architectures

Two kinds of parallelism in applications:
1. Data-Level Parallelism (DLP) -- many data items that can be operated on at the same time;
2. Task-Level Parallelism (TLP) -- tasks can operate independently and largely in parallel.

Computer hardware in turn can exploit these two kinds of application parallelism in four major ways:
1. Instruction-Level Parallelism;
2. Vector Architectures and Graphic Processor Units (GPUs);
3. Thread-Level Parallelism;
4. Request-Level Parallelism.

Flynn's Classification (富林分类法)
- Single instruction stream, single data stream (SISD);
- Single instruction stream, multiple data stream (SIMD);
- Multiple instruction stream, single instruction stream (MISD);
- Multiple instruction stream, multiple instruction stream (MIMD).

## Defining Computer Architecture


## Trends in Technology


## Trends in Power and Energy in Integrated Circuits


## Trends in Cost


## Dependability


## Measuring, Reporting, and Summarizing Performance


## Quantitative Principles of Computer Design


## Putting It All Together: Performance, Price, and Power


## Fallacies and Pitfalls
