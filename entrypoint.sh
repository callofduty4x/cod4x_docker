#!/usr/bin/env sh


# Give parameters in server.cfg directly to the client

# Remove Lines starting with "//"
# Remove trailing comments on lines (content //comment)
# Remove blank lines
# set -> +set
# map -> +map

CFG_LINES=$(sed '/^\/\//d ; s/\/\/.*$//; /^\s*$/d; s/\n//g; s/^set/+set/g; s/^map/+map/g' ./server.cfg)
for CFG_ITEM in $CFG_LINES
do
    FULL_CFG="${FULL_CFG} ${CFG_ITEM}"
done

echo "/server/cod4x18_dedrun $FULL_CFG"
sleep 3
./cod4x18_dedrun $FULL_CFG
sleep 3