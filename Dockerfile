# 使用官方Python镜像作为基础镜像
FROM python:3.10-slim

# 安装git
RUN apt-get update && apt-get install -y git

# 设置工作目录
WORKDIR /app

# 克隆指定的git仓库
RUN git clone https://github.com/xfangs/chat.petals.dev .

# 安装所需的Python依赖
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir huggingface_hub huggingface-cli



# 指定Flask运行时的环境变量
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
ENV HF_TOKEN=""

# 暴露容器的5000端口
EXPOSE 5000

# 设置容器启动时执行的命令
CMD ["flask", "run"]
