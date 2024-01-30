# Dockerfile - ARG vs ENV

## Key Differences
+ ARG is used to define build-time variables, whereas ENV is used to define run-time variables.
+ ARG is not available in the final image, whereas ENV is set in the final image.
+ ARG can be overridden during the build process using the — build-arg flag, whereas ENV cannot be overridden during the build process.
+ ARG is used to customize the build process, whereas ENV is used to configure the container environment.
+ ARG is typically used for passing build-time arguments to Dockerfile, whereas ENV is used for setting environment variables, defining the working directory, and setting user.

## Summary
- ARG is used to declare and initialize local variables within the Docker image build file (Dockerfile) while ENV is used to declare and initialize Environment Variables that should be parsed/initialized in the container environment runtime
    - ARG is used during build-time as a local variable instance to be used in the docker image builder, 
        - arguments/variables specified with 'ARG' will not be set as an environment variable within the container
        - arguments/variables specified with 'ENV' will be set as an environment variable within the container

