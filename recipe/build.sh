if [[ $(uname) == "Darwin" ]]; then
	CFLAGS="-O3 -std=c11 -pedantic -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
	LDFLAGS=
else  # linux
	CFLAGS="-O3 -pedantic -Wall -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
	LDFLAGS="-s"
fi

make -j ${CPU_COUNT} \
	PREFIX=${PREFIX} \
	CC=${CC} \
	MANDIR=${PREFIX}/share/man/man1 \
	CFLAGS="$CFLAGS" \
	LDFLAGS="$LDFLAGS"

make -j ${CPU_COUNT} \
	PREFIX=${PREFIX} \
	MANDIR=${PREFIX}/share/man/man1 \
	install
