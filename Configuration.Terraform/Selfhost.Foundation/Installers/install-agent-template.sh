set -e

ADMIN_USER=${vm_admin_username}
AGENT_VERSION=${agent_version}
AGENT_FILENAME=${agent_filename}
AGENT_DIR="/home/$ADMIN_USER/agent"

mkdir -p $AGENT_DIR
cp $AGENT_FILENAME $AGENT_DIR/
cd $AGENT_DIR

tar zxvf $AGENT_FILENAME
sudo ./bin/installdependencies.sh

sudo -u $ADMIN_USER ./config.sh --unattended \
  --url https://dev.azure.com/${organization} \
  --auth pat \
  --token ${pat_token} \
  --pool Default \
  --agent vm-self-host-$(date +%s) \
  --acceptTeeEula

sudo ./svc.sh install
sudo ./svc.sh start
  