#!/bin/bash
rm rp.zip
cd rp
zip -ur ../rp *
cd ..

sha1sum rp.zip > sha1sum.txt