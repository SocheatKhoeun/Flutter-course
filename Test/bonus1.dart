enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions
  for (var instruction in instructions.split('')) {
    if (instruction == 'R') {
      // Turn right (clockwise)
      direction = Direction.values[(direction.index + 1) % 4];
    } else if (instruction == 'L') {
      // Turn left (counterclockwise)
      direction = Direction.values[(direction.index + 3) % 4];
    } else if (instruction == 'A') {
      // Move forward based on the current direction
      if (direction == Direction.north) {
        y++;  // Move up
      } else if (direction == Direction.east) {
        x++;  // Move right
      } else if (direction == Direction.south) {
        y--;  // Move down
      } else if (direction == Direction.west) {
        x--;  // Move left
      }
    }
  }

  // Print the final position and direction
  print("Final position: ($x, $y)");
  print("Facing: $direction");
}
