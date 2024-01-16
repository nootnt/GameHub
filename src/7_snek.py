import pygame
import sys
import random

# Init pygame
pygame.init()

# Define constant variables
WIDTH, HEIGHT = 1280, 720
CELL_SIZE = 20
FPS = 18

class Snake:
    def __init__(self):
        self.body = [(100, 100), (90, 100), (80, 100)]
        self.direction = (1, 0)

    def move(self):
        head = (self.body[0][0] + self.direction[0] * CELL_SIZE, self.body[0][1] + self.direction[1] * CELL_SIZE)
        self.body = [head] + self.body[:-1]

    def grow(self):
        self.body.append((0, 0))  # The new tail segment

    def check_collision(self):
        return self.body[0] in self.body[1:]

    def check_boundary(self):
        x, y = self.body[0]
        return not (0 <= x < WIDTH and 0 <= y < HEIGHT)

class Food:
    def __init__(self):
        self.position = (0, 0)
        self.spawn_food()

    def spawn_food(self):
        x = random.randint(0, (WIDTH - CELL_SIZE) // CELL_SIZE) * CELL_SIZE
        y = random.randint(0, (HEIGHT - CELL_SIZE) // CELL_SIZE) * CELL_SIZE
        self.position = (x, y)

# Initialize the game window
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("GameHub(tm) Snake Game")
clock = pygame.time.Clock()

# set window icon
ico = pygame.image.load("res/GH.png")
pygame.display.set_icon(ico)

# Initialize the snake and food
snake = Snake()
food = Food()

# Game loop
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP and snake.direction != (0, 1):
                snake.direction = (0, -1)
            elif event.key == pygame.K_DOWN and snake.direction != (0, -1):
                snake.direction = (0, 1)
            elif event.key == pygame.K_LEFT and snake.direction != (1, 0):
                snake.direction = (-1, 0)
            elif event.key == pygame.K_RIGHT and snake.direction != (-1, 0):
                snake.direction = (1, 0)

    # Move the snake
    snake.move()

    # Check for collisions
    if snake.check_collision() or snake.check_boundary():
        pygame.quit()
        sys.exit()

    # Check if the snake ate the food
    if snake.body[0] == food.position:
        snake.grow()
        food.spawn_food()

    # Draw everything
    screen.fill("#0D0D0D")

    # Draw the snake
    for segment in snake.body:
        pygame.draw.rect(screen, "#F66600", (segment[0], segment[1], CELL_SIZE, CELL_SIZE))

    # Draw the food
    pygame.draw.rect(screen, "#00A1EA", (food.position[0], food.position[1], CELL_SIZE, CELL_SIZE))

    # Update the display
    pygame.display.flip()

    # Cap the frame rate
    clock.tick(FPS)
