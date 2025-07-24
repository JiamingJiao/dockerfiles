# 如果第一条下载timeout，先手动pull，再build该文件，可以利用pull的缓存。
FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
LABEL maintainer="Jiao Jiaming jiaojiaming@mindray.com"
WORKDIR /build
COPY requirements.txt .
COPY requirements-pytorch.txt .
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y openssh-server && \
    # 修改密码
    echo "root:123456"|chpasswd && \
    mkdir -vp /run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3.sh -b -p "${HOME}/conda" && \
    source "${HOME}/conda/etc/profile.d/conda.sh" && \
    conda init && \
    conda install -n base -y "python>=3.12,<3.13" pip && \
    conda activate base && \
    pip install --no-cache-dir -r requirements-pytorch.txt --index-url --index-url https://download.pytorch.org/whl/cu124 && \
    pip install --no-cache-dir -r requirements.txt -c requirements-pytorch.txt && \
    pip install "https://github.com/Dao-AILab/flash-attention/releases/download/v2.7.4.post1/flash_attn-2.7.4.post1+cu12torch2.6cxx11abiTRUE-cp312-cp312-linux_x86_64.whl"
# Vscode server和extensions手动安装更方便
# RUN wget https://update.code.visualstudio.com/latest/server-linux-x64/stable
CMD ["/usr/sbin/sshd","-D"]
