import pygame
import random

# Initialize Pygame
pygame.init()

# Constants
WIDTH, HEIGHT = 300, 600
GRID_SIZE = 30
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Tetromino shapes
SHAPES = [
    [[1, 1, 1, 1]],
    [[1, 1, 1],
     [1]],
    [[1, 1, 1],
     [0, 0, 1]],
    [[1, 1, 1],
     [0, 1]],
    [[1, 1],
     [1, 1]],
    [[1, 1, 0],
     [0, 1, 1]],
    [[0, 1, 1],
     [1, 1]]
]

# Initialize game variables
screen = pygame.display.set_mode((WIDTH, HEIGHT))
clock = pygame.time.Clock()
fps = 10
running = True

def draw_grid():
    for x in range(0, WIDTH, GRID_SIZE):
        pygame.draw.line(screen, WHITE, (x, 0), (x, HEIGHT))
    for y in range(0, HEIGHT, GRID_SIZE):
        pygame.draw.line(screen, WHITE, (0, y), (WIDTH, y))

def draw_tetromino(tetromino, x, y):
    for row in range(len(tetromino)):
        for col in range(len(tetromino[row])):
            if tetromino[row][col]:
                pygame.draw.rect(screen, WHITE, (x + col * GRID_SIZE, y + row * GRID_SIZE, GRID_SIZE, GRID_SIZE))

def check_collision(board, tetromino, x, y):
    for row in range(len(tetromino)):
        for col in range(len(tetromino[row])):
            if (tetromino[row][col] and (row + y >= len(board) or col + x >= len(board[0]) or board[row + y][col + x] != 0)):
                return True
    return False

def merge_tetromino(board, tetromino, x, y):
    for row in range(len(tetromino)):
        for col in range(len(tetromino[row])):
            if tetromino[row][col]:
                board[row + y][col + x] = 1

def clear_rows(board):
    full_rows = [i for i, row in enumerate(board) if all(cell == 1 for cell in row)]
    for row in full_rows:
        del board[row]
        board.insert(0, [0] * (WIDTH // GRID_SIZE))
    return len(full_rows)

def main():
    global running

    current_tetromino = random.choice(SHAPES)
    current_x = WIDTH // (2 * GRID_SIZE) - len(current_tetromino[0]) // 2
    current_y = 0

    board = [[0] * (WIDTH // GRID_SIZE) for _ in range(HEIGHT // GRID_SIZE)]

    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT and not check_collision(board, current_tetromino, current_x - 1, current_y):
                    current_x -= 1
                elif event.key == pygame.K_RIGHT and not check_collision(board, current_tetromino, current_x + 1, current_y):
                    current_x += 1
                elif event.key == pygame.K_DOWN and not check_collision(board, current_tetromino, current_x, current_y + 1):
                    current_y += 1

        if not check_collision(board, current_tetromino, current_x, current_y + 1) and current_y + len(current_tetromino) < len(board) - 1:
            current_y += 1
        else:
            if current_y == 0:  # Check if blocks reached the top
                print("Game Over! Blocks reached the top.")
                running = False

            merge_tetromino(board, current_tetromino, current_x, current_y)
            cleared_rows = clear_rows(board)
            print(f"Cleared {cleared_rows} rows")
            current_tetromino = random.choice(SHAPES)
            current_x = WIDTH // (2 * GRID_SIZE) - len(current_tetromino[0]) // 2
            current_y = 0

        screen.fill(BLACK)
        draw_grid()
        draw_tetromino(current_tetromino, current_x * GRID_SIZE, current_y * GRID_SIZE)
        for row in range(len(board)):
            for col in range(len(board[row])):
                if board[row][col]:
                    pygame.draw.rect(screen, WHITE, (col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE))

        pygame.display.flip()
        clock.tick(fps)

    pygame.quit()

if __name__ == "__main__":
    main()
