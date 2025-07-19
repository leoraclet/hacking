test_line = "0000000000000ac5 <check>:"
is_check_function = False

i = 0
with open("ch30_dump.txt") as f:
    file = open("solution", "wb")
    for line in f.readlines():

        if test_line in line:
            is_check_function = True
            continue

        if "00000000003ec2c0 <__libc_csu_init>:" in line:
            is_check_function = False
            continue

        if is_check_function:
            if "mov    DWORD PTR [rbp-0x8]" in line:
                v1 = int(line.split("mov    DWORD PTR [rbp-0x8],0x")[1], 16)
                # print(v1)
                continue

            if "xor" in line and v1 != 0:
                v2 = int(line.split(",0x")[1], 16)
                # print(v2)
                # print(bytes([v1 ^ v2]), v1 ^ v2)
                file.write(chr(v1 ^ v2).encode())
                i += 1
                v1 = 0
                v2 = 0

    file.close()

print(i*256)