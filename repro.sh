ulimit -c unlimited
rm -f gen_lifecycle.bc gen_lifecycle.exe && dune clean && dune build && ./gen_lifecycle.exe; dune build && ./gen_lifecycle.exe
