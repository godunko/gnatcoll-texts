
all:
	gprbuild -p -P gnat/gnatcoll_text.gpr -cargs $(ADAFLAGS)

check:
	gprbuild -p -P gnat/gnatcoll_text_tests.gpr
	.objs/tests/test_conversions
