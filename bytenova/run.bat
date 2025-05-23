@echo off
title Bytenova Bot by @MeoMunDep
color 0A

cd %~dp0

echo Checking configuration files...

if not exist configs.json (
    echo {> configs.json
    echo   "skipInvalidProxy": false,>> configs.json
    echo   "delayEachAccount": [5, 8],>> configs.json
    echo   "timeToRestartAllAccounts": 300,>> configs.json
    echo   "howManyAccountsRunInOneTime": 100,>> configs.json
    echo   "doTasks": true,>> configs.json
    echo   "changeAvatar": true,>> configs.json
    echo   "updateName": true,>> configs.json
    echo   "referralCode": ["Gq6CG0r1f", "Zarei5v6q", "tCeYrh8sC", "tCeYrh8sC"]>> configs.json
    echo }>> configs.json
    echo Created configs.json
)

(for %%F in (privateKeys.txt proxies.txt) do (
    if not exist %%F (
        type nul > %%F
        echo Created %%F
    )
))

echo Configuration files checked.

echo Checking dependencies...
if exist "..\node_modules" (
    echo Using node_modules from parent directory...
    cd ..
    CALL npm install user-agents axios meo-forkcy-colors https-proxy-agent socks-proxy-agent ethers web3 
    cd %~dp0
) else (
    echo Installing dependencies in current directory...
    CALL npm install user-agents axios meo-forkcy-colors https-proxy-agent socks-proxy-agent ethers web3   
)
echo Dependencies installation completed!

echo Starting the bot...
node meomundep

pause
exit
