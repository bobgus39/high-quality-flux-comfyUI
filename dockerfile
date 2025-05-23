FROM python:3.10-slim

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y \
    git wget && \
    apt-get clean


# Clona ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git && \
    cd ComfyUI && \
    pip install --no-cache-dir -r requirements.txt

# Instala nodos personalizados
RUN cd ComfyUI/custom_nodes && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager 
# Crea carpetas para modelos
RUN mkdir -p ComfyUI/models/clip \
    ComfyUI/models/vae \
    ComfyUI/models/diffusion_models \
    ComfyUI/models/loras \
    ComfyUI/models/upscale_models

# Copia scripts
COPY start.sh /start.sh
COPY start-pod.sh /start-pod.sh
RUN chmod +x /start.sh /start-pod.sh

EXPOSE 3000

CMD ["/start-pod.sh"]
