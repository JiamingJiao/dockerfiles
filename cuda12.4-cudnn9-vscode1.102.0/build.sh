# For docker desktop on windows
docker build -t jiaojiaming/deeplearning:cuda12.4-cudnn-vscode1.102.0 --build-arg "HTTP_PROXY=http://host.docker.internal:7890" --build-arg "HTTPS_PROXY=http://host.docker.internal:7890" .
