import pygame
import sys

# Initialize Pygame
pygame.init()

# Set up the game window
width, height = 600, 600
win = pygame.display.set_mode((1280, 720))
pygame.display.set_caption("GameHub_Tic Tac Toe")

# Set up the game board
board = [['', '', ''], ['', '', ''], ['', '', '']]
player_turn = 'X'
last_player = 'O'

# Display of player wining
myfont = pygame.font.SysFont("monospace", 130)

# Draw the game board
def draw_board():
    win.fill("black")
    pygame.draw.line(win, "dark grey", (width // 3, 60), (width // 3, height + 60), 5)
    pygame.draw.line(win, "dark grey", (2 * width // 3, 60), (2 * width // 3, height + 60), 5)
    pygame.draw.line(win, "dark grey", (0, height // 3 + 60), (width, height // 3 + 60), 5)
    pygame.draw.line(win, "dark grey", (0, 2 * height // 3 + 60), (width, 2 * height // 3 + 60), 5)

    for row in range(3):
        for col in range(3):
            if board[row][col] == 'X':
                draw_x(row, col)
            elif board[row][col] == 'O':
                draw_o(row, col)

# Draw X at a given row and column
def draw_x(row, col):
    pygame.draw.line(win, "orange", (col * width // 3, row * height // 3 + 60), ((col + 1) * width // 3, (row + 1) * height // 3 + 60), 5)
    pygame.draw.line(win, "orange", ((col + 1) * width // 3, row * height // 3 + 60), (col * width // 3, (row + 1) * height // 3 + 60), 5)

# Draw O at a given row and column
def draw_o(row, col):
    pygame.draw.circle(win, "cyan", ((col * width // 3) + width // 6, (row * height // 3) + height // 6 + 60), width // 6, 5)

# Check if a player has won
def check_winner():
    for i in range(3):
        if board[i][0] == board[i][1] == board[i][2] != '':
            return True
        if board[0][i] == board[1][i] == board[2][i] != '':
            return True
    if board[0][0] == board[1][1] == board[2][2] != '':
        return True
    if board[0][2] == board[1][1] == board[2][0] != '':
        return True
    return False

# Check if the board is full (a tie)
def check_tie():
    for row in board:
        for cell in row:
            if cell == '':
                return False
    return True

# Main game loop
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

        if event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
            # Get the row and column clicked
            mouseX, mouseY = pygame.mouse.get_pos()
            clicked_row = mouseY // (height // 3 + 60)
            clicked_col = mouseX // (width // 3)
       
        

            # Make a move if the clicked cell is empty
            if board[clicked_row][clicked_col] == '':
                board[clicked_row][clicked_col] = player_turn

                if player_turn == 'O':
                    player_turn = 'X'
                else:
                    player_turn = 'O'
                
                if last_player == 'O':
                    last_player = 'X'
                else:
                    last_player = 'O'

        

    draw_board()
    pygame.display.update()

    # Check for a winner or tie
    if check_winner():
        label_player = myfont.render(f"Player {last_player}", 1, "dark grey")
        label_wins = myfont.render("Wins!!", 1, "dark grey")
        win.blit(label_player, (630, 200))
        win.blit(label_wins, (730, 350))

        pygame.display.update()        
        
        print(f"Player {player_turn} wins!")
        pygame.time.delay(3000)
        pygame.quit()
        sys.exit()
    elif check_tie():
        label_draw = myfont.render("Skill", 1, "dark grey")
        label_draw2 = myfont.render("Issues??", 1, "dark grey")
        win.blit(label_draw, (730, 200))
        win.blit(label_draw2, (650, 350))  

        pygame.display.update()  

        print("It's a tie!")
        pygame.time.delay(3000)
        pygame.quit()
        sys.exit()