
function convert2jpg() { for i in $*; do convert $i ${i%.*}.jpg; done; }
function convert2png() { for i in $*; do convert $i ${i%.*}.png; done; }
# Usage: <width>
function scalejpg() { 
  for i in `ls *.jpg -1`; do echo $i ; convert -scale $1 $i ${i%.*}.sized.jpg; done
}
