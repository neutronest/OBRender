# Compile script and arguments

OCB_FLAGS = -tag bin_annot -I gen-ocaml

OCB = ocamlbuild -use-ocamlfind -tag thread $(OCB_FLAGS)

all: native byte

clean:
	$(OCB) -clean

native:
	$(OCB) main.native
