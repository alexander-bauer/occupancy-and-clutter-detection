.PHONY: all clean

all: proposal.pdf report1.pdf report2.pdf report3.pdf finalreport.pdf

clean:
	rm -rf results/

env: requirements.txt
	python2 -m virtualenv env
	env/bin/pip install -r requirements.txt
	ln -sf /usr/lib/python2.7/site-packages/cv.py env/lib/python2.7/site-packages
	ln -sf /usr/lib/python2.7/site-packages/cv2.so env/lib/python2.7/site-packages

finalreport.pdf: finalreport.tex references.bib
	pdflatex --halt-on-error finalreport.tex
	biber finalreport
	pdflatex --halt-on-error finalreport.tex

%.pdf: %.tex
	pdflatex --halt-on-error $^
