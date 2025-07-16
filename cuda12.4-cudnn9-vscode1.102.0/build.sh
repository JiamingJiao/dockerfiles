# For docker desktop on windows
# 设置desktop代理，wsl环境变量，按照片设置wsl网络（不要mirrored）
docker build -t jiaojiaming/deeplearning:cuda12.4-cudnn-vscode1.102.0 --build-arg "HTTP_PROXY=http://host.docker.internal:7890" --build-arg "HTTPS_PROXY=http://host.docker.internal:7890" .
