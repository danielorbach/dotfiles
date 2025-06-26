REM =============================================================================
REM This script is used to install a suite of applications via winget for setting
REM up a Windows development environment. When executed, it will automatically
REM install software such as Windows Terminal, Git, Docker Desktop, and others.
REM Winget is a package manager for Windows that simplifies software installs.
REM =============================================================================

REM --- Core & Developer Tools ---
winget install --id "Microsoft.WindowsTerminal"

REM --- Security & Productivity ---
winget install --id "AgileBits.1Password"

REM --- Containers & Virtualization ---
winget install --id "Docker.DockerDesktop"
winget install --id "Kubernetes.minikube"

REM --- Version Control & Code Hosting ---
winget install --id "Git.Git" (--override "/LOADINF=Git.Git.inf")
winget install --id "GitHub.GitHubDesktop"
winget install --id "GitHub.cli"
REM winget install --id "GnuWin32.Make"

REM --- Integrated Development Tools ---
winget install --id "JetBrains.Toolbox"
winget install --id "GoLang.Go"
winget install --id "Microsoft.VisualStudioCode"

REM --- Scripting & System Utilities ---
winget install --id "Microsoft.PowerShell"
winget install --id "Microsoft.PowerToys"
winget install --id "Microsoft.Office"
winget install --id "Microsoft.OneDrive"
winget install --id "Microsoft.Teams"
winget install --id "Microsoft.AzureStorageExplorer"
winget install --id "Microsoft.AzureCLI"

REM --- Personal Organization ---
winget install --id "Notion.Notion"

REM --- Browsers ---
winget install --id "Google.Chrome"

REM --- Peripherals Configuration ---
REM Logitech device management software
winget install --id "LogiBolt"
winget install --id "Logitech.Options"
winget install --id "Logitech.CameraSettings"

REM --- Microsoft Store Apps ---
winget install --id Microsoft.SysinternalsSuite
winget install --id Microsoft.Todos

REM --- Network Analysis Tools ---
winget install --id "WiresharkFoundation.Wireshark"
winget install --id "NpcapInst"

REM --- Optional Manufacturer Utilities ---
REM winget search "Lenovo Commercial Vantage"

REM --- Music Streaming ---
winget install --id "Spotify"
