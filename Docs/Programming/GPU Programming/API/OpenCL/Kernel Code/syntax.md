# OpenCL Programming Language Kernel code syntax and documentation

## Documentation
### Synopsis/Syntaxes
- Kernel/Function Signature: 
    ```cl 
    __kernel function_name(argument_signature)
    {

    }
    ```

### Snippets and Examples/Usage
- Create a context based on a device
    ```cpp
    // create a context from device
    Context context = cl::Context(device);
    ```

- Get devices from the context
    ```cpp
    // get devices from the context
    std::vector<cl::Device> contextDevices = context.getInfo<CL_CONTEXT_DEVICES>();
    ```

- Try to find the OpenCL kernel (.cl) file in the same working directory as the cpp file
    ```cpp
    // open input file stream to .cl file
    std::ifstream programFile("kernels.cl");

    // check whether file was opened
    if (!programFile.is_open())
    {
        quit_program("File not found.");
    }
    ```

- create program string and load contents from the file
    ```cpp
	std::string programString(std::istreambuf_iterator<char>(programFile), (std::istreambuf_iterator<char>()));
    ```

- create program source from one input string
    ```cpp
	cl::Program::Sources source(1, std::make_pair(programString.c_str(), programString.length() + 1));
    ```

- create program from source
    ```cpp
	cl::Program program(context, source);
    ```

- Create all kernels found in the kernel file automatically (Overwrites the individual kernel creation process
    ```cpp
    std::vector<cl::Kernel> allKernels;		// all kernels
    // create all kernels in the program
    program.createKernels(&allKernels);
    ```
    - Manually creating and specifying kernel code one-by-one (Not Recommended)
        ```cpp
        cl::Kernel multKernel(program, "kernel-function-name");
        ```

- Create a kernel/function
    ```cpp
	kernel = cl::Kernel(program, "kernel-function-name");
    ```

- Create a CommandQueue
    ```cpp
    queue = cl::CommandQueue(context, device);
    ```

- Set a Kernel Argument
    ```cpp
    // set kernel argument
    int a = 0;
    kernel.setArg(0, a);
    ```

- enqueue kernel for execution
	+ Try to push the instructions in the buffer into the device to start running (Start Running the kernel function in the device)
    + Each function/kernel will require a command queue
	```cpp 
    queue.enqueueTask(kernel);
    ```

