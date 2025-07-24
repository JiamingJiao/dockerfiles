# For docker desktop on windows
# 设置desktop代理，wsl环境变量，按照片设置wsl网络（不要mirrored）
docker build -t vlm:vscode1.102.0-python3.12-pytorch2.6.0 --build-arg .
