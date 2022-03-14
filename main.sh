#!/bin/bash
baseInstallUrl="https://mirror.codebucket.de/vanced/api/v1"
theme=black
vancedyt="15.05.54 15.33.34 15.38.45 15.40.37 15.43.32 16.02.35 16.14.34 16.16.38 16.20.35 16.29.39 17.03.38"


variant=nonroot
for e1 in $vancedyt
do    
    mkdir -p $e1/$variant
    themePath=$baseInstallUrl/apks/v"$e1"/$variant/Theme
    curl -sSLo "$e1"/$variant/$theme.apk $themePath/$theme.apk
    arch="armeabi_v7a arm64_v8a"
    for e2 in $arch
    do
        curl -sSLo "$e1"/$variant/"$e2".apk $baseInstallUrl/apks/v"$e1"/$variant/Arch/split_config."$e2".apk
    done
    curl -sSLo "$e1"/$variant/lang-vi.apk $baseInstallUrl/apks/v"$e1"/$variant/Language/split_config.vi.apk
done


variant=root
for e1 in $vancedyt
do
    mkdir -p $e1/$variant
    themePath=$baseInstallUrl/apks/v"$e1"/$variant/Theme
    curl -sSLo "$e1"/$variant/$theme.apk $themePath/$theme.apk
    arch="armeabi_v7a arm64_v8a"
    for e2 in $arch
    do
        curl -sSLo "$e1"/$variant/"$e2".apk $baseInstallUrl/apks/v"$e1"/$variant/Arch/split_config."$e2".apk
    done
    curl -sSLo "$e1"/$variant/stock.apk $themePath/stock.apk
    curl -sSLo "$e1"/$variant/dpi.apk $themePath/dpi.apk
    curl -sSLo "$e1"/$variant/lang-vi.apk $baseInstallUrl/apks/v"$e1"/$variant/Language/split_config.vi.apk
done
