FROM binhex/arch-base:20161101-01
MAINTAINER binhex

# additional files
##################

# add install bash script
ADD setup/root/*.sh /root/

# install app
#############

# run bash script to update base image, set locale, install supervisor and cleanup
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh
