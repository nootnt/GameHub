import numpy as np
import pygame
import sys
import math

ROW_COUNT = 6
COLUMN_COUNT = 7
square_x = (580) // 2 

def creat_board():
    board = np.zeros((ROW_COUNT, COLUMN_COUNT))
    return board

def drop_piece(board, row, col, piece):
    board[row][col - 3] = piece

def is_valid_location(board, col):
    return board[ROW_COUNT-1][col - 3] == 0


def get_next_open_row(board, col):
    for r in range(ROW_COUNT):
        if board[r][col - 3] == 0:
            return r

def print_board(board):
    print(np.flip(board, 0))

def winning_move(board, piece):
    # Chock horizontal locations for win
    for c in range(COLUMN_COUNT-3):
        for r in range(ROW_COUNT):
            if board[r][c] == piece and board[r][c+1] == piece and board[r][c+2] == piece and board[r][c+3] == piece:
                return True
        
    # Chock vertical locations for win
    for c in range(COLUMN_COUNT):
        for r in range(ROW_COUNT-3):
            if board[r][c] == piece and board[r+1][c] == piece and board[r+2][c] == piece and board[r+3][c] == piece:
                return True
    
    # Chock Positively sloped diagonal locations for win
    for c in range(COLUMN_COUNT-3):
        for r in range(ROW_COUNT-3):
            if board[r][c] == piece and board[r+1][c+1] == piece and board[r+2][c+2] == piece and board[r+3][c+3] == piece:
                return True
            
    # Chock Negatively sloped diagonal locations for win
    for c in range(COLUMN_COUNT-3):
        for r in range(3, ROW_COUNT):
            if board[r][c] == piece and board[r-1][c+1] == piece and board[r-2][c+2] == piece and board[r-3][c+3] == piece:
                return True
    
def draw_board(board):
    for c in range(COLUMN_COUNT):
        for r in range(ROW_COUNT):
            pygame.draw.rect(screen,("darkgray"), (c*SQUARESIZE + 290, r*SQUARESIZE + SQUARESIZE, SQUARESIZE, SQUARESIZE))
            pygame.draw.circle(screen, "black",(int(c*SQUARESIZE + 340), int(r*SQUARESIZE + SQUARESIZE + 50)), RADIUS)
    
    for c in range(COLUMN_COUNT):
	    for r in range(ROW_COUNT):
              if board[r][c] == 1:
                pygame.draw.circle(screen, "orange", (int(c*SQUARESIZE + 340), height-int(r*SQUARESIZE + SQUARESIZE - 50 )), RADIUS)
              elif board[r][c] == 2: 
                pygame.draw.circle(screen, "cyan", (int(c*SQUARESIZE + 340), height-int(r*SQUARESIZE + SQUARESIZE - 50)), RADIUS)
    pygame.display.update()


board = creat_board()
print_board(board)
game_over = False
turn = 0

pygame.init()

SQUARESIZE = 100

width = COLUMN_COUNT * SQUARESIZE
height = (ROW_COUNT+1) * SQUARESIZE

size = (width, height)

RADIUS = 44

screen = pygame.display.set_mode((1280,720))
draw_board(board)
pygame.display.update()

myfont = pygame.font.SysFont("monospace", 75)


mouse_x, mouse_y = pygame.mouse.get_pos()

locked_positions = [340,440,540,640,740,840,940]

player_x = mouse_x
player_y = 53

# Lock X position to specific values
for pos in locked_positions:
    if pos - 50 <= mouse_x <= pos + 50:
        player_x = pos
    elif(mouse_x < 290):
        player_x = pos - 600
    elif(mouse_x > 990):
        player_x = pos

while not game_over:

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()

        if event.type == pygame.MOUSEMOTION:
            pygame.draw.rect(screen, "black", (290, 0, width, SQUARESIZE))
            player_x = event.pos[0]
            
            if turn == 0:
                pygame.draw.circle(screen, "orange", (int(player_x), int(player_y)), RADIUS)
            else: 
                pygame.draw.circle(screen, "cyan", (int(player_x), int(player_y)), RADIUS)
                          

        pygame.display.update()
            
        if event.type == pygame.MOUSEBUTTONDOWN:
            pygame.draw.rect(screen, "black", (290,0, width, SQUARESIZE))
            
            #Ask for player 1 input
            if turn == 0:
                player_x = event.pos[0]
                col = int(math.floor(player_x/SQUARESIZE))

                if is_valid_location(board, col):
                    row = get_next_open_row(board, col)
                    drop_piece(board, row, col, 1)

                    if winning_move(board, 1):
                        label = myfont.render("Player 1 wins!!", 1, "orange")
                        screen.blit(label, (300,10))
                        game_over = True



            #Ask for player 2 input
            else:
                player_x = event.pos[0]
                col = int(math.floor(player_x/SQUARESIZE))
                
                if is_valid_location(board, col ):
                    row = get_next_open_row(board, col )
                    drop_piece(board, row, col , 2)

                    if winning_move(board, 2):
                        label = myfont.render("Player 2 wins!!", 2, "cyan")
                        screen.blit(label, (300,10))
                        game_over = True
            
            
            print_board(board)
            draw_board(board)
            turn += 1
            turn = turn % 2
            if game_over:
                pygame.time.wait(1000)