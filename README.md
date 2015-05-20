vault
=====

Tool to comfortably attach+import and export+detach a
geli encrypted zpool. Obviously after the system has been
booted.

All devices within the pool must be encrypted with:
* both keyfile and passphrase
* the same keyfile
* the same passphrase

As tradeoff the tool only asks for the passphrase to be entered
on the shell once. For decrypting the various devices, it creates
a named pipe that geli uses as passphrase file and writes into it.
This avoids all the usual environment, shell history and/or process
argument list hassles.
Pipe buffer memory is also kernel memory, so the passphrase is about
as safe as it can be while being scripted.

The pipe is created for every invocation via mktemp and can only be
read or written to by root.

Instructions
------------
See `INSTALL` file.

License
-------
BSD2CLAUSE

Bugs
----
The test coverage is horrible.

Usual Disclaimer
----------------
Don't trust my code to run on your machine as root just because I
uploaded it to Github.
