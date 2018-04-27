# https://joonro.github.io/blog/posts/powershell-customizations.html
function prompt {
    $origLastExitCode = $LastExitCode
    
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor Magenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    Write-Host $curPath -NoNewline -ForegroundColor Blue
    Write-Host "  " -NoNewline

    Write-VcsStatus

    $LastExitCode = $origLastExitCode
    "`n$('>' * ($nestedPromptLevel + 1)) "
}

# https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
Import-Module posh-git

# for colorizing ll and ls
Import-Module Get-ChildItemColor
Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

# to get vim working in powershell
$VIMPATH = "C:\Users\dordas\Documents\WindowsPowerShell\Scripts\vim80\vim.exe"
Set-Alias vim  $VIMPATH