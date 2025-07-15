# wsl网络设置为镜像模式，并关闭dns隧道。
cp /mnt/d/jiao/docker_images/python3.12-pytorch2.6.0-cuda12.4-cudnn9/* ./
docker pull nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
# 如果是直接在wsl中安装的docker，而不是windows dockek desktop，可能需要修改下方代理的地址。
docker build -t jiaojiaming/vlm:python3.12-pytorch2.6.0-cuda12.4-cudnn9 --build-arg "HTTP_PROXY=http://host.docker.internal:7890" --build-arg "HTTPS_PROXY=http://host.docker.internal:7890" .
