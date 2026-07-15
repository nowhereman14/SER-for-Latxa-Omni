#!/bin/bash
#SBATCH --job-name=LatxaOmni_SER_evaluation
#SBATCH --account=hitz-exclusive
#SBATCH --partition=hitz-exclusive
#SBATCH --qos=hitz-exclusive
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=2 # Number of CPU cores
#SBATCH --mem-per-gpu=16GB # RAM memory needed (8-16GB)
#SBATCH --time=3-00:00
#SBATCH --output=/scratch/agarciam/eval_%j.out
#SBATCH --error=/scratch/agarciam/eval_%j.err

module load Miniforge3/24.11.3-2
export PATH="/home/agarciam/.conda/envs/llama-omni/bin:$PATH"

export SSL_CERT_FILE=~/cacert.pem
export CUDA_DEVICE_MAX_CONNECTIONS=1
export TORCH_NCCL_BLOCKING_WAIT=1
export NCCL_TIMEOUT=1800
export NCCL_IB_DISABLE=0
export NCCL_P2P_DISABLE=0

GPUS_PER_NODE=$(echo $SLURM_JOB_GPUS | tr ',' '\n' | wc -l)

which python
which deepspeed

cd /scratch/agarciam/tfm/models/Latxa-Omni-Emotion
python evaluation.py --model-path saves/final --model-base Latxa-3.1-8B-Omni