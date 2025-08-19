## Make the rmeove machines recognise the terminal application

```bash
$ infocmp > ghostty-info
$ infocmp -C ghostty > ghostty-cap

```

## Copy these files to the remote machines and run following commands

```bash
$ tic -x -o .terminfo ghostty-info

# change to root user

$ sudo su
$ tic -x -o .terminfo ghostty-info

```