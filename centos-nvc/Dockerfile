#FROM registry.cn-shenzhen.aliyuncs.com/centos_7/centos7
FROM centos
MAINTAINER polarwu
#ADD ./CentOS-Base.repo /etc/yum.repos.d
#install ssh
RUN yum -y update
RUN yum -y install openssh-clients openssh-server \
                   epel-release \
                   vim      

RUN rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i '/pam_loginuid.so/c session    optional     pam_loginuid.so'  /etc/pam.d/sshd

#install supervisor
RUN yum -y install python-setuptools 
RUN easy_install pip && pip install supervisor
#RUN yum clean all &&  yum makecache


#install gui&nvc
#RUN yum -y groupinstall "X Window System" 
#RUN yum install -y gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts
#RUN unlink /etc/systemd/system/default.target
#RUN ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target
#RUN yum groupinstall "X Windows System" && \
#    yum groupinstall "Desktop" && \
#    yum groupinstall "Chinese Support"

RUN yum groupinstall -y Desktop
RUN yum install -y tigervnc-server firefox fonts-chinese && yum clean all

COPY supervisord.conf /etc/supervisord.conf

COPY vnc_init.sh /root/vnc_init.sh
RUN chmod +x /root/vnc_init.sh

COPY ssh_init.sh /root/ssh_init.sh
RUN chmod +x /root/ssh_init.sh

EXPOSE 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
