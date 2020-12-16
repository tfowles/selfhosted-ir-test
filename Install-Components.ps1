param($IntegrationRuntimeAuthkey)

$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=243737_61ae65e088624f5aaa0b1d2d801acb16" -OutFile "JavaRuntimeEnvironment.exe"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/IntegrationRuntime_5.0.7632.4.msi" -OutFile "IntegrationRuntime.msi"

# Install the JRE
Start-Process "JavaRuntimeEnvironment.exe" -ArgumentList INSTALLCFG="$PSScriptRoot\jre-conf.ini" -Wait

# Install the Integration Runtime
.\Setup-IntegrationRuntime.ps1 -path IntegrationRuntime.msi -authKey $IntegrationRuntimeAuthkey
$ProgressPreference = 'Continue'
