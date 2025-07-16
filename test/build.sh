# For docker desktop on windows
docker build -t jiaojiaming/deeplearning:test_build --build-arg "HTTP_PROXY=http://host.docker.internal:7890" --build-arg "HTTPS_PROXY=http://host.docker.internal:7890" --no-cache .
