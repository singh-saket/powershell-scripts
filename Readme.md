# PowerShell Scripts

## Overview

Welcome to the repository for PowerShell Scripts. This repository contains PowerShell scripts designed for various purposes.

### Prerequisites

If we download any of the "PowerShell" script and try to execute it on "PowerShell" terminal, it will throw the below error.

Error : The file "specific PowerShell script file name" is not digitally signed. You cannot run this script on the current system.

Whenever this error occurred, we have to execute the following command using "PowerShell" terminal and the error will be resolved.

    ```command
    Set-ExecutionPolicy Bypass -Scope Process
   ```

### 1] create-nondocker-desktop-config-file.ps1

This PowerShell script is used to create "config" folder and "daemon.json" file along with the required configurations. It is being used to add the configuration file, when we are using "Docker" engine without "Docker Desktop", as by using this configuration file, we are able to debug the docker base project solutions.

