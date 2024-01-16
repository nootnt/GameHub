import numpy as np
import pygame
import sys
import math

ROW_COUNT = 6
COLUMN_COUNT = 7
square_x = (580) // 2 

def create_board():
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
    # Check horizontal locations for win
    for c in range(COLUMN_COUNT-3):
        for r in range(ROW_COUNT):
            if board[r][c] == piece and board[r][c+1] == piece and board[r][c+2] == piece and board[r][c+3] == piece:
                return True
        
    # Check vertical locations for win
    for c in range(COLUMN_COUNT):
        for r in range(ROW_COUNT-3):
            if board[r][c] == piece and board[r+1][c] == piece and board[r+2][c] == piece and board[r+3][c] == piece:
                return True
    
    # Check diagonal locations for win
    for c in range(COLUMN_COUNT-3):
        for r in range(ROW_COUNT-3):
            if board[r][c] == piece and board[r+1][c+1] == piece and board[r+2][c+2] == piece and board[r+3][c+3] == piece:
                return True

    for c in range(COLUMN_COUNT-3):
        for r in range(3, ROW_COUNT):
            if board[r][c] == piece and board[r-1][c+1] == piece and board[r-2][c+2] == piece and board[r-3][c+3] == piece:
                return True
    
def draw_board(board): # Board update function
    for c in range(COLUMN_COUNT):
        for r in range(ROW_COUNT):
            pygame.draw.rect(screen,("#ffffff"), (c*SQUARESIZE + 290, r*SQUARESIZE + SQUARESIZE, SQUARESIZE, SQUARESIZE)) # white
            pygame.draw.circle(screen, "#0D0D0D",(int(c*SQUARESIZE + 340), int(r*SQUARESIZE + SQUARESIZE + 50)), RADIUS) # black
    
    for c in range(COLUMN_COUNT):
	    for r in range(ROW_COUNT):
              if board[r][c] == 1:
                pygame.draw.circle(screen, "#F66600", (int(c*SQUARESIZE + 340), height-int(r*SQUARESIZE + SQUARESIZE - 50 )), RADIUS) # orange
              elif board[r][c] == 2: 
                pygame.draw.circle(screen, "#00A1EA", (int(c*SQUARESIZE + 340), height-int(r*SQUARESIZE + SQUARESIZE - 50)), RADIUS) # cyan
    pygame.display.update()

# Define all values
board = create_board()
print_board(board)
game_over = False
turn = 0
SQUARESIZE = 100

width = COLUMN_COUNT * SQUARESIZE
height = (ROW_COUNT+1) * SQUARESIZE
size = (width, height)
RADIUS = 44

# Game init
pygame.init()
screen = pygame.display.set_mode((1280,720))
draw_board(board)
pygame.display.update()
pygame.display.set_caption("GameHub(tm) Connect 4")

# set window icon
ico = pygame.image.load("res/GH.png")
pygame.display.set_icon(ico)

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
            pygame.draw.rect(screen, "#0D0D0D", (290, 0, width, SQUARESIZE)) # black
            player_x = event.pos[0]
            
            if turn == 0:
                pygame.draw.circle(screen, "#F66600", (int(player_x), int(player_y)), RADIUS) # orange
            else: 
                pygame.draw.circle(screen, "#00A1EA", (int(player_x), int(player_y)), RADIUS) # cyan
                          

        pygame.display.update()
            
        if event.type == pygame.MOUSEBUTTONDOWN:
            pygame.draw.rect(screen, "#0D0D0D", (290,0, width, SQUARESIZE)) # black
            
            #Ask for player 1 input
            if turn == 0:
                player_x = event.pos[0]
                col = int(math.floor(player_x/SQUARESIZE))

                if is_valid_location(board, col):
                    row = get_next_open_row(board, col)
                    drop_piece(board, row, col, 1)

                    if winning_move(board, 1):
                        label = myfont.render("Player 1 wins!!", 1, "#F66600") # orange
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
                        label = myfont.render("Player 2 wins!!", 2, "#00A1EA") # cyan
                        screen.blit(label, (300,10))
                        game_over = True
            
            
            print_board(board)
            draw_board(board)
            turn += 1
            turn = turn % 2
            if game_over:
                pygame.time.wait(1000)