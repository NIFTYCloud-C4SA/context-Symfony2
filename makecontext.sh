#!/bin/bash

## Symfonyコンテクスト作成シェルスクリプト

BIN_CURL="/usr/bin/curl -L"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_CD="cd"


URL_ARCHIVE="http://symfony.com/download?v=Symfony_Standard_Vendors_2.0.17.tgz"

## make context
${BIN_CD} ./contexts/krm/
${BIN_CURL} -o ./symfony.tgz ${URL_ARCHIVE}
${BIN_TAR} zxvf symfony.tgz
${BIN_RM} ./symfony.tgz
${BIN_MV} ./Symfony/app/config/config.yml ./Symfony/app/config/config_org.yml
${BIN_MV} ./config.yml ./Symfony/app/config/config.yml
${BIN_MV} ./param.php ./Symfony/app/config/param.php

## create archive
${BIN_CD} ./Symfony/
${BIN_TAR} czpf ../web_root.tar.gz ./{LICENSE,README.md,app,bin,deps,deps.lock,src,vendor,web}
${BIN_CD} ../../
${BIN_RM} ./Symfony
${BIN_TAR} czpf ./krm.tar.gz ./krm/*

## end
