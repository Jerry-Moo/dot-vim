#### ftplugin

~/.vim/ftplugin/此目录中的文件有些不同。当 vim 给缓冲区的 filetype 设置一个值时，vim 将会在~/.vim/ftplugin/ 目录下来查找和 filetype 相同名字的文件。例如你运行 set filetype=derp 这条命令后，vim 将查找~/.vim/ftplugin/derp.vim 此文件，如果存在就运行它。不仅如此，它还会运行 ftplugin 下相同名字的子目录中的所有文件，如~/.vim/ftplugin/derp/这个文件夹下的文件都会被运行。每次启用时，应该为不同的文件类型设置局部缓冲选项，如果设置为全局缓冲选项的话，将会覆盖所有打开的缓冲区。
