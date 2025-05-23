FROM python:3.10-slim

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y \
    git wget && \
    apt-get clean

# Establece directorio de trabajo
WORKDIR /workspace

# Clona ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git && \
    cd ComfyUI && \
    pip install --no-cache-dir -r requirements.txt

# Instala nodos personalizados
RUN cd ComfyUI/custom_nodes && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager && \
    git clone https://github.com/welltop-cn/ComfyUI-TeaCache.git && \
    cd ComfyUI-TeaCache && pip install --no-cache-dir -r requirements.txt && cd .. && \
    git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && pip install --no-cache-dir -r requirements.txt

# Crea carpetas para modelos
RUN mkdir -p ComfyUI/models/clip \
    ComfyUI/models/vae \
    ComfyUI/models/diffusion_models \
    ComfyUI/models/loras \
    ComfyUI/models/upscale_models

# Copia scripts
COPY start.sh /workspace/start.sh
COPY start-pod.sh /workspace/start-pod.sh
RUN chmod +x /workspace/start.sh /workspace/start-pod.sh

EXPOSE 3000

CMD ["/workspace/start.sh"]
