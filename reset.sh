#!/bin/bash

# this file will reset all yaml for inital image ingession
echo "image: null" > pipelines/conf/imageIngestionRequestDEV.yaml
echo "image: null" > pipelines/conf/imageIngestionRequestRTL.yaml
echo "image: null" > images/DEV/ingestedImages.yaml
echo "image: null" > images/RTL/ingestedImages.yaml
