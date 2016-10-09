# Summary on Chapter1


## Introduction

> This text is about the architecture ideas and accompanying compiler improvements that made the incredible growth rate possible in the last century, the reasons for the dramatic change, and the challenges and initial promising approaches to architecture ideas, compilers, and interpreters for the 21st century. At the core is a quantitative approach to computer design and analysis that uses empirical observersions of programs, experimentation, and simulation as its tools.

![growth_in_processor_performance](http://7xrxoi.com1.z0.glb.clouddn.com/growth_in_processor_performance.png)

The figure above shows that the combination of architectural and organizational enhancements led to 17 years of sustained growth in performance at an annual rate of over 50% from 1986 to 2003. And the effect of this dramatic growth rate has been fourfold.

- enhanced the capability available to computer users;
- new classed of computers;
- the dominance of microprocessor-based computers across the entire range of computer design;
- software development, trade performance for productivity.

Since 2003, single-processor performance improvement has dropped to less than 22% per year, due to two reasons:

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

Some terms:

- **Instruction Set Architecture** (ISA, 指令集体系结构)

  refers to the actual programmer-visible instruction set in this book, serving as the boundary between the software and hardware.

  the seven dimensions of an ISA:

  1. Class of ISA (ISA分类)

     - register-memory ISAs, many instructions can access memory;
     - load-store ISAs, only load or store instructions can access memory.(All recent ISAs are load-store)

  2. Memory addressing (存储器寻址) 字节寻址
  3. Addressing modes (寻址模式)

     立即数寻址、寄存器直接寻址、寄存器间接寻址、基址寻址、变址寻址、etc...

  4. Types and sizes of operands (操作数的类型及大小)

     8-bit (ASCII characterizer), 16-bit (Unicode characterizer or half world), 32-bit (integer or word), 64-bit (double word or long integer), and IEEE 754 floating point in 32-bit (sigle precision) and 64-bit (double precision)

  5. Operations (操作指令)

     data transfer, arithmetic logical, control, and floating point

  6. Control flow instructions (控制语句)

     conditional branches, unconditional jumps, procedure calls, and returns

  7. Encoding an ISA (ISA的编码)

     fixed length and variable length

- **Organization** or **microarchitecture** (组成或微体系结构)

  includes the high-level aspects of a computer's design, such as the memory system, the memory interconnect, and the design of the internal processor or CPU. The term microarchitecture is also used instead of organization.

  Example: two processors with the same instruction set architectures but different organizations are the AMD Opteron and the Intel Core i7, both processors implement th x86 instruction set, but they have very different pipeline and cache organizations.

  two synonyms

  1. use the term *core* instead of *processor*
  2. use the term *multicore* instead of *multiprocessor microprocessor*


- **Hardware** (硬件)

  refers to the specifics of a computer, including the detailed logic design and the packaging technology of the computer. Often a line of computers (系列机) contains computers with identical instruction set architectures and nearly identical organizations, but they differ in the detailed hardware implementation.

- **Computer Architecture** covers all three aspects of computer design -- instruction set architecture (ISA), organization or microarchitecture, and hardware.


## Trends in Technology

Five rapid changes in implementation technology:

- Integrated circuit logic technology: Moore's law
- Semiconductor DRAM: the rate slow down
- Semiconductor Flash:
- Magnetic disk technology
- Network technology

### Performance Trends: Bandwidth over Latency

- *bandwidth* or *throughput* is the total amount of work done in a given time;
- latency or response time is the time between the start and the completion of an event;
- bandwidth has outpaced latency across these technologies and will likely continue to do so.

### Scaling of Transistor Performance and Wires

- feature size: the minimum size of a transistor or a wire in either the x or y dimension.

- Since the transistor count per square millimeter of silicon is determined by the surface area of a transistor, the density of transistors increases quadratically with a linear decrease in feature size. (由于每平方毫米硅片上的晶体管数目是由单个晶体管的表面积大小所决定的，所以当特征尺寸线性下降时，晶体管密度将以平方曲线上升。)

- Transistor performance improves linearly with decreasing feature size.


## Trends in Power and Energy in Integrated Circuits

Power is the biggest challenge facing the computer designer for nearly every class of computer.

### Power and Energy: A Systems Perspective

From the viewpoint of a system designer, there are three primary concerns about performance, power, and energy.

1. provide enough power to ensure orrect operation
2. sustained power consumption
   thermal design power (TDP), cooling system,
3. energy and energy efficiency

   > Which metric is the right one for comparing prodessors: energy or power?

   > In general, energy is always a better metric because it is tied to a specific task and the time required for that task.

   > If we want to know which of two prodessors is more efficient for a given task, we should compare energy comsumption (not power) for executing the task.

### Energy and Power within a Microprocessor

- dynamic energy

  Energy_dynamic ∝ Capacitive load * square(Voltage)

- the logic transition of 0 -> 1 -> 0 or 1 -> 0 -> 1

  Energy_dynamic ∝ 1/2 * Capacitive load * square(Voltage)

- dynamic power

  Power_dynamic ∝ 1/2 * Capacitive load * square(Voltage) * Frequency switched

- For a fixed task, slowing clock rate reduces power, but not energy.

- As we move from one process to the next, the increase in the number of transistors switching and the frequency with which they switch dominate the decrease in load capacitance and voltage, leading to an overall growth in power consumption and energy. (当我们从一种制造工艺转向另一种工艺时，晶体管的开关次数以及其开关频率的增高强于负载电容和电压的下降，从而导致功耗和能耗的总体上升。)

- Power is now the major constraint to using transistors. Hence, modern microprocessors offer many techniques to try to improve enery efficiency despite flat clock rates and constant supply voltages:

  1. Do nothing well (以逸待劳)
  2. Dynamic Voltage-Frequency Scaling (DVFS, 动态电压-频率调整)
  3. Design for typical case (针对典型情景的设计)
  4. Overclocking (超频)

- Static power

  Power_static ∝ Current_static * Voltage

  static power is proportional to number of devices, the only hope to stop leakage is to turn off power to subsets of the chips.

- The importance of power and energy has increased the scrutiny on the efficiency of an innovation, so the primary evaluation now is tasks per joule or performance per watt as opposed to performance per mm^2 of solicon. (由于功率和能耗的重要性，人们在评价一项创新时，更加重视对其效率的审核。因此，现在的主要评价指标是每焦耳完成的任务数或者每瓦特实现的性能，而不再是每平方毫米的硅所实现的性能。)


## Trends in Cost


## Dependability (without)


## Measuring, Reporting, and Summarizing Performance


## Quantitative Principles of Computer Design


## Putting It All Together: Performance, Price, and Power


## Fallacies and Pitfalls
