if [[ $(uname) == "Darwin" ]]; then
	CFLAGS="-O2 -Wall -fomit-frame-pointer -no-cpp-precomp"
	LDFLAGS=
else  # linux
	CFLAGS="-O4 -pedantic -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
	LDFLAGS="-s"
fi

make -j{$CPU_COUNT} \
	prefix=${PREFIX} \
	CC=${CC} \
	MANDIR=${PREFIX}/share/man/man1 \
	CFLAGS="$CFLAGS" \
	LDFLAGS="$LDFLAGS"
