
# 🌏 Hello, World! (x86)

This is my **first Assembly program**, created as a way to understand the **basic structure** of an Assembly language program on Linux, using the x86 (32-bit) architecture.

Because it’s such a simple example, it might also be helpful for others who are just starting to learn Assembly.


## ⚙️ How to Compile

Make sure you have NASM (Netwide Assembler) and `ld` installed.

```bash
nasm -f elf32 hello.asm -o hello.o
ld -m elf_i386 -o hello hello.o
```


## ▶️ How to Run

After compiling, you can run the program with:

```bash
./hello
```

You should see the output:

```
Hello, World!
```


## 🔍 How the Code Works – A Basic Overview

The program begins at the `_start` label:

```asm
_start:
```

### Step 1: Choose a **syscall**

Syscalls are low-level functions provided by the Linux kernel. Each syscall has a number. For example:

```asm
mov eax, 4
```

This sets the syscall to `sys_write`, which is used to print data.

> Note: `syscall(4)` = `sys_write()`

### Step 2: Set the syscall arguments

Arguments are passed through specific registers:

* `ebx` → file descriptor (e.g., 1 for stdout)
* `ecx` → pointer to the message (the string)
* `edx` → message length (in bytes)

```asm
mov ebx, 1     ; stdout
mov ecx, hello ; string address
mov edx, len   ; string length
```

### Step 3: Trigger the syscall

Call the kernel with:

```asm
int 0x80
```

This tells the system to execute the syscall you've set up.


## 🛠️ Common Syscalls (32-bit Linux)

```asm
1  = sys_exit    ; end the program
3  = sys_read    ; read input
4  = sys_write   ; write output
5  = sys_open    ; open a file
6  = sys_close   ; close a file
11 = sys_execve  ; execute another program
```

---

Feel free to use this as a starting point for your own experiments with Assembly. It's a powerful and fascinating language once you get past the low-level syntax! 💻🧩

---


