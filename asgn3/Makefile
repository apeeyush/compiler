all:
	cp src/lexer.py bin/lexer.py
	cp src/irgen.py bin/irgen.py
	cp src/symbol_table.py bin/symbol_table.py
	cp src/termcolor.py bin/termcolor.py
	cp src/threeAddressCode.py bin/threeAddressCode.py
	python -m py_compile bin/irgen.py
	mv bin/irgen.pyc bin/irgen
	chmod +x bin/irgen
clean:
	rm -rf bin/*