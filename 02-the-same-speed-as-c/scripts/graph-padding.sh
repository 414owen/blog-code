#!/usr/bin/env bash

upto=100
data_file=padding-v-runtime

# for i in $(seq 0 ${upto}); do
# 	echo "building $i source"
# 	cat loop-8.x64.s | awk "/NOOPS/{for(n=0; n < ${i}; n++) print \"    nop\"; next} //{print}" > loop-8-${i}.x64.s
# 	echo "building $i"
# 	make bench-x64-8-${i}
# done

{ for i in $(seq 0 ${upto}); do
	2>&1 command time -f '%e' ./bench-x64-8-${i} 1000 3 >/dev/null
done } > ${data_file}

gnuplot -p -e "
	set terminal svg;
	stats '${data_file}' name \"A\";
	set loadpath './scripts/plot';
	load 'grid.cfg';
	load 'xyborder.cfg';
	set key textcolor '#eeeeee';
	set yrange [0:A_max + 0.2];
	set xrange [*:*] noextend;
	plot '${data_file}' lt rgb '#5577dd' lw 3 with lines;
" > padding-graph.svg
