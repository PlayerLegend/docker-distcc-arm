CROSS_PREFIX=aarch64-linux-gnu-

for file in /usr/bin/aarch64-linux-gnu-*
do
    new_name="$(basename "$file" | sed 's/'"$CROSS_PREFIX"'//g')"
    ln -vs "$file" /usr/lib/distcc/"$new_name"
done
