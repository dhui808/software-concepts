## Windows Subsystem for Linux (WSL) - requirement for Docker
  https://docs.microsoft.com/en-us/windows/wsl/install-win10
  Enable the Windows Subsystem for Linux
    PowerShell as admin user: dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    Or Control Panel -> Programs -> Turns Windows features on or off, check Windows Subsystem for Linux
  Enable Virtual Machine feature
    PowerShell as admin user: dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Or Control Panel -> Programs -> Turns Windows features on or off, check Virtual Machine Platform
  Download the Linux kernel update package

  Set WSL 2 as your default version
    PowerShell as admin user: wsl --set-default-version 2
  Install your Linux distribution of choice
  Install Windows Terminal (optional)
