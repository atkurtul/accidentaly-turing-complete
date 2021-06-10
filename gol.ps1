

param ($count)
$arr = ls frames | % { $_.name.substring(3) -as [int] } | sort

python gol.py
$arr[-1]..($arr[-1]+$count) | % {$i = $_; $j = $i + 1; odin run . -define:IN="frames/gol$i" -define:OUT="frames/gol$j" }
python anim.py