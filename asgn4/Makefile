all:
	cp src/lexer.py bin/lexer.py
	cp src/parser.py bin/parser.py
	cp src/codegen.py bin/codegen.py
	cp src/mipsCode.py bin/mipsCode.py
	cp src/symbol_table.py bin/symbol_table.py
	cp src/termcolor.py bin/termcolor.py
	cp src/threeAddressCode.py bin/threeAddressCode.py
	python -m py_compile bin/codegen.py
	mv bin/codegen.pyc bin/codegen
	chmod +x bin/codegen
clean:
	rm -rf bin/*
	rm test/*.asm
