# NVIDIA CUDA — Installation Guide

CUDA requires NVIDIA drivers and cannot be fully automated. macOS is **not supported**.

---

## Windows — Manual Steps

1. **Check GPU compatibility:** https://developer.nvidia.com/cuda-gpus
2. **Install/update NVIDIA drivers** first:
   - Download from https://www.nvidia.com/Download/index.aspx
   - Or via GeForce Experience
3. **Download CUDA Toolkit:**
   - https://developer.nvidia.com/cuda-downloads
   - Choose: Windows → x86_64 → your Windows version → exe (network or local)
4. Run the installer — choose **Custom** install and include:
   - ✅ CUDA Toolkit
   - ✅ CUDA Samples (optional)
   - ✅ CUDA Documentation (optional)
5. **Verify install:**
   ```cmd
   nvcc --version
   nvidia-smi
   ```

### cuDNN (for deep learning)
1. Requires NVIDIA Developer account (free): https://developer.nvidia.com/rdp/cudnn-download
2. Download the version matching your CUDA version
3. Extract and copy files into the CUDA install directory:
   ```
   cuda\bin\       ← copy cudnn*.dll
   cuda\include\   ← copy cudnn*.h
   cuda\lib\x64\   ← copy cudnn*.lib
   ```

---

## Ubuntu — Semi-Automated

Run the provided helper script:
```bash
chmod +x install-ubuntu.sh
sudo ./install-ubuntu.sh
```

The script uses the official NVIDIA CUDA repo for Ubuntu. You still need compatible hardware.

### Manual Ubuntu Steps
```bash
# Install NVIDIA drivers
sudo apt-get install -y nvidia-driver-550   # check latest: apt search nvidia-driver

# Add CUDA repo (Ubuntu 22.04 example)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get install -y cuda-toolkit-12-4

# Add to ~/.bashrc
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# Verify
nvcc --version
nvidia-smi
```

---

## macOS — Not Supported

CUDA is not available on macOS. For GPU-accelerated ML on Mac:
- Use **Apple Metal** / **MPS** (Metal Performance Shaders) backend in PyTorch:
  ```python
  device = torch.device("mps" if torch.backends.mps.is_available() else "cpu")
  ```
- Or use **CoreML** for inference.

---

## Verify PyTorch + CUDA
```python
import torch
print(torch.cuda.is_available())      # True if CUDA is working
print(torch.cuda.get_device_name(0))  # GPU name
```

## Useful Links
- CUDA Toolkit: https://developer.nvidia.com/cuda-toolkit
- CUDA Compatibility: https://docs.nvidia.com/deploy/cuda-compatibility/
- PyTorch install (with CUDA): https://pytorch.org/get-started/locally/
