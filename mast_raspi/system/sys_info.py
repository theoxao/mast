
def get_mem_info():
    with open('/proc/meminfo') as f:
        for line in f.readlines():
            if line.startswith('MemFree'):
                return line
    return "get mem info error"
