#!/usr/bin/env bash

declare -A arr

# models
# arr["https://huggingface.co/prompthero/openjourney/resolve/main/mdjrny-v4.safetensors"]="models/Stable-diffusion"
arr["https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/blob/main/sd_xl_base_1.0.safetensors"]="models/Stable-diffusion"
# vae
arr+=(["https://huggingface.co/stabilityai/sdxl-vae/blob/main/sdxl_vae.safetensors"]="models/VAE")
# controlnet
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/diffusers_xl_canny_full.safetensors"]="extensions/sd-webui-controlnet/models")
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/sai_xl_canny_256lora.safetensors"]="extensions/sd-webui-controlnet/models")
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/diffusers_xl_depth_full.safetensors"]="extensions/sd-webui-controlnet/models")
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/sai_xl_depth_256lora.safetensors"]="extensions/sd-webui-controlnet/models")
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/sargezt_xl_depth.safetensors"]="extensions/sd-webui-controlnet/models")
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/thibaud_xl_openpose.safetensors"]="extensions/sd-webui-controlnet/models")
arr+=(["https://huggingface.co/lllyasviel/sd_control_collection/blob/main/thibaud_xl_openpose_256lora.safetensors"]="extensions/sd-webui-controlnet/models")

for key in ${!arr[@]}; do
  mkdir -p "${arr[${key}]}"
  download_to="${arr[${key}]}"/$(basename "${key}")
  if [ ! -f "$download_to" ]; then
    echo "Download ${key} to ${arr[${key}]}"
    curl -Lo "$download_to" "${key}"
  fi
done
