# Prerequisites

    Use the theme “ananke” for the website by following this Quickstart
    If you are using the sandboxe, do NOT install hugo with the package 
    manager. Download the correct executable or package file from their github.
    Usage of Git Submodules is prohibited: there should be no file 
    .gitmodules
    The website title should be “Awesome Inc.”
    The contents consists in a single blog post which title should be “Welcome 
    to Awesome Inc.”, stored in a file named welcome.md
    All of the website’s source code is stored under a directory named 
    module1_task0
    The command line hugo in version 0.84.0 must be used
    The website is expected to be generated into the directory module1_task0/dist/
    The directory module1_task0/dist/ must not be committed (it should be 
    absent from the repository)
    Makefile present

## Lifecycle

    “build”: Generate the website from the markdown and configuration files in 
    the directory dist/.
    “check” should fail when one of the 2 following steps fails.
    “validate” should validate the file ./dist/index.html by using the command 
    line Holberton’s W3C Validator, but should not fail if the file is not valid.
    “clean”: Cleanup the content of the directory dist/
    “post”: Create a new blog post whose filename and title come from the 
    environment variables POST_TITLE and POST_NAME.
    “help”: Show help for all command.
