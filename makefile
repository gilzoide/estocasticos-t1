# Make do T1 de Estocásticos

src = *.hs
exe = pageRank

all : $(src)
	ghc --make $(src) -o $(exe)


test :
	@echo [[1, 0, 0], [0, 1, 1], [0, 0, 0]] | ./$(exe)


.PHONY: clean
clean :
	$(RM) *.o *.hi $(exe) *~
