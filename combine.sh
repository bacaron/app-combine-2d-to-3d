#!/bin/bash

axial=$1
coronal=$2
sagittal=$3
TYPE=$4

[ ! -d ./output ] && mkdir -p ./output && outdir='./output'
[ ! -d ./raw ] && mkdir -p ./raw && rawdir='./raw'

[ ! -d ${outdir}/${TYPE}.nii.gz ] && niftymic_reconstruct_volume --filenames ${axial} ${coronal} ${sagittal} --output ${outdir}/${TYPE}.nii.gz

[ ! -f ${outdir}/${TYPE}.nii.gz ] && echo "something went wrong" && exit 1 || echo "complete" && mv ${outdir}/motion_correction ${outdir}/*_mask.nii.gz ${outdir}/config_*.json ${rawdir}/
