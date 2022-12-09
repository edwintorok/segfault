ulimit -c unlimited
rm -f gen_lifecycle.bc gen_lifecycle.exe && dune clean && dune build && ./gen_lifecycle.exe; dune build --debug-artifact-substitution --verbose && ./gen_lifecycle.exe
