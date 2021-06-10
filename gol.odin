package gol

H:uint:#config(H,32);
W:uint:#config(W,32);

S:cstring:#config(IN, "gol0");
O:cstring:#config(OUT,"gol1");

FILE::#load(S);

point::proc($x, $y:uint) -> [FILE[size_of([x + y * W]u8)] - '0']u8 {
  return {};
}

neighbours::proc($x,$y:uint) -> [
  size_of(point(size_of([(x + W - 1) % W]u8) % W, size_of([(y + H - 1) % H]u8))) + 
  size_of(point(size_of([(x + W - 1) % W]u8) % W, size_of([(y + H + 0) % H]u8))) + 
  size_of(point(size_of([(x + W - 1) % W]u8) % W, size_of([(y + H + 1) % H]u8))) +
  size_of(point(size_of([(x + W + 0) % W]u8) % W, size_of([(y + H - 1) % H]u8))) + 
  // size_of(point(size_of([(x + W + 0) % W]u8) % W, size_of([(y + H + 0) % H]u8))) + 
  size_of(point(size_of([(x + W + 0) % W]u8) % W, size_of([(y + H + 1) % H]u8))) +
  size_of(point(size_of([(x + W + 1) % W]u8) % W, size_of([(y + H - 1) % H]u8))) + 
  size_of(point(size_of([(x + W + 1) % W]u8) % W, size_of([(y + H + 0) % H]u8))) + 
  size_of(point(size_of([(x + W + 1) % W]u8) % W, size_of([(y + H + 1) % H]u8)))]u8 
{
  return {};
}

inrange::proc($x,$lo,$hi:uint) -> [0 when(size_of([x]u8) < size_of([lo]u8) || size_of([x]u8) > size_of([hi]u8)) else 1]u8 {
  return {};
}


state::proc($x,$y:uint) -> [size_of(inrange(size_of(neighbours(size_of([x]u8), size_of([y]u8))), 3 - size_of(point(size_of([x]u8), size_of([y]u8))), 3)) + '0']u8 {
  return {};
}

next  := NEXT;

main::proc() {
  foreign {
    fopen_s::proc"c"(rawptr, cstring, cstring) ---;
    fwrite::proc"c"(rawptr, int, int, rawptr) ---;
    fclose::proc"c"(rawptr) ---;
  }
  f:rawptr;
  fopen_s(&f, O, "w");
  fwrite(cast(rawptr)&next, 1, int(W * H), f);
  fclose(f);
}