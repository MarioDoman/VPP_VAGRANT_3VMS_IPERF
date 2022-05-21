import os
import subprocess

def ping(address):
    response = os.system("ping -c 2 " + address)
    if response == 0:
        return True
    else:
        return False

def sfr_35Gb_traffic(file):
    with open(file, "w") as output:
        subprocess.call(f"cd v2.97 && sudo ./t-rex-64 -f avl/sfr_delay_10_1g.yaml -c 4 -m 10 -d 100 --nc", shell=True, stdout=output, stderr=output)
    with open(file) as f:
        if f"Total-tx-bytes" in f.read():
            return True

def imix_1G_1600_flows(file):
    with open(file, "w") as output:
        subprocess.call(f"cd v2.97 && sudo ./t-rex-64 -f cap2/imix_64_fast.yaml -c 4 -m 1 -d 100 -l 1000 --nc", shell=True, stdout=output, stderr=output)
    with open(file) as f:
        if f"Total-rx-bytes" in f.read():
            return True