# 使用官方的Python映像作為基礎
FROM python:3.9-slim

# 設置工作目錄
WORKDIR /app

# 複製當前目錄的內容到容器中的/app目錄
COPY . /app

# 安裝Python依賴
RUN pip install --no-cache-dir -r requirements.txt

# 暴露Flask默認的運行端口
EXPOSE 5000

# 使用Gunicorn啟動Flask應用
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
