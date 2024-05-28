echo "#Custom adding" >> /etc/hosts
echo "$(route -n | awk '/UG[ \t]/{print $2}')       redhat.hurondigitalpathology.com" >> /etc/hosts
echo "$(route -n | awk '/UG[ \t]/{print $2}')       redhat-ims.hurondigitalpathology.com" >> /etc/hosts
echo "$(route -n | awk '/UG[ \t]/{print $2}')       redhat-ims2.hurondigitalpathology.com" >> /etc/hosts
echo "$(route -n | awk '/UG[ \t]/{print $2}')       redhat-upload.hurondigitalpathology.com" >> /etc/hosts
