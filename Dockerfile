# Usando uma imagem base oficial do Ubuntu
FROM ubuntu:22.04

# Instalação das dependências e JuiceFS
RUN apt-get update && apt-get install -y \
    curl \
    fuse \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Baixar e instalar JuiceFS
RUN curl -fsSL https://juicefs.com/static/juicefs -o /usr/local/bin/juicefs \
    && chmod +x /usr/local/bin/juicefs

# Monta um volume compartilhado onde o JuiceFS será montado
VOLUME /mnt/juicefs

# Entry point que pode ser customizado para inicializar o nó
CMD ["bash"]
