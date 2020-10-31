$programs = @(
    "firefox", # web stuff
    "dicord",
    "googlechrome.dev",
    "google-backup-and-sync",
    "spotify",
    "mullvad-app",
    "steam", # games
    "epicgameslauncher",
    "dwarf-fortress",
    "gimp", # photo editing
    "krita",
    "vlc", # video player
    "python3", # languages
    "golang",
    "nodejs",
    "docker-desktop", # dev tools
    "virtualbox",
    "vagrant",
    "vim", # editors
    "vscode",
    "powertoys", # win utils
    "microsoft-windows-terminal",
    "powershell-core",
    "sysinternals",
    "curl", # unix utils
    "git",
    "ssh-copy-id",
    "rsync",
    "autohotkey", # 3rd party
    "notion",
    "7zip"
)

function PrintProgs() {
    Write-Output "----------------------------------------"
    Write-Output "The following programs will be installed: "
    Write-Output "----------------------------------------"
    Write-Output ""
    Write-Output -Separator ', ' $programs
    Write-Output ""
}

function InstallProgs() {
    foreach ($prog in $programs) {
        choco install "$prog" -y;
    }
    
}

function PrintHelp() {
    Write-Output "Usage: " + $MyInvocation.ScriptName + "[option]"
    Write-Output ""
    Write-Output "Options:"
    Write-Output "-h,--help,help        print this help message"
    Write-Output "-l,list,show,print    print all programs"
}

foreach ($arg in $args) {
    if ($arg -eq "-h") {
        PrintHelp
    }
    if ($arg -eq "-l") {
        PrintProgs
    }
}
