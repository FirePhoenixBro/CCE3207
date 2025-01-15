#!/bin/bash
# ALWAYS specify CPU and RAM resources needed as well as walltime
#SBATCH --partition=teaching_gpu
#SBATCH --gres=gpu:ampere:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=0-01:00:00
# job parameters
#SBATCH --output=/opt/users/lvel0085/Desktop/CCE3207/job_%A_%a.out
#SBATCH --error=/opt/users/lvel0085/Desktop/CCE3207/job_%A_%a.err
#SBATCH --job-name=cce3207_notebook
#SBATCH --account=undergrad
# email user with progress
#SBATCH --mail-user=luca.vella.22@um.edu.mt
#SBATCH --mail-type=all
#
VENV=/opt/users/lvel0085/Desktop/CCE3207/venv
if [ -d $VENV ]; then
   echo Virtual environment found, activating
   VENV+=/bin/activate
   source "$VENV"
else
   echo Virtual environment not found!
fi

jupyter nbconvert --execute --to notebook \
   --output "Notebook" \
   --output-dir "/opt/users/lvel0085/Desktop/CCE3207" \
   "/opt/users/lvel0085/Desktop/CCE3207/assignment/luca-vella-0107104L.ipynb"
