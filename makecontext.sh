#!/bin/bash

## Symfonyコンテクスト作成シェルスクリプト

BIN_CURL="/usr/bin/curl -L"
BIN_MV="/bin/mv"
BIN_CP="/bin/cp -pr"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_CD="cd"

URL_ARCHIVE="http://symfony.com/download?v=Symfony_Standard_Vendors_2.1.2.tgz"

## make context
${BIN_CD} ./contexts/krm/docroot/
${BIN_CURL} -o ./symfony.tgz ${URL_ARCHIVE}
${BIN_TAR} zxf ./symfony.tgz
${BIN_RM} ./symfony.tgz
${BIN_CP} ./Symfony/.[A-z]* ./Symfony/[A-z]* ./
${BIN_RM} ./Symfony

${BIN_MV} ./web/app.php ./web/app.org.php
${BIN_MV} ../patch/app.php ./web/app.php
${BIN_MV} ../patch/parameters.php ./app/config/parameters.php
${BIN_MV} ./app/config/config.yml ./app/config/config.org.yml
${BIN_MV} ../patch/config.yml ./app/config/config.yml

## create archive
${BIN_TAR} czpf ../docroot.tar.gz *
${BIN_CD} ../
${BIN_RM} ./docroot ./patch
${BIN_CD} ../
${BIN_TAR} czpf ./krm.tar.gz ./krm

## end
