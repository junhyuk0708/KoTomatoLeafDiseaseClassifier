# Base Image
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

# Set noninteractive environment for apt-get install
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# Remove any third-party apt sources to avoid issues with expiring keys
RUN rm -f /etc/apt/sources.list.d/*.list

# Update package list & Install basic utilities
RUN apt-get update -q -y && \
    apt-get install -y --no-install-recommends wget vim curl ssh tree sudo git zip unzip libgl1-mesa-glx software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update -y && \
    apt-get install -y python3.11 python3-pip python3.11-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.11

# Install JupyterLab and set up its configuration
RUN python3.11 -m pip install --upgrade pip && \
    python3.11 -m pip install jupyterlab && \
    echo "y" | jupyter lab --generate-config && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_root = True" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.open_browser = False" >> /root/.jupyter/jupyter_server_config.py

# Install Python packages excluding PyTorch related ones
RUN python3.11 -m pip install numpy scipy matplotlib pandas scikit-learn ipython seaborn tqdm efficientnet_pytorch ultralytics

# Install PyTorch related packages
RUN python3.11 -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
