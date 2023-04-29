# OpenCL Terminologies, Glossary and Concepts

## Terminologies
+ Kernel : A Function; 1 Kernel = 1 Function
- The (Command) Queue
    + The queue is like a buffer container that will store the instructions sent to and from device and the host in order; Duplex operation
    + Send instructions to the buffer from the host, then the queue will send the buffer to the device and vice versa
    + Needs to be pushed to the device by 'Enqueueing' the kernel for execution
+ Host : Computer
+ Device : the CPU/GPU
+ Data Transfer: The host and device uses a seperate buffer for data transfer due to the speed differences between the host and the device (CPU/GPU)
- Buffer : A temporary container containing the data such that when it is ready, it can be read by the host and device
    + This is required due to speed differences between the host and the device

## Concepts
- Enqueue kernel for execution
    + Try to push the instructions in the buffer into the device to start running (Start Running the kernel function in the device)
    + Each function/kernel will require a command queue

