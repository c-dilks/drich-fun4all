#!/bin/bash

### start local singularity container

# set this to the path to the fun4all singularity repo
# [ https://github.com/eic/Singularity.git ]
fundir=${HOME}/d/fun4all/Singularity

# start singularity container, and source EIC env vars
singularity shell \
  -B $fundir/cvmfs:/cvmfs \
  $fundir/cvmfs/eic.opensciencegrid.org/singularity/rhic_sl7_ext.simg \
  -c "source /cvmfs/eic.opensciencegrid.org/x8664_sl7/opt/fun4all/core/bin/eic_setup.sh -n && exec bash"

# comfort settings maybe useful to put in your .bashrc:
#LS_COLORS="di=1;31"
#TERM=xterm-256color
