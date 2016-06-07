FROM glen/pld

# install pam, older version
RUN poldek -n th-2015 -u pam --noask --downgrade

# this does nothing yet
RUN echo >> /etc/environment
RUN poldek -u pam
RUN rpm -Uhv --downgrade /var/spool/repackage/*/pam*.rpm

# cleanup, omitting this line will make reproducer fail (not reproduce problem)
#RUN rm -rv /var/spool/repackage/*

# this does!
RUN poldek -u pam
RUN rpm -Uhv --downgrade /var/spool/repackage/*/pam*.rpm
