import os

def mkdir_and_chown(path):
    os.system("mkdir -p " + path)
    # os.system("sudo chown sigma:sigma " + path)
    

print(f"pwd")
os.system("pwd")
print(f"ls")
os.system("ls")
print(f"whoami")
os.system("whoami")
print(f"ls -l /mnt")
os.system('echo "ls -l /mnt"')
os.system("ls -l /mnt")

# Mount blob1
# Do not use "/mnt/output" as mount point
print(f'mkdir_and_chown("/mnt/shimao-zhang-blob")')
mkdir_and_chown("/mnt/shimao-zhang-blob")

os.system("umount /mnt/shimao-zhang-blob")

print(f'mkdir_and_chown("/mnt/azcache/blob_zhangsm")')
mkdir_and_chown("/mnt/azcache_zhangsm")

os.system("blobfuse2 mount /mnt/shimao-zhang-blob --config-file=zhangsm_blob_config.yaml")

# If needed mount blob2
# ......
print(f'ls -alh /mnt/shimao-zhang-blob')
os.system('echo "ls -alh /mnt/shimao-zhang-blob"')
os.system("ls -alh /mnt/shimao-zhang-blob")


print(f'echo $PATH')
os.system("echo $PATH")

print(f'which python')
os.system("which python")

