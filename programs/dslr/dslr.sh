here="$(cd "$(dirname "$0")"; pwd)"
conf="/etc/modprobe.d/dslr-webcam.conf"

sudo rm $conf
sudo ln -s "$here/dslr-webcam.conf" $conf

if ! grep -Fxq "dslr-webcam" /etc/modules
then
    sudo sh -c 'echo "dslr-webcam" >> /etc/modules'
fi

