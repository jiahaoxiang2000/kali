
FROM kalilinux/kali-rolling

# Update and install basic tools and SSH server
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    curl \
    vim \
    git \
    openssh-server

# Create a directory for the SSH daemon
RUN mkdir /var/run/sshd

# Set up password for root user (change 'rootpassword' to a secure password)
RUN echo 'root:rootpassword' | chpasswd

# Allow root login via SSH
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]