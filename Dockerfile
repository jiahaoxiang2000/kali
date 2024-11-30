
FROM kalilinux/kali-rolling

# # Backup original sources
# RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak



# # Replace with Tsinghua mirrors
# RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main non-free contrib non-free-firmware" > /etc/apt/sources.list 

# Update and install basic tools and SSH server
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    curl \
    vim \
    git \
    openssh-server \
    kali-linux-headless


# Set up password for root user (change 'rootpassword' to a secure password)
RUN echo 'root:rootpassword' | chpasswd

# Allow root login via SSH
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]