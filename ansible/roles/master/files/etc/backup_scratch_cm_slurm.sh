#!/bin/bash
#SBATCH -n 1
#SBATCH -J backup_scratch_cm
#SBATCH -p defq
#SBATCH -o backup-%J.err
#SBATCH -e backup-%J.out
#SBATCH --time=240:00:00

time sudo -u backup -c "/home/backup/.anaconda/envs/default/bin/snapshotter /scratch /home/backup/cluster01"
