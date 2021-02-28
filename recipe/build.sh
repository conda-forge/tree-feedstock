OBJS="tree.o unix.o html.o xml.o json.o hash.o color.o file.o"
if [[ $(uname) == "Darwin" ]]; then
    OBJS="$OBJS strverscmp.o"
fi

make -j${CPU_COUNT} \
    prefix=${PREFIX} \
    CC=${CC} \
    MANDIR=${PREFIX}/share/man/man1 \
    OBJS=$OBJS

make install
