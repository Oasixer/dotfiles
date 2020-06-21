# Setting up eduroam on linux without a desktop environment, using netctl instead of NetworkManager
* I have only tested on arch linux but it should work on other distros. This may be helpful for rasperry pi, although you won't be able to ssh into it over eduroam anyway without getting it whitelisted by IT or something
* NetworkManager should be able to accomplish the same thing, but this is only for netctl

## Instructions
### First time setup
* Install netctl if needed (it ships with arch linux)
* Run the following

cp ./eduroam/eduroam /etc/netctl/eduroam
cp ./eduroam/wpa_supplicant_eduroam.conf /etc

* Connect to the uw-wifi-setup-no-encryption network
    * download the eduroam-cat tool for linux (its a python script)
    * scroll to the bottom of the script and copy the SSL Cert in the string
    * paste it into a new file at /etc/eduroam_cert.pem

* Copy the output of the following to get your wifi interface name:

ip route | grep '^default' | awk '{print $5}' | head -n1

* Edit /etc/wpa_supplicant_eduroam.conf
    * replace interface wlan0 with the copied inteface name
    * replace username and password

* Run the following any time you want to connect manually
sudo ip link set your_copied_interface_name down
netctl start eduroam

### Auto connecting
netctl enable eduroam

