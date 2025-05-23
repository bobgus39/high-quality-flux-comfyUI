#!/bin/bash

cd /workspace/ComfyUI/models/clip
wget https://huggingface.co/OwlMaster/SD3New/resolve/main/clip_l.safetensors
wget -O t5xxl_enconly.safetensors https://huggingface.co/OwlMaster/SD3New/resolve/main/t5xxl_fp16.safetensors

cd /workspace/ComfyUI/models/vae
wget https://huggingface.co/bobgus/test_double_lora/resolve/main/ae.safetensors

cd /workspace/ComfyUI/models/diffusion_models
wget https://huggingface.co/OwlMaster/SD3New/resolve/main/flux1-dev.safetensors

cd /workspace/ComfyUI/models/loras
wget https://huggingface.co/bobgus/test_double_lora/resolve/main/european35MALE_Rank_1_T5-000150.safetensors
wget https://huggingface.co/bobgus/test_double_lora/resolve/main/SBai_style_82.safetensors
wget https://huggingface.co/bobgus/test_double_lora/resolve/main/SBai_style_100.safetensors
wget https://huggingface.co/bobgus/test_double_lora/resolve/main/0001_european_20_female.safetensors

cd /workspace/ComfyUI/models/upscale_models
wget https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth

# Inicia ComfyUI
/workspace/start.sh
