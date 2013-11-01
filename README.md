Small sprite viewer to display sprites in the Mana sprite xml format.

# Compiling
You need [qbs](http://qt-project.org/wiki/qbs) in order to build this project.

`qbs install` should compile everything you need and place it in the
`install-root` folder.

# Usage
        spriteviewer <url to client-data> <spritepath1> <spritepath2> ...

The url to client-data must be a valid url. So filesystem links will need to be
in the format file:///home/foo/client-data/.

# License
See COPYING
