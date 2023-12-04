import pygame
import sys

# Constants
ROW_COUNT = 6
COLUMN_COUNT = 7
BLUE = (0, 0, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
YELLOW = (255, 255, 0)
SQUARE_SIZE = 100
RADIUS = int(SQUARE_SIZE / 2 - 5)


def create_board():
    board = [[0 for _ in range(COLUMN_COUNT)] for _ in range(ROW_COUNT)]
    return board


def draw_board(board):
    for col in range(COLUMN_COUNT):
        for row in range(ROW_COUNT):
            pygame.draw.rect(
                screen,
                BLUE,
                (
                    col * SQUARE_SIZE,
                    (row + 1) * SQUARE_SIZE,
                    SQUARE_SIZE,
                    SQUARE_SIZE,
                ),
            )
            pygame.draw.circle(
                screen,
                BLACK,
                (
                    int(col * SQUARE_SIZE + SQUARE_SIZE / 2),
                    int((row + 1) * SQUARE_SIZE + SQUARE_SIZE / 2),
                ),
                RADIUS,
            )

    for col in range(COLUMN_COUNT):
        for row in range(ROW_COUNT):
            if board[row][col] == 1:
                pygame.draw.circle(
                    screen,
                    RED,
                    (
                        int(col * SQUARE_SIZE + SQUARE_SIZE / 2),
                        height - int(row * SQUARE_SIZE + SQUARE_SIZE / 2),
                    ),
                    RADIUS,
                )
            elif board[row][col] == 2:
                pygame.draw.circle(
                    screen,
                    YELLOW,
                    (
                        int(col * SQUARE_SIZE + SQUARE_SIZE / 2),
                        height - int(row * SQUARE_SIZE + SQUARE_SIZE / 2),
                    ),
                    RADIUS,
                )
    pygame.display.update()


def drop_piece(board, row, col, piece):
    board[row][col] = piece


def is_valid_location(board, col):
    return board[ROW_COUNT - 1][col] == 0


def get_next_open_row(board, col):
    for r in range(ROW_COUNT):
        if board[r][col] == 0:
            return r


def winning_move(board, piece):
    # Check horizontal locations
    for c in range(COLUMN_COUNT - 3):
        for r in range(ROW_COUNT):
            if (
                board[r][c] == piece
                and board[r][c + 1] == piece
                and board[r][c + 2] == piece
                and board[r][c + 3] == piece
            ):
                return True

    # Check vertical locations
    for c in range(COLUMN_COUNT):
        for r in range(ROW_COUNT - 3):
            if (
                board[r][c] == piece
                and board[r + 1][c] == piece
                and board[r + 2][c] == piece
                and board[r + 3][c] == piece
            ):
                return True

    # Check positively sloped diagonals
    for c in range(COLUMN_COUNT - 3):
        for r in range(ROW_COUNT - 3):
            if (
                board[r][c] == piece
                and board[r + 1][c + 1] == piece
                and board[r + 2][c + 2] == piece
                and board[r + 3][c + 3] == piece
            ):
                return True

    # Check negatively sloped diagonals
    for c in range(COLUMN_COUNT - 3):
        for r in range(3, ROW_COUNT):
            if (
                board[r][c] == piece
                and board[r - 1][c + 1] == piece
                and board[r - 2][c + 2] == piece
                and board[r - 3][c + 3] == piece
            ):
                return True

    return False


pygame.init()
width = COLUMN_COUNT * SQUARE_SIZE
height = (ROW_COUNT + 1) * SQUARE_SIZE
size = (width, height)
screen = pygame.display.set_mode(size)
my_font = pygame.font.SysFont("monospace", 75)

board = create_board()
draw_board(board)
pygame.display.update()

game_over = False
turn = 0

while not game_over:

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()

        if event.type == pygame.MOUSEMOTION:
            pygame.draw.rect(screen, BLACK, (0, 0, width, SQUARE_SIZE))
            posx = event.pos[0]
            if turn == 0:
                pygame.draw.circle(
                    screen, RED, (posx, int(SQUARE_SIZE / 2)), RADIUS
                )
            else:
                pygame.draw.circle(
                    screen, YELLOW, (posx, int(SQUARE_SIZE / 2)), RADIUS
                )
            pygame.display.update()

        if event.type == pygame.MOUSEBUTTONDOWN:
            posx = event.pos[0]
            col = int(posx // SQUARE_SIZE)

            if is_valid_location(board, col):
                row = get_next_open_row(board, col)
                drop_piece(board, row, col, turn + 1)

                if winning_move(board, turn + 1):
                    if turn == 0:
                        label = my_font.render(
                            "Player 1 wins!!", 1, RED
                        )
                    else:
                        label = my_font.render(
                            "Player 2 wins!!", 1, YELLOW
                        )
                    screen.blit(label, (40, 10))
                    game_over = True

                draw_board(board)
                pygame.display.update()
                turn += 1
                turn %= 2

                if game_over:
                    pygame.time.wait(3000)
