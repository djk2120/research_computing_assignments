# Final Project

## Brief Description
 - will be running an ensemble of climate model simulations
 - will be varying three parameters across simulations
 - data located at https://www.dropbox.com/s/am5td4bye99ojit/rc_ens.tar.gz
 - 2.6 GB, 216 .nc files

## Workflow

 - ./submit_ens
 - ensemble_analysis.m
 - output.ipynb

### Create parameter files
 - matlab
 - each simulation needs a parameter file
 - need to take template .nc file and edit the parameter values
 - save file with name that will generate simulation name

### Submit simulations
 - shell
 1) clone template simulation
 2) setup case
 3) edit env_build.xml
      - point to existing build (to avoid recompiling code)
      - set build status to true
 4) edit user_nl_clm
      - point to parameter file
 5) submit case

### Analyze output data
 - matlab
 1) totals
      - transpiration
      - photosynthesis
      - hydraulic redistribution
 2) diurnal cycles
      - transpiration
      - photosynthesis

### Visualize results
 - python, matplotlib