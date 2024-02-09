# just implementing offset 0x50 TDCCLKCTL

if request.isInit:
    mem = [0] * 256

if request.isWrite:
    mem[request.offset] = request.value

if request.isRead:
    if request.offset == 0x50:
        # always say we have acked
        request.value = 0x2
    else:
        request.value = mem[request.offset]

self.NoisyLog("%s on AUX_SYSIF at 0x%x, value 0x%x" % (str(request.type), request.offset, request.value))
