$source = 'C:\source' 

If (!(Test-Path -Path $source -PathType Container)) {New-Item -Path $source -ItemType Directory | Out-Null} 

$packages = @( 
@{title='7zip Extractor';url='http://superb-dca2.dl.sourceforge.net/project/sevenzip/7-Zip/9.20/7z920-x64.msi';Arguments=' /qn';Destination=$source}, 
@{title='Putty 0.63';url='http://the.earth.li/~sgtatham/putty/0.64/x86/putty-0.64-installer.exe';Arguments=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-';Destination=$source} 
@{title='Notepad++ 6.6.8';url='https://notepad-plus-plus.org/repository/6.x/6.7.8/npp.6.7.8.Installer.exe';Arguments=' /Q /S';Destination=$source} 
) 


foreach ($package in $packages) { 
        $packageName = $package.title 
        $fileName = Split-Path $package.url -Leaf 
        $destinationPath = $package.Destination + "\" + $fileName 

If (!(Test-Path -Path $destinationPath -PathType Leaf)) { 

    Write-Host "Downloading $packageName" 
    $webClient = New-Object System.Net.WebClient 
    $webClient.DownloadFile($package.url,$destinationPath) 
    } 
    }

 
#Once we've downloaded all our files lets install them. 
foreach ($package in $packages) { 
    $packageName = $package.title 
    $fileName = Split-Path $package.url -Leaf 
    $destinationPath = $package.Destination + "\" + $fileName 
    $Arguments = $package.Arguments 
    Write-Output "Installing $packageName" 


Invoke-Expression -Command "$destinationPath $Arguments" 
}