#!/usr/bin/env bash
set -e

source /cvmfs/cms.cern.ch/cmsset_default.sh

CMSSW_VERSION_TO_USE=CMSSW_11_3_4

if [ ! -d "${CMSSW_VERSION_TO_USE}" ]; then
  cmsrel ${CMSSW_VERSION_TO_USE}
fi

pushd ${CMSSW_VERSION_TO_USE}/src
  cmsenv
popd

if [ ! -d "EFT2Obs" ]; then
  git clone https://github.com/ajgilbert/EFT2Obs.git
  pushd EFT2Obs
    source env.sh
    ./scripts/setup_mg5.sh
    ./scripts/setup_rivet.sh
  popd
else
  pushd EFT2Obs
    source env.sh
  popd
fi
