#!/bin/bash -l
#SBATCH --constraint=snb
#SBATCH --ntasks-per-node=16
#SBATCH -J JOB_NAME
#SBATCH -o ogmx.%j
#SBATCH -e egmx.%j
#SBATCH --mem-per-cpu=128
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pierre.leprovost@oulu.fi

set -e
    
module load gromacs-env

export OMP_NUM_THREADS=1

srun gmx_mpi mdrun -deffnm $MDRUN_NAME -dlb yes -maxh 71.99 -append no

# This script will print some usage statistics to the
# end of the standard out file
# Use that to improve your resource request estimate
# on later jobs.
seff $SLURM_JOBID
