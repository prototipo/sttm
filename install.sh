#!/bin/bash

# sudo cp sttm.sh /usr/local/bin/sttm

chmod u+x sttm.sh

echo "alias sttm='~/sttm/sttm.sh \"\$@\"'" >> ~/.bash_aliases
echo "alias addtask='sttm add \"\$@\"'" >> ~/.bash_aliases
echo "alias removetask='sttm remove \"\$@\"'" >> ~/.bash_aliases
echo "alias showtasks='sttm show'" >> ~/.bash_aliases
echo "alias cleartasks='sttm clear'" >> ~/.bash_aliases

echo "" >> ~/.bash_aliases

echo "alias t='addtask'" >> ~/.bash_aliases
echo "alias rt='removetask'" >> ~/.bash_aliases
echo "alias st='showtasks'" >> ~/.bash_aliases
echo "alias ct='cleartasks'" >> ~/.bash_aliases
