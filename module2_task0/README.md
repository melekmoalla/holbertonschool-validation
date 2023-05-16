## Print a list of all the goals with descriptions.
help:
    @echo "Available targets:"
    @echo ""
    @echo "help    : Print a list of all the goals with descriptions."
    @echo "build   : Compile the source code of the application to a binary."
    @echo "run     : Run the application in the background and write logs to a file."
    @echo "stop    : Stop the running application."
    @echo "clean   : Stop the application, delete binary and log files."
    @echo "test    : Test the application by sending HTTP requests."
    @echo ""

## Prerequisites
- Go installed on your local machine
- Port 9999 available for running the server

## Lifecycle
This project follows the following life-cycle stages:

- `build`: Compiles the source code of the application to a binary.
- `run`: Runs the application in the background and writes logs to a file.
- `stop`: Stops the running application.
- `clean`: Stops the application, deletes the binary and log files.
- `test`: Tests the application by sending HTTP requests.

Please refer to the Makefile for more details on each stage.
