all:
	cp src/lexer.py bin/lexer.py
	python -m py_compile bin/lexer.py
	mv bin/lexer.pyc bin/lexer
	chmod +x bin/lexer
clean:
	rm -rf bin/*