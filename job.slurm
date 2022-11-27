#!/bin/sh
#SBATCH --partition=GPUQ
#SBATCH --account=share-ie-idi
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:P100:1
#SBATCH --cpus-per-task=24
#SBATCH --mem=64G
#SBATCH --job-name="mini_project"
#SBATCH --output=yolo7_test_result2.out
#SBATCH --mail-user=NTNU_BRUKER

module purge
cd ${SLURM_SUBMIT_DIR}/yolov7

module purge
module load Python/3.8.6-GCCcore-10.2.0

#pip list
#pip install -r requirements.txt --user -q
#pip install wandb --user -q

#import gc
#torch.cuda.empty_cache()
#gc.collect()

#wandb login "wandb_login_code"

#python3 -m torch.distributed.launch --nproc_per_node=2 train.py --batch 6 --epochs 300 --data data/rdd.yaml --device 0,1 --workers 8 --img 1800 1800 --cfg cfg/training/yolov7-w6.yaml --weights 'yolovw6_training.pt' --name yolov7_transfer_rdd --hyp data/hyp.scratch.custom.yaml
python3 detect.py --weights runs/train/yolov7_rdd45/weights/best.pt --source /cluster/projects/vc/courses/TDT17/2022/open/RDD2022/Norway/test/images --save-txt --img-size 1280
