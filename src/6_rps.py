import pygame
import sys

# Initialize Pygame
pygame.init()

# Constants
WIDTH, HEIGHT = 1280 , 720
FPS = 60

# Initialize screen
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("GameHub(tm) Rock Paper Scissors")

pygame.display.set_icon(pygame.image.load("res/GH.png"))

# Load the banner image
banner_img = pygame.image.load("res/rps/main_banner.png")
banner_img = pygame.transform.scale(banner_img, (1280, 360)) 

# Load the images for player 1
rock_p1 = pygame.image.load("res/rps/rock_orange.png")
rock_p1 = pygame.transform.scale(rock_p1, (250, 250))
paper_p1 = pygame.image.load("res/rps/paper_orange.png")
paper_p1 = pygame.transform.scale(paper_p1, (250, 250))
scissors_p1 = pygame.image.load("res/rps/scissors_orange.png")
scissors_p1 = pygame.transform.scale(scissors_p1, (250, 250))

# Load the images for player 2
rock_p2 = pygame.image.load("res/rps/rock_cyan.png")
rock_p2 = pygame.transform.scale(rock_p2, (250, 250))
paper_p2 = pygame.image.load("res/rps/paper_cyan.png")
paper_p2 = pygame.transform.scale(paper_p2, (250, 250))
scissors_p2 = pygame.image.load("res/rps/scissors_cyan.png")
scissors_p2 = pygame.transform.scale(scissors_p2, (250, 250))

font = pygame.font.SysFont("calibri monospace", 36)
font_large = pygame.font.SysFont("calibri monospace", 128)

# Game loop
def main():
    running = True
    player1_choice = None
    player2_choice = None

    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    running = False

                # Player 1 controls
                if event.key in [pygame.K_a, pygame.K_d, pygame.K_s]:
                    player1_choice = get_choice_from_key(event.key)

                # Player 2 controls
                if event.key in [pygame.K_j, pygame.K_k, pygame.K_l]:
                    player2_choice = get_choice_from_key(event.key)

        if player1_choice is not None and player2_choice is not None:
            result = determine_winner(player1_choice, player2_choice)
            display_result(player1_choice, player2_choice, result)
            player1_choice = None
            player2_choice = None

        screen.fill("#0D0D0D")
        screen.blit(banner_img,(-15,60))
        
        Player1_text=font.render("Player 1 choose: A-(rock) S-(paper) D-(scissors)",True,"#F66600")
        screen.blit(Player1_text,(50,490))
        
        Player2_text=font.render("Player 2 choose: J-(rock) K-(paper) L-(scissors)",True,"#00A1EA")
        screen.blit(Player2_text,(50,580))

        pygame.display.flip()
        pygame.time.Clock().tick(FPS)

    pygame.quit()

# Function to get the choice from the key pressed
def get_choice_from_key(key):
    if key == pygame.K_a:
        return [rock_p1, "r"]
    elif key == pygame.K_s:
        return [paper_p1, "p"]
    elif key == pygame.K_d:
        return [scissors_p1, "s"]
    elif key == pygame.K_j:
        return [rock_p2, "r"]
    elif key == pygame.K_k:
        return [paper_p2, "p"]
    elif key == pygame.K_l:
        return [scissors_p2, "s"]

# Function to determine the winner
def determine_winner(player1_choice, player2_choice):
    if player1_choice[1] == player2_choice[1]:
        return "It's a tie!"
    elif ((player1_choice[1] == "r" and player2_choice[1] == "s") or (player1_choice[1] == "p" and player2_choice[1] == "r") or (player1_choice[1] == "s" and player2_choice[1] == "p")):
        return "Player 1 wins!"
    else:
        return "Player 2 wins!"

# Function to display the result
def display_result(player1_choice, player2_choice, result):
    screen.fill("#0D0D0D")

    player1_text = font.render(f"Player 1: ", True, "#F66600")
    player2_text = font.render(f"Player 2: ", True, "#00A1EA")

    if result == "Player 1 wins!":
        result_text = font_large.render(result, True, "#F66600")
    elif result == "Player 2 wins!":
        result_text = font_large.render(result, True, "#00A1EA")
    else:
        result_text = font_large.render(result, True, "#FFFFFF")
    
    screen.blit(player1_choice[0],(155, 60))
    screen.blit(player1_text, (50, 170))
    screen.blit(player2_choice[0],(155, 370))
    screen.blit(player2_text, (50, 480))
    screen.blit(result_text, (500, 300))

    pygame.display.flip()
    pygame.time.delay(3000)

# Run the game
if __name__ == "__main__":
    main()