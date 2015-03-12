all:
	cp src/lexer.py bin/lexer.py
	cp src/parser.py bin/parser.py
	cp src/createdot.py bin/createdot.py
	python -m py_compile bin/parser.py
	mv bin/parser.pyc bin/parser
	chmod +x bin/parser
clean:
	rm -rf bin/*