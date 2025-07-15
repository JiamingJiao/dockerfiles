ARG VSCODE_COMMIT=cb0c47c0cfaad0757385834bd89d410c78a856c0

FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
LABEL maintainer="Jiao Jiaming jiaojm@outlook.com"
WORKDIR /build
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y openssh-server && \
    # 修改密码
    echo "root:123456"|chpasswd && \
    mkdir -vp /run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    apt-get install -y git && \
    wget -O vscode-server-linux-x64.tar.gz "https://update.code.visualstudio.com/commit:${VSCODE_COMMIT}/server-linux-x64/stable" && \
    mkdir -p /root/.vscode-server/bin && \
    tar -xf ./vscode-server-linux-x64.tar.gz -C /root/.vscode-server/bin && \
    mv /root/.vscode-server/bin/vscode-server-linux-x64 /root/.vscode-server/bin/${VSCODE_COMMIT} && \
    code-server --install-extension ms-python.python@25.10.0 && \
    code-server --install-extension kevinrose.vsc-python-indent@1.21.0 && \
    code-server --install-extension ms-python.pylint@2025.2.0 && \
    code-server --install-extension ms-toolsai.jupyter@2025.6.0 && \
    code-server --install-extension njpwerner.autodocstring@0.6.1 && \
    code-server --install-extension eamodio.gitlens@17.3.0 && \
    code-server --install-extension christian-kohler.path-intellisense@2.10.0 && \
    code-server --install-extension kilocode.kilo-code@4.58.0

CMD ["/usr/sbin/sshd","-D"]
