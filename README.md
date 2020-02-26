# Config list

Vim
* .vimrc
* vim plugins

Script
* .bashrc
* bash scripts

Git
* .gitconfig
* gitmessage.txt

# issue
vim cursor jumps to top of source
* desc: https://github.com/wesleyche/SrcExpl/issues/6
* workaround
    * remove `nested` syntax on SrcExpl plugin
    * https://github.com/wesleyche/SrcExpl/pull/9/commits/d8b906a68228f3138fc3a7b32258b0ea5c3c4bd4
* 
```
- 1552 au! CursorHold * nested call <SID>SrcExpl_Refresh()
+ 1553 au! CursorHold * call <SID>SrcExpl_Refresh()

```
