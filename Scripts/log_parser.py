log_file="Logs/auth_sample.log"
with open(log_file,"r") as file:
    print("[+] Failed login attempts:")
    for line in file:
        if "Failed password" in line:
            print(line.strip())