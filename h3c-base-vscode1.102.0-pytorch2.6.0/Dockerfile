FROM h3c-dev-base:v1.0
# LABEL maintainer="Jiao Jiaming jiaojm@outlook.com"
ARG VSCODE_COMMIT="cb0c47c0cfaad0757385834bd89d410c78a856c0"
WORKDIR /root
SHELL ["/bin/bash", "-c"]
RUN rm -r /root/.vscode-server && \
    wget -O vscode-server-linux-x64.tar.gz "https://update.code.visualstudio.com/commit:$VSCODE_COMMIT/server-linux-x64/stable" && \
    mkdir -p /root/.vscode-server/bin && \
    tar -xf ./vscode-server-linux-x64.tar.gz -C /root/.vscode-server/bin && \
    mv /root/.vscode-server/bin/vscode-server-linux-x64 /root/.vscode-server/bin/$VSCODE_COMMIT && \
    export PATH=/root/.vscode-server/bin/$VSCODE_COMMIT/bin:$PATH && \
    code-server --install-extension ms-python.python@2025.10.0 && \
    code-server --install-extension kevinrose.vsc-python-indent@1.21.0 && \
    code-server --install-extension ms-python.pylint@2025.2.0 && \
    code-server --install-extension ms-toolsai.jupyter@2025.6.0 && \
    code-server --install-extension njpwerner.autodocstring@0.6.1 && \
    code-server --install-extension eamodio.gitlens@17.3.0 && \
    code-server --install-extension christian-kohler.path-intellisense@2.10.0 && \
    code-server --install-extension kilocode.kilo-code@4.58.0 && \
    rm ./vscode-server-linux-x64.tar.gz
RUN conda create -y -c conda-forge -n pack
COPY requirements.txt .
COPY requirements-pytorch.txt .
RUN conda create -y -c conda-forge -n pytorch-2.6.0 "python>=3.12,<3.13" pip && \
    conda activate pytorch-2.6.0 && \
    pip install --no-cache-dir -r requirements-pytorch.txt --index-url https://download.pytorch.org/whl/cu124
RUN conda activate pytorch-2.6.0 && \
    pip install --no-cache-dir -r requirements.txt -c requirements-pytorch.txt
RUN conda activate pytorch-2.6.0 && \
    pip install --no-cache-dir "https://github.com/Dao-AILab/flash-attention/releases/download/v2.7.4.post1/flash_attn-2.7.4.post1+cu12torch2.6cxx11abiTRUE-cp312-cp312-linux_x86_64.whl"
RUN conda clean -t -c -l

# CMD ["/usr/sbin/sshd","-D"]
