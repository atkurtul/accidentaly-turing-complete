gol  = open("./frames/gol0", "w") 
next = open("next.odin", "w") 

WIDTH =32
HEIGHT=32

states = [[0 for _ in range(0,HEIGHT)]for _ in range(0,WIDTH)]

states[5][5] = 1
states[5][6] = 0
states[5][7] = 0
states[6][5] = 0
states[6][6] = 1
states[6][7] = 1
states[7][5] = 1
states[7][6] = 1
states[7][7] = 0

for row in states:
  for cell in row:
    print(cell,end="",file=gol)


row = []
for i in range(0, WIDTH):
  col = []
  for j in range(0, HEIGHT):
    col.append(f"size_of(state({hex(i)},{hex(j)}))")
  row.append(f'\t{{{",".join(col)}}},')

print("package gol;",file=next)
print("NEXT::[W][H]u8 {",file=next)
print("\n".join(row),file=next)
print("};",file=next)